# Ievades ģeodati  {#Chapter3}

Nozīmīgs solis sugu izplatības modelēšanā ir ģeogrāfiskajai telpai piesaistītu (ģeoreferencētu) vidi raksturojošu un ekoloģiski pamatotu mainīgo jeb ekoģeogrāfisko mainīgo (EGV) sagatavošana. Visbiežāk eksistējošie ģeodati (ģeoreferencēti vides raksturojumi) paši par sevi nespēj raksturot sugu ekoloģiskās vajadzības, gandrīz nekad to noformējums precīzi neatbilst analīzes uzstādījumiem. Tādēļ ģeodatu ir nepieciešams dažādi pārveidot, strukturēt un kombinēt.

Šajā nodaļā ir raksturoti izmantotie ģeodati un to pirmās apstrādes soļi (harmonizēšana EGV sagatavošanai) raksturota apakšnodaļā [Ievades jēldati](#Chapter3.1), augstāka līmeņa šo datu apstrāde, kas vēl joprojām uzskatāma par soli pirms EGV sagatavošanas, raksturota apakšnodaļā [Ievades produkti](#Chapter3.2)

## Ievades jēldati {#Chapter3.1}

Izmantotie ģeodatu avoti, to raksturojums un harmonizēšanas procedūru apraksts.

### Valsts meža dienesta Meža valsts reģistrs {#Chapter3.1.1}

Meža nogabalus raksturojošos rādītājus un telpiskos datus apkopojošā Valsts meža dienesta Meža valsts reģistra datubāzes (ESRI failu ģeodatubāze) 2024. gada 07. jānvāra versija ir 2024. gada janvārī saņemta Latvijas Universitātē studiju un pētniecības procesu nodrošināšanai. Saņemtās datubāzes versijas struktūra sakrīt ar [Meža valsts reģistra Meža inventarizācijas failu struktūru](https://www.vmd.gov.lv/lv/meza-valsts-registra-meza-inventarizacijas-failu-struktura), bet lauku nosaukumos ir lietoti mazie burti. 

Pēc lejupielādes nodrošinātas ģeometrijas, tās pārbaudītas un saglabātas *geoparquet* formātā.


``` r
# libs
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(gdalUtilities)) {install.packages("gdalUtilities"); require(gdalUtilities)}

# datubāze
nog=read_sf("./VMD.gdb/",layer="Nogabali_pilna_datubaze")

# ģeometriju nodrošināšana
ensure_multipolygons <- function(X) {
  tmp1 <- tempfile(fileext = ".gpkg")
  tmp2 <- tempfile(fileext = ".gpkg")
  st_write(X, tmp1)
  ogr2ogr(tmp1, tmp2, f = "GPKG", nlt = "MULTIPOLYGON")
  Y <- st_read(tmp2)
  st_sf(st_drop_geometry(X), geom = st_geometry(Y))
}
nogabali <- ensure_multipolygons(nog)

# ģeometriju pārbaudes 
nogabali2 = nogabali[!st_is_empty(nogabali),,drop=FALSE] # 108 tukšas ģeometrijas
validity=st_is_valid(nogabali2) 
table(validity) # 1733 invalid ģeometrijas
nogabali3=st_make_valid(nogabali2)

# saglabāšana
sfarrow::st_write_parquet(nogabali3, "nogabali.parquet")
```


<br>



### Lauku Atbalsta Dienesta lauku informācija {#Chapter3.1.2}

Lauku Atbalsta Dienests uztur [regulāri aktualizētu informāciju atvērto datu portālā](https://data.gov.lv/dati/lv/organization/lad). Tajā ir pieejams arī arhīvs (kopš 2015. gada), izmantojamās datu kopas satur atslēgvārdu "deklarētās platības". Šī projekta ietvaros izmantots WFS pieslēgums datu lejupielādei (2023-11-14).

Pēc lejupielādes nodrošinātas ģeometrijas, tās pārbaudītas, dzēšot tukšās un validējot pārējās, un saglabātas *geoparquet* formātā.


``` r
# libs
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(gdalUtilities)) {install.packages("gdalUtilities"); require(gdalUtilities)}
if(!require(httr)) {install.packages("httr"); require(httr)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(ows4R)) {install.packages("ows4R"); require(ows4R)}

# lejupielāde
wfs_bwk <- "https://karte.lad.gov.lv/arcgis/services/lauki/MapServer/WFSServer"
url <- parse_url(wfs_bwk)
url$query <- list(service = "wfs",
                  #version = "2.0.0", # fakultatīvi
                  request = "GetCapabilities"
)
vaicajums <- build_url(url)

bwk_client <- WFSClient$new(wfs_bwk, 
                            serviceVersion = "2.0.0")
bwk_client$getFeatureTypes() %>%
  map_chr(function(x){x$getTitle()})

dati <- read_sf(vaicajums)

# multipoligoni
ensure_multipolygons <- function(X) {
  tmp1 <- tempfile(fileext = ".gpkg")
  tmp2 <- tempfile(fileext = ".gpkg")
  st_write(X, tmp1)
  ogr2ogr(tmp1, tmp2, f = "GPKG", nlt = "MULTIPOLYGON")
  Y <- st_read(tmp2)
  st_sf(st_drop_geometry(X), geom = st_geometry(Y))
}
dati2 <- ensure_multipolygons(dati)

# pārbaudes
dati3 = dati2[!st_is_empty(dati2),,drop=FALSE] # OK
validity=st_is_valid(dati3) 
table(validity) # OK

# saglabāšana
sfarrow::st_write_parquet(dati3, "LAD_lauki.parquet")
```

<br>



### LĢIA topogrāfiskā karte {#Chapter3.1.3}

Latvijas Ģeotelpiskās informācijas aģentūras topogrāfiskās kartes M:10000 vekotrodatu ģeodatubāze studiju un pētniecības procesu nodrošināšanai Latvijas Universitātē saņemta 2016. gada jūlijā pēc licences līguma noslēgšanas. Tās aktālizēta (tas ir nepārtraukts process) versija ir pieejama [publiskai apskatei](https://kartes.lgia.gov.lv/karte/), bet vektordatu pieejamība ir ierobežota. 

Šajā projektā izmantoti sekojoši slāņi:

- `bride_L`, kurā raksturoti 3928 tilti kā linijveida objekti;

- `bridge_P`, kurā raksturoti 4551 tilti kā punktveida objekti

- `hidro_A`, kurā raksturoti 264439 ūdensobjektu plankumi;

- `hidro_L`, kurā raksturots grāvju tīkls un mazās upes;

- `landus_A`, kurā raksturots zemes segums un lietojums ar 1291781 laukumveida ģeometriju;

- `road_A`, kurā raksturoti 32094 ceļi, kas atzīmēti ar laukumu;

- `road_L`, kurā raksturoti dažāda platuma, tajā skaitā relatīvi šauri ceļi un takas;

- `swamp_A`, kurā raksturoti augstie purvi ar 48105 laukumveida objektu;

- `flora_L`, kurā raksturoti līnijveida koku un krūmu objekti,

kuri pārveidoti par *geoparquet*. Failu formāta maiņas ietvaros pārbaudītas ģeometrijas (tukšās, to validitāte, kas nepieciešamības gadījumā labota).


``` r
# libs
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}


# flora_L 
flora_L=st_read("./Topo10_v3_12_07_2016.gdb/",layer="flora_L")
flora2 = flora_L[!st_is_empty(flora_L),,drop=FALSE] # OK
validity=st_is_valid(flora2) 
table(validity) # 12 invalid geometrijas
sfarrow::st_write_parquet(flora2, "./Topo_floraL.parquet")


# hidro A
hidro_A=st_read("./Topo10_v3_12_07_2016.gdb/",layer="hidro_A")
hidro2 = hidro_A[!st_is_empty(hidro_A),,drop=FALSE] # OK
validity=st_is_valid(hidro2) 
table(validity) # 12 invalid geometrijas
hidro3=st_make_valid(hidro2)
sfarrow::st_write_parquet(hidro3, "Topo_hidroA.parquet")

# hidro L
hidro_L=st_read("./Topo10_v3_12_07_2016.gdb/",layer="hidro_L")
table(hidro_L$FNAME,useNA="always")
hidro_Lx=hidro_L %>% 
  filter(FNAME=="Ūdenstece līdz 3m") # grāvji
hidro_Lx2 = hidro_Lx[!st_is_empty(hidro_Lx),,drop=FALSE] # OK
validity=st_is_valid(hidro_Lx) 
table(validity) # OK
sfarrow::st_write_parquet(hidro_Lx, "./Topo_hidroL.parquet")

# road A
road_A=st_read("./Topo10_v3_12_07_2016.gdb/",layer="road_A")
road2 = road_A[!st_is_empty(road_A),,drop=FALSE] # OK
validity=st_is_valid(road2) 
table(validity) # 28 invalid geometrijas
road3=st_make_valid(road2)
sfarrow::st_write_parquet(road3, "Topo_roadA.parquet")

# road L
road_L=st_read("./Topo10_v3_12_07_2016.gdb/",layer="road_L")
table(road_L$FNAME,useNA="always")
road_Lx=road_L %>% 
  filter(FNAME!="Gājēju celiņš līdz 3m") %>% # ne pavisam sīkie
  filter(FNAME!="Gājēju celiņš mērogā") %>% 
  filter(FNAME!="Taka")
roadL2 = road_Lx[!st_is_empty(road_Lx),,drop=FALSE] # OK
validity=st_is_valid(roadL2) 
table(validity) # OK
sfarrow::st_write_parquet(roadL2, "Topo_roadL.parquet")

# swamp A
swamp_A=st_read("./Topo10_v3_12_07_2016.gdb/",layer="swamp_A")
swamp2 = swamp_A[!st_is_empty(swamp_A),,drop=FALSE] # OK
validity=st_is_valid(swamp2) 
table(validity) # 17 invalid geometrijas
swamp3=st_make_valid(swamp2)
sfarrow::st_write_parquet(swamp3, "Topo_swampA.parquet")

# bridge_L
bridge_L=st_read("./Topo10_v3_12_07_2016.gdb/",layer="bridge_L")
bridgeL2 = bridge_L[!st_is_empty(bridge_L),,drop=FALSE] # OK
validity=st_is_valid(bridgeL2) 
table(validity) # OK
sfarrow::st_write_parquet(bridgeL2, "Topo_bridgeL.parquet")

# bridge_P
bridge_P=st_read("./Topo10_v3_12_07_2016.gdb/",layer="bridge_P")
bridgeP2 = bridge_P[!st_is_empty(bridge_P),,drop=FALSE] # OK
validity=st_is_valid(bridgeP2) 
table(validity) # OK
sfarrow::st_write_parquet(bridgeP2, "Topo_bridgeP.parquet")

# landus A
landus_A=st_read("./Topo10_v3_12_07_2016.gdb/",layer="landus_A")
landus2 = landus_A[!st_is_empty(landus_A),,drop=FALSE] # OK
validity=st_is_valid(landus2) 
table(validity) # 5734 invalid geometrijas
landus3=st_make_valid(landus2)
sfarrow::st_write_parquet(landus3, "Topo_landusA.parquet")
```

<br>


### Meliorācijas Kadastra Informācijas Sistēmas datubāze {#Chapter3.1.4}

Meliorācijas Kadastra Informācijas Sistēmas datubāze 2018. gada jūnijā pēc pieprasījuma no Latvijas Universitātes studiju un pētniecības procesu nodrošināšanai saņemta no Zemkopības ministrijas nekustamo īpašumu daļas. Tās saturs pieejams [publiskai apskatei](https://www.melioracija.lv/?loc=540414;308053;1).

Sākotnēji papildus apstrāde šiem datiem nav veikta. Tie izmantoti [Ievades produkti](#Chapter3.2) sagatavošanai - gan [Reljefa produkti](#Chapter3.2.1), gan [Ainava](#Chapter3.2.2) sagatavošanai.

### LVM atvērtie dati {#Chapter3.1.5}

[AS “Latvijas valsts meži” meža infrastruktūras ģeotelpiskie dati un to apraksts](https://data.gov.lv/dati/lv/dataset/as-latvijas-valsts-mezi-mezsaimniecibas-infrastruktura). No šīs datu kopas projektā izmantoti:

- ceļi:

  - meža ceļi;
  
  - attīstāmie meža ceļi;
  
  - apgriešanās laukumi;
  
  - izmainīšanās vietas;
  
  - nobrauktuves;

- meliorācijas sistēmas:

  - grāvji;
  
  - meliorācijas sistēmas;
  
  - atjaunojamie meliorācijas objekti.

Sākotnēji papildus apstrāde šiem datiem nav veikta. Tie izmantoti [Ievades produkti](#Chapter3.2) (specifiskāk, [Ainava](#Chapter3.2.2)) sagatavošanai.

### Corine Land Cover {#Chapter3.1.6}

Corine Land Cover ir publiski pieejami ģeodati, kas raksturo zemes seguma un lietojuma veidu (LULC) visā aptverot visu Eiropu ilgā laika periodā ar kopumā nemainīgu (salīdzināmu) metodiku (https://land.copernicus.eu/content/corine-land-cover-nomenclature-guidelines/docs/pdf/CLC2018_Nomenclature_illustrated_guide_20190510.pdf), sniedzot rezultātus atsevišķiem gadiem - 1990., 2000., 2006., 2012., 2018. (https://land.copernicus.eu/en/products/corine-land-cover). Lai gan datu kopa ir rupjas izšķirtspēja - kartējamā vienība ir 25 ha laukumi, kas ir vismaz 100 m plati, tā sniedz pietiekošu informāciju vispārīgam lietojumam, piemēram, novērojumu atlasei plašās ainavas klasēs (vairāk nodaļā [Novērojumu atlase](#Chapter6)). Šajā projektā izmantoti 2018. gada dati. 

Lejupielādētā datu kopa transformēta Latvijas koordinātu sistēmā (EPSG:3059), turpmākā darba atvieglošanai un paātrināšanai failu formāts mainīts uz *geoparquet*. Failu formāta maiņas ietvaros pārbaudītas ģeometrijas (tukšās, validitāte).


``` r
# libs
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}

# lejupielādētie dati
clcLV=st_read("./clcLV.gpkg",layer="clcLV")

# tukšās ģeometrijas
clcLV2 = clcLV[!st_is_empty(clcLV),,drop=FALSE] # OK

# ģeometriju validēšana
validity=st_is_valid(clcLV2) 
table(validity) # 3 non-valid
clcLV3=st_make_valid(clcLV2)

# koordinātu sistēma
clcLV3=st_transform(clcLV3,crs=3059)

# saglabāšana
sfarrow::st_write_parquet(clcLV3, "CLC_LV_2018.parquet")
```

<br>



### Sentinel-2 {#Chapter3.1.7}

Eiropas Kosmosa Aģentūras (ESA) *Copernicus* programmas *Sentinel-2* misija ir divu (trīs kopš 2024-09-05) identisku satelītu, kas riņo tajā pašā orbītā, konstellācija. Pirmais satelīts - *Sentinel-2A* savu orbītu ieņēma un izgāja kalibrācijas testus 2015-06-23, otrais (*Sentinel-2B*) - 2017-03-07, pirmie attēli bija pieejami jau iepriekš. Katrs satelīts uzņem augstas izšķirtspējas (no 10 m (pie ekvatora) pikseļa izšķirtspējas) attēlus 13 spektrālajos kanālos ar atgriešanās laiku līdz 5 dienām (tuvāk poliem - biežāk) (https://www.esa.int/Applications/Observing_the_Earth/Copernicus/Sentinel-2). Šīs misijas dati ir brīvi pieejami, tajā skaitā *Google Earth Engine* platformā [@GEEpaper] dažādas liela apjoma priekšapstrādes un analīžu veikšanai. Šī projekta ietvaros izmantots harmonizētais otrā līmeņa (Level-2A; https://developers.google.com/earth-engine/datasets/catalog/COPERNICUS_S2_SR_HARMONIZED#description) produkts, pielietojot mākoņu masku, kura iekļauj ne tikai mākoņu, bet arī to ēnu filtrēšanu, lai katrai pēc filtrēšanas (mākoņu un sezonas - no aprīļa līdz oktobrim un no 2017. līdz 2023. gadam) pieejamajai satelītainais aprēķinātu normalizēto starpības veģetācijas indeksu (NDVI, ) un normalizēto starpības ūdens indeksu (NDWI, ) kā arī dažādas to metrikas. Datu sagatavošanai izmantojams
[replicēšanas skripts](https://code.earthengine.google.com/0d0c819780aafc82e8fae371e4afd360?noload=true). Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Izpildot komandrindas tiks piedāvāta lejuplāde sekojošiem failiem:

- `NDVI_p25` - aprīļa līdz oktobra ik pikseļa NDVI 25. procentiles vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDVI_p75` - aprīļa līdz oktobra ik pikseļa NDVI 75. procentiles vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDVI_median` - aprīļa līdz oktobra ik pikseļa NDVI mediānas vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDVI_2023_median` - 2023. gada aprīļa līdz oktobra ik pikseļa NDVI vērtību mediāna;

- `NDVI_IQR` - aprīļa līdz oktobra ik pikseļa NDVI starpkvartiļu apgabala vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDWI_p25` - aprīļa līdz oktobra ik pikseļa NDWI 25. procentiles vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDWI_p75` - aprīļa līdz oktobra ik pikseļa NDWI 75. procentiles vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDWI_median` - aprīļa līdz oktobra ik pikseļa NDWI mediānas vērtību katram gadam no 2017. līdz 2023. mediāna;

- `NDWI_2023_median` - 2023. gada aprīļa līdz oktobra ik pikseļa NDWI vērtību mediāna;

- `NDWI_IQR` - aprīļa līdz oktobra ik pikseļa NDWI starpkvartiļu apgabala vērtību katram gadam no 2017. līdz 2023. mediāna.

Pēc komandrindu izpildes un rezultātu sagatavošanas Google Drive diskā, ir redzams, ka katrs visu Latviju aptverošais slānis ir sadalīts vairākās lapās. Tas ir tādēļ, ka slāņi kodēti kā *Float* un pirms komprecijas GeoTIFF pārsniedz 4 GB izmēru. Visas šīs lapas ir nepieciešams lejuplādēt, sekojošās R komandrindas tās apvieno, nodrošinot koordinātu sistēmas un pikseļu atbilstību references rastram.


``` r
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
paraugs=rast("./LV10m_10km.tif")

# saraksts ar lejupielādētajiem failiem, pieņemot, ka tie atrodas direktorijas 
# "S2indices" apakšdirektorijā "RAW"
faili=data.frame(fails=list.files("./S2indices/RAW/"))
faili$celi_sakums=paste0("./S2indices/RAW/",faili$fails)

# Korekti projektētu mozaīku sagatavošana
# failu nosaukumi un ceļš saglabāšanai
faili=faili %>% 
  separate(fails,into=c("nosaukums","vidus","beigas"),sep="-",remove = FALSE) %>% 
  mutate(mosaic_name=paste0(nosaukums,".tif"),
         masaic_cels=paste0("./S2indices/mozaikas/",mosaic_name))

# unikālie failu nosaukumi cikla vadībai
unikalie=levels(factor(faili$nosaukums))

# cikls uzdevuma veikšanai
for(i in seq_along(unikalie)){
  unikalais=faili %>% filter(nosaukums==unikalie[i])
  beigu_cels=unique(unikalais$masaic_cels)
  
  # ik slānis sastāv no divām lapām
  viens=rast(unikalais$celi_sakums[1])
  divi=rast(unikalais$celi_sakums[2])
  
  viens2=terra::project(viens,paraugs)
  divi2=terra::project(divi,paraugs)
  
  mozaika=terra::merge(viens2,divi2)
  maskets=mask(mozaika,paraugs,filename=beigu_cels,overwrite=TRUE)
}
```


<br>



### *Dynamic World* {#Chapter3.1.8}

*Dynamic World* (DW) ir relatīvi nesens Zemes novērošanas sistēmu produkts, kurš klasificē zemes segumu un lietojumu (LULC) deviņās kategorijās (0=water, 1=trees, 2=grass, 3=flooded_vegetation, 4=crops, 5=shrub_and_scrub, 6=built, 7=bare, 8=snow_and_ice), katram ESA Copernicus Sentinel-2 attēlam ar identificēto mākoņainību $\le35%$, pieļaujot filtrēšanu un dažādu agregāciju veidošanu [@DynWorld] (nedaudz vairāk nodaļā [*Dynamic World* izpēte](#Chapter4)).

DW ievades informācija - rastra slānis katrai sezonai katrā gadā - sagtavots *Google Earth Engine* platformā [@GEEpaper], izmantojot [replicēšanas skriptu](https://code.earthengine.google.com/941bb1a16331727787bb3fc1bbbda95b?noload=true). Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Izpildot komandrindas tiks piedāvāta lejuplāde failam, kas aptver laika periodu no vērtības 7. rindā līdz vērtībai 8. rindā (faila nosaukums norādāms 32. rindā, tā apraksts - 33. rindā un direktorija Google diskā - 31. rindā vai tas viss norādāms apstiprinot saglabāšanau) - šis skripts nav optimizēts visu sezonālo griezumu visiem gadiem sagatavošanai, lai reproducētu vai paplašinātu šo izpēti, tās nepieciešams manuāli izmainīt.

Pēc komandrindu izpildes un rezultātu sagatavošanas Google Drive diskā, ir redzams, ka katrs visu Latviju aptverošais slānis ir sadalīts vairākās lapās. Tas ir tādēļ, ka, lai nodrošinātu nulles patieso vērtību (klase "water", nevis fons), slāņi kodēti kā *Float*, nevis veselie skaitļi. Visas šīs lapas ir nepieciešams lejuplādēt, sekojošās R komandrindas tās apvieno, nodrošinot koordinātu sistēmas un pikseļu atbilstību references rastram.


``` r
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
paraugs=rast("./LV10m_10km.tif")

# saraksts ar lejupielādētajiem failiem, pieņemot, ka tie atrodas direktorijā 
# "DWE_float"
faili=data.frame(faili=list.files("./DWE_float/"))
faili$celi_sakums=paste0("./DWE_float/",faili$faili)

# Korekti projektētu mozaīku sagatavošana
# failu nosaukumi un ceļš saglabāšanai
faili=faili %>% 
  separate(faili,into=c("DW","gads","periods","parejais"),sep="_",remove = FALSE) %>% 
  mutate(unikalais=paste0(DW,"_",gads,"_",periods),
         mosaic_name=paste0(unikalais,".tif"),
         masaic_cels=paste0("./DWE_mosaic/",mosaic_name))

# unikālie failu nosaukumi cikla vadībai
unikalie=levels(factor(faili$unikalais))

# cikls uzdevuma veikšanai
for(i in seq_along(unikalie)){
  unikalais=faili %>% filter(unikalais==unikalie[i])
  beigu_cels=unique(unikalais$masaic_cels)
  
  # ik slānis sastāv no divām lapām
  viens=rast(unikalais$celi_sakums[1])
  divi=rast(unikalais$celi_sakums[2])
  
  viens2=project(viens,paraugs)
  divi2=project(divi,paraugs)
  
  mozaika=mosaic(viens2,divi2,fun="first")
  maskets=mask(mozaika,paraugs,filename=beigu_cels,overwrite=TRUE)
}
```


<br>



### *The Global Forest Watch* {#Chapter3.1.9}

*The Global Forest Watch* (GFW) ir plaši pazīstam produkts, kurš raksturo koku vainagu segumu 2000. gadā, tā ikgadējo pieaugumu no 2001. gada līdz 2012. gadam un zudumu katrā gadā kopš 2001. gada līdz aktuālajai versijai, kas ik gadu tiek papildināta [@theGFW]. Dati ir pieejami gan [projekta mājaslapā](https://data.globalforestwatch.org/documents/941f17325a494ed78c4817f9bb20f33a/explore), gan [GEE](https://developers.google.com/earth-engine/datasets/catalog/UMD_hansen_global_forest_change_2023_v1_11), kurā tie ir izstrādāti. Šajā projektā izmantota v1.11, kurā pēdējais koku izzušanas datēšanas gads ir 2023, to sagatavojot lejupielādei GEE platformā ar [šo replicēšanas skriptu](https://code.earthengine.google.com/1878026f59c5118080cac0a8c976c744?noload=true). Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Izpildot komandrindas tiks piedāvāta lejuplāde failam, kuru nepieciešams saglabāt Google diskā.

Pēc komandrindu izpildes un rezultātu sagatavošanas Google Drive diskā, darba cietajā diskā ir lejupielādējams viens fails un tas pielāgojams references rastram.


``` r
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
paraugs=rast("./LV10m_10km.tif")

# TreeCoverLoss
treecoverloss=rast("./RAW/TreeCoverLoss.tif")

# Fona aivietošana ar iztrūkstošajām vērtībām
tcl=ifel(treecoverloss<1,NA,treecoverloss)

# projektēšana un maskēšana ar faila saglabāšanu
tcl2=terra::project(tcl,paraugs)
tcl3=mask(tcl2,paraugs,filename="./TreeCoverLossYear.tif",overwrite=TRUE)
```

<br>


### Palsar Forests {#Chapter3.1.10}

*Palsar Forests* resurss ir balstīts PALSAR-2 sintētiskās aprertūras radara (SAR) atstarojumu klasifikācijā meža un nemeža zemēs ar 25 m pikseļa izšķirtspēju. Par mežu tiek klasificētas vismaz 0.5 ha plašas ar kokiem klātas teritorijas, kurās koku (vismaz 5 m augstu) seguma ir vismaz 10% [@PALSARForest]. Dati ir pieejami  [GEE](https://developers.google.com/earth-engine/datasets/catalog/JAXA_ALOS_PALSAR_YEARLY_FNF4). Šajā projektā izmantota 4-klašu versija (1=Dense Forest, 2=Non-dense Forest, 3=Non-Forest, 4=Water), kurā pēdējais koku seguma datēšanas gads ir 2020, to sagatavojot lejupielādei GEE platformā ar [šo replicēšanas skriptu](https://code.earthengine.google.com/3ec78ab057e6c8910cb1546002132b34?noload=true). Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Izpildot komandrindas tiks piedāvāta lejuplāde failam, kuru nepieciešams saglabāt Google diskā.

Pēc komandrindu izpildes un rezultātu sagatavošanas Google Drive diskā, ir lejupielādējami četri faili. Tos nepieciešams projektēt atbilstībai references rastram un apvienot. Šajā resursā koki ir kodēti divās grupās: 1=Dense Forest un 2=Non-dense Forest, kuras nepieciešams apvienot un pārējo pārvērst par iztrūkstošajām vērtībām.

Lai gan šī resursa dati raksturo situāciju 2020. nevis 2023. gadā, tie ir izmantoti, jo koku vainagu seguma izzušanu raksturošanai ir pieejami [*The Global Forest Watch*](#Chapter3.1.9) dati, bet vainagu parādīšanās nav tik strauja, lai būtu nozīmīgas izmaiņas trīs gadu laikā, un šis gads atrodas pa vidu ar novērojumiem aptvertajam laika periodam (2017.-2023. gadi).


``` r
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
paraugs=rast("./LV10m_10km.tif")

# Palsar Trees
fnf1=rast("./RAW/ForestNonForest-0000023296-0000023296.tif")
fnf2=rast("./RAW/ForestNonForest-0000023296-0000000000.tif")
fnf3=rast("./RAW/ForestNonForest-0000000000-0000023296.tif")
fnf4=rast("./RAW/ForestNonForest-0000000000-0000000000.tif")

# projektēšana
fnf1p=terra::project(fnf1,paraugs)
fnf2p=terra::project(fnf2,paraugs)
fnf3p=terra::project(fnf3,paraugs)
fnf4p=terra::project(fnf4,paraugs)

# Apvienošana
fnfA=terra::merge(fnf1p,fnf2p)
fnfB=terra::merge(fnfA,fnf3p)
fnfC=terra::merge(fnfB,fnf4p)

# Reklasificēšana
fnf_X=ifel(fnfC<=2&fnfC>=1,1,NA)

# Maskēšana un saglabāšana
fnf_XX=mask(fnf_X,paraugs,filename="./Palsar_Forests.tif",overwrite=TRUE)
```

<br>



### ERA5 Land {#Chapter3.1.11}

ERA5-Land ir sauszemei veikta klimata (laika apstākļu) pazīmju reanalīze sauszemei 0.1° izšķirtspējā un aptver laika periodu kopš 1950. gada janvāra līdz mūsdienām (datu kopa tiek nepārtraukti papildināta) ar stundas temporālo izšķirtspēju [@ERA5Land]. Oriģināldati lejupielādei ir pieejami *ESA Copernicus Clima Data Store* (https://cds.climate.copernicus.eu/datasets/reanalysis-era5-land?tab=download), tie pieejami arī *Google Earth Engine* platformā [@GEEpaper] kā [dienas](https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_DAILY_AGGR) un [mēneša](https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR) līmeņu agregāti. Šie agregāti izmantoti sugu izplatības modelēšanai nepieciešamo pazīmju jēladatu sagatavošanai - [izmantotās komandu rindas](https://code.earthengine.google.com/4f1597f749ad4296ca46b373d8c4bd2f?noload=true). Piedāvātais skripts aprēķina vairākas pazīmes un piedāvā to lejupielādi *Google Drive direktorijā*. Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Skripta izpildīšana lejupielādei piedāvās sekojošus failus:

- `FebPrec`, kas raksturo ik pikseļa mediānu starp ik februāra (gada aukstākais mēnesis Latvijā) kopējo nokrišņu summām ik gadā no 2015. līdz 2023.;

- `FebTempSum`, kas raksturo ik pikseļa mediānu starp ik februāra (gada aukstākais mēnesis Latvijā) ikdienas vidējo gaisa temperatūru (2 m virs zemes) summām ik gadā no 2015. līdz 2023.;

- `JulPrec`, kas raksturo ik pikseļa mediānu starp ik jūlija (gada siltākais mēnesis Latvijā) kopējo nokrišņu summām ik gadā no 2015. līdz 2023.;

- `PosTempDays`, kas raksturo ik pikseļa mediānu starp dienu, kuru vidējā gaisa temperatūra (2 m virs zemes) ir vismaz 275°K (~0°C), skaitu ik gadā no 2015. līdz 2023.;

- `VegTempSums`, kas raksturo ik pikseļa mediānu starp ik dienas, kuras vidējā gaisa temperatūra (2 m virs zemes) ir vismaz 279°K (~5°C), summu ik gadā no 2015. līdz 2023.;

- `YearPrecSum`, kas raksturo ik pikseļa mediānu starp ik mēneša kopējo nokrišņu daudzuma summām ik gadā no 2015. līdz 2023..

Tā kā klimata datu kodējums ir *Float*, tie tiek sagatavoti kā no četrām lapām (katram slānim) sastāvoši GeoTIFF faili, kurua nepieciešams lejupielādēt darba cietajā diskā. Sekojošās komandu rindas nodrošina šo lapu apvienošanu un projektēšu atbilstībai references rastram.


``` r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)){install.packages("exactextractr");require(exactextractr)}

# reference
template=rast("./LV10m_10km.tif")

# DW export no GEE 
faili=data.frame(fails=list.files("./RAW/"))
faili$celi_sakums=paste0("./RAW/",faili$fails)

# Sagatavošana
faili=faili %>% 
  separate(fails,into=c("nosaukums","vidus","beigas"),sep="-",remove = FALSE) %>% 
  mutate(mosaic_name=paste0(nosaukums,".tif"),
         masaic_cels=paste0("./mozaikas/",mosaic_name))

unikalie=levels(factor(faili$nosaukums))
for(i in seq_along(unikalie)){
  unikalais=faili %>% filter(nosaukums==unikalie[i])
  beigu_cels=unique(unikalais$masaic_cels)
  # katrs slānis sastāv no četrām lapām
  viens=rast(unikalais$celi_sakums[1])
  divi=rast(unikalais$celi_sakums[2])
  tris=rast(unikalais$celi_sakums[3])
  cetri=rast(unikalais$celi_sakums[4])
  
  viens2=terra::project(viens,paraugs)
  divi2=terra::project(divi,paraugs)
  tris2=terra::project(tris,paraugs)
  cetri2=terra::project(cetri,paraugs)
  
  mozaika=terra::merge(viens2,divi2,tris2,cetri2)
  maskets=mask(mozaika,paraugs,filename=beigu_cels,overwrite=TRUE)
}
```


<br>



### Augsnes auglīgums {#Chapter3.1.12}

Latvijas Universitātē GeoTIFF fails (EPSG:3857, 100 m) ar organiskā oglekļa līmeni augsnes virsējā slāni saņemts 2024. gada februārī no Eiropas vienotā pētījumu centra (*European Joint Research Center*). Šis slānis tālāk projektēts atbilstībai references rastram un izmantots EGV sagatavošanā.


``` r
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
template=rast("./LV10m_10km.tif")

# slanis
oc=rast("./IevadesDati/Augsnes/noIvo/LV_OC.tif")

# projektēšana
oc2=project(oc,template_100m,use_gdal=TRUE,method="bilinear")
writeRaster(oc2,"./OrganicCarbon.tif")
```


<br>


### Digitālie reljefa modeļi {#Chapter3.1.13}

Līdz ar Latvijas teritorijas vienlaidus aerolāzerskenēšanas datu publiskošanu (https://www.lgia.gov.lv/lv/digitalie-augstuma-modeli-0) ir izstrādāti dažādi augstas izšķirtspējas (1 m un augstāka) digitālie virsmas modeļi (DSM) un digitālie reljefa modeļi (DEM). Tā kā ievades dati visos gadījumos ir vieni un tie paši, gandrīz visā valsts teritorijā šo (atbilstošo) modeļu vērtības ir vienādas. Tomēr, ne visai valsts teritorijai ir pieejami aerolāzerskenēšanas dati (1), starp modeļiem ir novērojamas atšķirības aizpildījumā (vērtību pieejamībā) ārpus iekšzemes ūdeņiem (2) un pašu ūdensobjektu aizpildījums (3), tomēr, attiecībā uz ar datiem nosegtajām vietām uz sauszemes, vērtības ir gandrīz identiskas (Pīrsona korelācijas koeficienti starp LU ĢZZF, LVMI Silava un LĢIA izstrādātajiem DEM ir lielāki par 0.999999). 

Kā pamata DEM izmantots LU projektā "Ilgtspējīgas augsnes resursu pārvaldības uzlabošana lauksaimniecībā" sagatavotais vidējais aritmētiskais starp LU ĢZZF un LVMI Silava izstrādātajiem DEM. Šī DEM izšķirtspēja ir 1 m, kas nav nepieciešama sugu izplatības modelēšanas ievades datiem, tādēļ slānis projektēts atbilstībai references 10 m rastram. 

Salīdzinot projektēto DEM ar referenci, ir skaidri izdalāmas vietas, kurās nav datu. Tas risināts, izmantojot Māra Nartiša (LU ĢZZF) 2018. gadā izstrādāto visu Latvijas teritoriju bez pārrāvumiem aptverošais DEM ar 10 m izšķirtspēju. Lai novērstu asu malu veidošanās aizpildījuma vietās (izlīdzinātu pārejas), veidots vidējais aritmētiskais slānis, kurš aptver visu Latvijas teritoriju un sakrīt ar references rastru.

No šī rastra izveidots arī nogāžu slīpuma slānis, kurš projektēts atbilstoši referencei. Slīpums izteikts grādos un rēķināts ar 8-kaimiņu pieeju.


``` r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)){install.packages("exactextractr");require(exactextractr)}

# reference
template=rast("./LV10m_10km.tif")

# LiDAR DEM uz 10 m 

lapas_1m=data.frame(faili=list.files("./meanDEM_1mOLD/",pattern="*.tif$"))
lapas_1m$numurs=substr(lapas_1m$faili,10,13)
lapas_1m$cels1=paste0("./meanDEM_1mOLD/",lapas_1m$faili)
lapas_1m$cels2=paste0("./meanDEM_10mOLD/",lapas_1m$faili)

kvadrati=st_read(dsn="GIS_Latvija10.2.gdb",layer="tks93_50000")
kvadrati$name=as.character(kvadrati$num50tk)

moz2=rast("./dem10_20_kopa.tif")

for(i in 1:length(kvadrati$name)){
  kvadrats=kvadrati[i,]
  nosaukums=kvadrats$name
  telpa=terra::ext(kvadrats)
  
  paraugs=crop(template,telpa)
  nart=crop(moz2,telpa)
  nart2=project(nart,paraugs,mask=TRUE)
  
  dem1m=lapas_1m[lapas_1m$numurs==kvadrats$name,]
  if(nrow(dem1m)>0){
    sakumcels=dem1m$cels1
    dem=rast(sakumcels)
    reproj=project(dem,paraugs,mask=TRUE,method="bilinear",use_gdal=TRUE)
    videjais <- ifel(is.na(nart2),nart2,ifel(is.na(reproj),nart2,
                                             app(c(nart2,reproj), mean)))
    writeRaster(videjais,overwrite=TRUE,
                filename=paste0("./meanDEM_10m/","vidDEM_",
                                nosaukums,".tif"))
  }
  else{
    writeRaster(nart2,overwrite=TRUE,
                filename=paste0("./meanDEM_10m/","vidDEM_",
                                nosaukums,".tif"))
  }
}

# vrt un mozaika
lapas_10=data.frame(faili=list.files("./meanDEM_10m/",pattern="*.tif$"))
lapas_10$celi1=paste0("./meanDEM_10m/",lapas_10$faili)
mozaikai=vrt(lapas_10$celi1,overwrite=TRUE,
             filename="./vrtDEM_10m.tif")
mozaika=rast("./vrtDEM_10m.tif")
writeRaster(mozaika,"./mozDEM_10m.tif")


## slope
reljefs=rast("./mozDEM_10m.tif")
slipumi=terrain(reljefs, v="slope", neighbors=8, unit="degrees", 
                filename="./Slope_10m.tif", overwrite=TRUE)  
```


<br>



## Ievades produkti {#Chapter3.2}

Atsevišķos gadījumos ievades datiem veikta relatīvi apjomīga apstrāde (sagatavojot ievades produktus), kas nepieciešama turpmākajam darbam - ekoģeogrāfisko mainīgu sagatavošanai un novērojumu filtrēšanai. Šie produkti un to izstrādes gaita raksturota atbilstošajās apakšnodaļās.

### Reljefa produkti {#Chapter3.2.1}

Lai izstrādātu daļu ar reljefu saistīto EGV, piemēram, topogrāfisko mitruma indeksu (TWI) un beznotekas depresijas, ir nepieciešams risināt ūdens plūsmu vidē. Tā vairāku soļu procedūra, kas ir loģiska un uzticama kalnu apvidos un vidē ar maz ietekmētu hidroloģiju. Tātad, Latvijas apstākļos tas ir izaicinoši. Šos izaicinājumus var risināt dažādi, piemēram, ja būtu pieejama uzticama (precīza) informācija par upju un grāvji precīzām atrašanās vietām, to varētu iestrādāt reljefā. Diemžēl, pietiekoši precīzas informāicjas nav. Tādēļ izaicinājumu risināšanai izmantota informācija par transporta būvēm no [Meliorācijas Kadastra Informācijas Sistēmas datubāze](#Chapter3.1.4) un tiltiem no [LĢIA topogrāfiskā karte](#Chapter3.1.3) - 30 m buferī ap šīm vietām iestrādāta minimālā augstuma virs jūras līmeņa informācija tālāk izmantojamajā DEM.


``` r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)){install.packages("exactextractr");require(exactextractr)}

# reference
template=rast("./LV10m_10km.tif")

# reljefs
reljefs=rast("./mozDEM_10m.tif")

# caurtekas
caurtekas=st_read(dsn="./MKIS_20180612.gdb/",layer="TransportStructures")
caurtekas_buffer=st_buffer(caurtekas,dist=30)

# tilti 
tiltiL=st_read(dsn="./Topo10_v3_12_07_2016.gdb/",layer="bridge_L")
tiltiL_buffer=st_buffer(tiltiL,dist=30)
tiltiP=st_read(dsn="./Topo10_v3_12_07_2016.gdb/",layer="bridge_P")
tiltiP_buffer=st_buffer(tiltiP,dist=30)

# visi buferi 
caurtekas_buffer=caurtekas_buffer[,"Shape"]
tiltiL_buffer=tiltiL_buffer[,"Shape"]
tiltiP_buffer=tiltiP_buffer[,"Shape"]
visi_buferi=rbind(caurtekas_buffer,tiltiL_buffer,tiltiP_buffer)

# caurumosana
visi_buferi$vertiba=exactextractr::exact_extract(reljefs,visi_buferi,"min")

templis=raster::raster(template)
caurumi=fasterize::fasterize(visi_buferi,templis,field="vertiba")
caurumi2=rast(caurumi)
caurumains=app(c(reljefs,caurumi2),fun="min",na.rm=TRUE,
               overwrite=TRUE,
               filename="./caurtDEM_10m.tif")
```


<br>



### Ainava {#Chapter3.2.2}

Šajā vingrinājumā "ainava" ir dažādu zemes seguma un lietojuma veidu klašu pārstāvniecība, kurā svarīga ir šo klašu zīmēšanas secība, jo nereti dažādu avotu telpiskajiem datiem ir savstarpēja robežu neatbilstība, kas liek risināt gan to savstarpējo pārklāšanos (1), gan aizpildīt robus vietām, par kurām nav datubāzu informāicja (2), un izvēle par objektu uzsvēršanu ar kādu apstrādi, piemēram, buferēšanu, jo daļa vides raksturošanai (jo sevišķi, malas efektu) nozīmīgu elementu var būt ar tik mazu laukumu vai tādu novietojumu, ka rasterizāicjas procesā tie pazūd (3). Pamata ainavas slānim nozīme ir arī kalpot kā maskai turpmāko vides aprakstu sagatavošanā. Šeit raksturota pamata (vienkāršas) ainavas izstrāde un sekojošajās apakšnodaļās tās bagātināšana ar klasēm specifiskākiem vides ekoģeogrāfiskajiem mainīgajiem. Vienkāršā ainava saglabāta failā `Ainava_vienk_mask.tif`, kurā esošās klases un to izveidošanas procedūra raksturota sekojošajā uzskaitījumā:

- klase `100` - **ceļi**: dažādu avotu ceļi, **aizpildīta secībā** - dominē pār klasēm ar lielāku vērtību, lai nepazustu relatīvi neliela izmēra objekti un nodrošinātu informāciju par malām. Šīs klases izveidošanai apvienoti:

  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņi `road_A` un `road_L` (izņemot mazāko platuma grupu, kura visbiežāk neveido vienlaidus pārrāvumu vainagu klājā, [skatīt atlasi](#Chapter3.1.3)), pirms rasterizēšanas tos buferējot par 10 m;
  
  -- [LVM atvērto datu](#Chapter3.1.5) slāņi `LVM_MEZA_AUTOCELI`, `LVM_ATTISTAMIE_AUTOCELI`, `LVM_APGRIESANAS_LAUKUMI`, `LVM_IZMAINISANAS_VIETAS` un `LVM_NOBRAUKTUVES`, tās buferējot par 10 m.
  
  -- nav izmantota Meža valsts reģistra informācija par dabiskajām brauktuvēm, jo tās visbiežāk neveido vienlaidus pārrāvumu vainagu klājā. Šī reģistra informācija par ceļiem ir arī pārējos resursos, tā nav dublēta.

Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `100`, kuru failā `100_celi.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)


#poly
celi_topo=st_read_parquet("./Topo_road_A.parquet")
celi_topo=celi_topo %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
ctb=st_buffer(celi_topo,dist=10)
r_celi_topo=fasterize(ctb,template_r,field="yes")

# pts
nobrauktuves=st_read("./LVM_NOBRAUKTUVES_Shape.shp")
nobrauktuves=nobrauktuves %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
izmainisanas=st_read("./LVM_IZMAINISANAS_VIETAS_Shape.shp")
izmainisanas=izmainisanas %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
apgriesanas=st_read("./LVM_APGRIESANAS_LAUKUMI_Shape.shp")
apgriesanas=apgriesanas %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
cp=rbind(nobrauktuves,izmainisanas,apgriesanas)
cpb=st_buffer(cp,dist=10)
r_celi_pts=fasterize(cpb,template_r,field="yes")


# lines
meza_autoceli=st_read("./LVM_MEZA_AUTOCELI_Shape.shp")
meza_autoceli=meza_autoceli %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
attistamie=st_read("./LVM_ATTISTAMIE_AUTOCELI_Shape.shp")
attistamie=attistamie %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
topo_lines=st_read_parquet("./Topo_roadL.parquet")
topo_lines=topo_lines %>% 
  mutate(yes=100) %>% 
  dplyr::select(yes)
cl=bind_rows(meza_autoceli,attistamie,topo_lines)
cl=cl %>% 
  dplyr::select(yes)
clb=st_buffer(cl,dist=10)
r_celi_lines=fasterize(clb,template_r,field="yes")

# liekā aizvākšana
rm(apgriesanas)
rm(attistamie)
rm(celi_topo)
rm(topo_lines)
rm(ctb)
rm(cl)
rm(clb)
rm(cp)
rm(cpb)
rm(izmainisanas)
rm(meza_autoceli)
rm(nobrauktuves)

# ģeometriju rasterizēšana
t_celi_topo=rast(r_celi_topo)
writeRaster(t_celi_topo,"./100a.tif")
t_celi_pts=rast(r_celi_pts)
writeRaster(t_celi_pts,"./100b.tif")
t_celi_lines=rast(r_celi_lines)
writeRaster(t_celi_lines,"./100c.tif")

# liekā aizvākšana
rm(r_celi_lines)
rm(r_celi_pts)
rm(r_celi_topo)
rm(t_celi_lines)
rm(t_celi_pts)
rm(t_celi_topo)

# apvienošana
a100=rast("./100a.tif")
b100=rast("./100b.tif")
c100=rast("./100c.tif")

rastri=sprc(a100,b100,c100)
rastrs_celi=terra::merge(rastri,
                         filename="./100_celi.tif",
                         overwrite=TRUE)
# liekā aizvākšana
rm(a100)
rm(b100)
rm(c100)
rm(rastri)
rm(rastrs_celi)
```


<br>


- klase `200` - **ūdeņi**: dažādu avotu ūdensobjekti, **aizpildīta secībā** - dominē pār klasēm ar lielāku vērtību, lai nepazustu relatīvi neliela izmēra objekti un nodrošinātu informāciju par malām. Šīs klases izveidošanai apvienoti:

  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņi `hidro_A` un `hidro_L` (buferēts par 5 m);
  
  -- [MKIS](#Chapter3.1.4) slānis `Ditches`, to buferējot par 3 m;
  
  -- [LVM atvērto datu](#Chapter3.1.5) slāņi `LVM_GRAVJI`, tās buferējot par 5 m.
  
  -- nav izmantota Meža valsts reģistra informācija par grāvjiem, jo tai ir arī pārējos resursos, vai tik nelielai, ka nerada vienlaidus pārrāvumu koku vainagu klājā.


Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `200`, kuru failā `200_udens_premask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)


# topo
topo_udens_poly=st_read_parquet("./Topo_hidroA.parquet")
topo_udens_poly=topo_udens_poly %>% 
  mutate(yes=200) %>% 
  dplyr::select(yes) %>% 
  st_transform(crs=3059)
topo_udens_lines=st_read_parquet("./Topo_hidroL.parquet")
topo_udens_lines=topo_udens_lines %>% 
  mutate(yes=200) %>% 
  st_buffer(dist=5) %>% 
  dplyr::select(yes) %>% 
  st_transform(crs=3059)
topo_udens=rbind(topo_udens_poly,topo_udens_lines)
r_topo_udens=fasterize(topo_udens,template_r,field="yes")
raster::writeRaster(r_topo_udens,
                    "./200_topo.tif",
                    progress="text")
# liekā aizvākšana
rm(topo_udens_lines)
rm(topo_udens_poly)
rm(topo_udens)
rm(r_topo_udens)

# mkis
st_layers("./MKIS_20180612.gdb/")
mkis_gravji=st_read("./MKIS_20180612.gdb/",layer="Ditches")

ensure_MULTILINESTRING <- function(X) {
  tmp1 <- tempfile(fileext = ".gpkg")
  tmp2 <- tempfile(fileext = ".gpkg")
  st_write(X, tmp1)
  ogr2ogr(tmp1, tmp2, f = "GPKG", nlt = "MULTILINESTRING")
  Y <- st_read(tmp2)
  st_sf(st_drop_geometry(X), geom = st_geometry(Y))
}
mkis_gravji2 <- ensure_MULTILINESTRING(mkis_gravji)

mkis_gravji3 = mkis_gravji2[!st_is_empty(mkis_gravji2),,drop=FALSE] # 2 geom
validity=st_is_valid(mkis_gravji3) 
table(validity) # OK

mkis_gravji=mkis_gravji3 %>% 
  mutate(yes=200) %>% 
  st_buffer(dist=3) %>% 
  dplyr::select(yes)
r_mkis_udens=fasterize(mkis_gravji,template_r,field="yes")
raster::writeRaster(r_mkis_udens,
                    "./200_mkis.tif",
                    progress="text")
# liekā aizvākšana
rm(mkis_gravji)
rm(mkis_gravji2)
rm(mkis_gravji3)
rm(r_mkis_udens)
rm(validity)

# lvm
lvm_gravji=st_read("./LVM_GRAVJI_Shape.shp")
lvm_gravji=lvm_gravji %>% 
  mutate(yes=200) %>% 
  st_buffer(dist=5) %>% 
  dplyr::select(yes)
r_lvm_gravji=fasterize(lvm_gravji,template_r,field="yes")
raster::writeRaster(r_lvm_gravji,
                    "./200_lvm.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(lvm_gravji)
rm(r_lvm_gravji)


# apvienojums
a200=rast("./IevadesDati/ainava/200_topo.tif")
b200=rast("./IevadesDati/ainava/200_mkis.tif")
c200=rast("./IevadesDati/ainava/200_lvm.tif")

rastri_udens=sprc(a200,b200,c200)
rastrs_udens=terra::merge(rastri_udens,
                         filename="./IevadesDati/ainava/200_udens_premask.tif",
                         overwrite=TRUE)
# liekā aizvākšana
rm(a200)
rm(b200)
rm(c200)
rm(rastri_udens)
rm(rastrs_udens)
```


<br>



- klase `300` - **lauki**: lauksaimniecības zemes LAD lauku blokos **aizpildīta secībā** - dominē pār klasēm ar lielāku vērtību, tomēr pēc pamata klašu izveidošanas, robu aizpildīšanā papildināta ar informāciju no *Dynamic World*. Šīs klases izveidošanai apvienoti:

  -- [LAD lauku informācijas](#Chapter3.1.3) slānis, kurš, sekojot pieņemtajam lēmumam par grupējumu (nedaudz plašāk [šeit](#chapter4.2.16), klases apskatāmas [šeit](./Papilddati/KulturuKodi_2024.xlsx)), dalīts trīs plašās grupās (pārklāšanās secībā):
  
    -- **aramzemes** ar klases kodu `310`;
    
    -- **papuves** ar klases kodu `320`;
    
    -- **zālāji** ar klases kodu `330`;
    
    -- pamata ainavā augļudārzi un ilggadīgie krūmveida stādījumi ievietoti citās ainavas klasēs.


Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `300` ar tās apakšklasēm, kuru failā `300_lauki_premask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)



# lad
lad_klasem=read_excel("./KulturuKodi_2024.xlsx")
lad=st_read_parquet("./LAD_lauki.parquet")


## aramzemes
amazemem=lad_klasem %>% 
  filter(str_detect(SDM_grupa_sakums,"aramz"))
aramzemes=lad %>% 
  filter(PRODUCT_CODE %in% amazemem$kods) %>% 
  mutate(yes=310) %>% 
  dplyr::select(yes)
r_aramzemes_lad=fasterize(aramzemes,template_r,field="yes")
raster::writeRaster(r_aramzemes_lad,
                    "./310_aramzemes_lad.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(amazemem)
rm(aramzemes)
rm(r_aramzemes_lad)


## papuves
papuvem=lad_klasem %>% 
  filter(str_detect(SDM_grupa_sakums,"papuv"))
papuves=lad %>% 
  filter(PRODUCT_CODE %in% papuvem$kods) %>% 
  mutate(yes=320) %>% 
  dplyr::select(yes)
r_papuves_lad=fasterize(papuves,template_r,field="yes")
raster::writeRaster(r_papuves_lad,
                    "./320_papuves_lad.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(papuvem)
rm(papuves)
rm(r_papuves_lad)

## zalaji
zalajiem=lad_klasem %>% 
  filter(str_detect(SDM_grupa_sakums,"zālā"))
zalaji=lad %>% 
  filter(PRODUCT_CODE %in% zalajiem$kods) %>% 
  mutate(yes=330) %>% 
  dplyr::select(yes)
r_zalaji_lad=fasterize(zalaji,template_r,field="yes")
raster::writeRaster(r_zalaji_lad,
                    "./330_zalaji_lad.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(zalajiem)
rm(zalaji)
rm(r_zalaji_lad)

# apvienojums
a300=rast("./310_aramzemes_lad.tif")
b300=rast("./320_papuves_lad.tif")
c300=rast("./330_zalaji_lad.tif")

rastri_laukiem=sprc(a300,b300,c300)
rastrs_lauki=terra::merge(rastri_laukiem,
                               filename="./300_lauki_premask.tif",
                               overwrite=TRUE)
# liekā aizvākšana
rm(lad)
rm(lad_klasem)
rm(a300)
rm(b300)
rm(c300)
rm(rastri_laukiem)
rm(rastrs_lauki)
```


<br>



- klase `400` - **mazdārziņi un augļudārzi, vasarnīcas**, **aizpildīta secībā** - dominē pār klasēm ar lielāku vērtību. Šīs klases izveidošanai apvienoti (pārklāšanās secībā):

  -- [topogrāfiskās kartes](#Chapter3.1.3) slānis `landus_A`, kura rezultāts kodēts ar `410`;
  
  -- [LAD lauku informācijas](#Chapter3.1.3) slāņa grupa (nedaudz plašāk par grupējumu [šeit](#chapter4.2.16), klases apskatāmas [šeit](./Papilddati/KulturuKodi_2024.xlsx)) "augļudārzi", kura rezultāts kodēts ar `420`.

Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `400`, kuru failā `400_vasarnicas_premask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)


# topo
darzini_topo=st_read_parquet("./Topo_landusA.parquet")
table(darzini_topo$FNAME,useNA="always")
darzini_topo=darzini_topo %>% 
  filter(FNAME %in% c("poligons_Augļudārzs","poligons_Sakņudārzs",
                      "poligons_Ogulājs")) %>% 
  mutate(yes=410) %>% 
  dplyr::select(yes)
r_darzini_topo=fasterize(darzini_topo,template_r,field="yes")
raster::writeRaster(r_darzini_topo,
                    "./410_darzini_topo.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(darzini_topo)
rm(r_darzini_topo)

# lad
lad_klasem=read_excel("./KulturuKodi_2024.xlsx")
table(lad_klasem$SDM_grupa_sakums,useNA="always")
augludarziem=lad_klasem %>% 
  filter(SDM_grupa_sakums=="augļudārzi")
lad=st_read_parquet("./LAD_lauki.parquet")
lad=lad %>% 
  filter(PRODUCT_CODE %in% augludarziem$kods) %>% 
  mutate(yes=420) %>% 
  dplyr::select(yes)
r_darzini_lad=fasterize(lad,template_r,field="yes")
raster::writeRaster(r_darzini_lad,
                    "./420_darzini_lad.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(lad_klasem)
rm(augludarziem)
rm(lad)
rm(r_darzini_lad)

# apvienojums
a400=rast("./410_darzini_topo.tif")
b400=rast("./420_darzini_lad.tif")

rastri_vasarnicam=sprc(a400,b400)
rastrs_vasarnicas=terra::merge(rastri_vasarnicam,
                          filename="./400_varnicas_premask.tif",
                          overwrite=TRUE)
# liekā aizvākšana
rm(a400)
rm(b400)
rm(rastri_vasarnicam)
rm(rastrs_vasarnicas)
```


<br>



- klase `500` - **apbūve**: apbūvētās platības, **aizpildīta beigās**, izmantojot informāciju no *Dynamic World* par vietām, kuras nav nosegtas ar citām klasēm.

- klase `600` - **meži, krūmāji, izcirtumi**: ar kokiem un krūmiem klātās platības un izcirtumi un iznīkušās mežaudzes, **aizpildīta secībā** - dominē pār klasēm ar lielāku vērtību. Šīs klases izveidošanai apvienoti (pārklāšanās secībā):

  -- [*The Global Forest Watch*](#Chapter3.1.9) slānī reģistrētās koku vainagu seguma izzušanas kopš 2020. gada, kura rezultāts kodēts ar `610`;
  
  -- [Meža valsts reģistrā](#Chapter3.1.1) atzīmētie izcirtumi un iznīkušās audzes, kura rezultāts kodēts ar `610`;
  
  -- [Meža valsts reģistrā](#Chapter3.1.1) atzīmētās mežaudzes, kas ir zemākas par 5 m un sēklu ieguves plantācijas, kura rezultāts kodēts ar `620`;
  
  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `flora_L` ar krūmiem saistītās klases, kas buferētas par 10 m, kura rezultāts kodēts ar `620`;
  
  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņi `landus_A` klase "poligons_Krūmājs", kura rezultāts kodēts ar `620`;
  
  -- [LAD lauku informācijas](#Chapter3.1.3) slāņa grupa (nedaudz plašāk par grupējumu [šeit](#chapter4.2.16), klases apskatāmas [šeit](./Papilddati/KulturuKodi_2024.xlsx)) "ilggadīgie krūmveida stādījumi", kura rezultāts kodēts ar `620`;
  
  -- [Meža valsts reģistrā](#Chapter3.1.1) atzīmētās mežaudzes augstumā no 5 m, rezultāts kodēts ar `630`;
  
  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `landus_A` klases "poligons_Parks", "poligons_Meza_kapi", "poligons_Kapi", kura rezultāts kodēts ar `640`;
  
  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `flora_L` ar kokiem saistītās klases, kas buferētas par 10 m, kura rezultāts kodēts ar `640`;
  
  -- [Palsar Forests](#Chapter3.1.10) slānis, kura rezultāts kodēts ar `630`.

Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `600`, kuru failā `600_meziem_premask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)


# mvr 
mvr=st_read_parquet("./nogabali_2024janv.parquet")

# izcirtumi
izcirtumi=mvr %>% 
  filter(zkat %in% c("12","14")) %>% 
  mutate(yes=610) %>% 
  dplyr::select(yes)
r_izcirtumi_mvr=fasterize(izcirtumi,template_r,field="yes")
raster::writeRaster(r_izcirtumi_mvr,
                    "./610_izcirtumi_mvr.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(izcirtumi)
rm(r_izcirtumi_mvr)

# zemās audzes
# arī zkat 16
zemas_audzes=mvr %>% 
  filter((zkat =="10" & h10<5)|zkat=="16") %>% 
  mutate(yes=620) %>% 
  dplyr::select(yes)
r_zemas_mvr=fasterize(zemas_audzes,template_r,field="yes")
raster::writeRaster(r_zemas_mvr,
                    "./620_zemas_mvr.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(zemas_audzes)
rm(r_zemas_mvr)


# augstās audzes
augstas_audzes=mvr %>% 
  filter(zkat =="10" & h10>=5) %>% 
  mutate(yes=630) %>% 
  dplyr::select(yes)
r_augstas_mvr=fasterize(augstas_audzes,template_r,field="yes")
raster::writeRaster(r_augstas_mvr,
                    "./630_augstas_mvr.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(augstas_audzes)
rm(r_augstas_mvr)
rm(mvr)

# tcl - kopš 2020
tcl=rast("./TreeCoverLossYear.tif")
tcl2=ifel(tcl<20,NA,610,
          filename="./610_TCL.tif",
          overwrite=TRUE)
# liekā aizvākšana
rm(tcl)
rm(tcl2)

# palsar
palsar=rast("./Palsar_Forests.tif")
palsar2=ifel(palsar==1,630,NA,
          filename="./630_Palsar.tif",
          overwrite=TRUE)
# liekā aizvākšana
rm(palsar)
rm(palsar2)


# lad
lad_klasem=read_excel("./KulturuKodi_2024.xlsx")
table(lad_klasem$SDM_grupa_sakums,useNA="always")
lad=st_read_parquet("./LAD_lauki.parquet")
krumiem=lad_klasem %>% 
  filter(str_detect(SDM_grupa_sakums,"krūmv"))
krumi=lad %>% 
  filter(PRODUCT_CODE %in% krumiem$kods) %>% 
  mutate(yes=620) %>% 
  dplyr::select(yes)
r_krumi_lad=fasterize(krumi,template_r,field="yes")
raster::writeRaster(r_krumi_lad,
                    "./620_krumi_lad.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(lad_klasem)
rm(lad)
rm(krumiem)
rm(krumi)
rm(r_krumi_lad)

# topo - pkk
pkk_topo=st_read_parquet("./Topo_landusA.parquet")
table(pkk_topo$FNAME,useNA="always")
pkk_topo=pkk_topo %>% 
  filter(FNAME %in% c("poligons_Parks","poligons_Meza_kapi","poligons_Kapi")) %>% 
  mutate(yes=640) %>% 
  dplyr::select(yes)
r_pkk_topo=fasterize(pkk_topo,template_r,field="yes")
raster::writeRaster(r_pkk_topo,
                    "./640_pkk_topo.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(pkk_topo)
rm(r_pkk_topo)

# topo - krūmi
krumi_topo=st_read_parquet("./Topo_landusA.parquet")
table(krumi_topo$FNAME,useNA="always")
krumi_topo=krumi_topo %>% 
  filter(FNAME %in% c("poligons_Krūmājs")) %>% 
  mutate(yes=620) %>% 
  dplyr::select(yes)
r_krumi_topo=fasterize(krumi_topo,template_r,field="yes")
raster::writeRaster(r_krumi_topo,
                    "./620_krumi_topo.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(krumi_topo)
rm(r_krumi_topo)

# topo - linijkrumi un linijkoki
linijas_topo=st_read_parquet("./Topo_floraL.parquet")

# linijkrumi
krumu_linijas_topo=linijas_topo %>% 
  filter(str_detect(FNAME,"Krūmu")) %>% 
  mutate(yes=620) %>% 
  st_buffer(dist=10) %>% 
  dplyr::select(yes)
r_krumu_linijas_topo=fasterize(krumu_linijas_topo,template_r,field="yes")
raster::writeRaster(r_krumu_linijas_topo,
                    "./620_KrumuLinijas_topo.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(krumu_linijas_topo)
rm(r_krumu_linijas_topo)

# linijkoki
koku_linijas_topo=linijas_topo %>% 
  filter(str_detect(FNAME,"Koku")) %>% 
  mutate(yes=640) %>% 
  st_buffer(dist=10) %>% 
  dplyr::select(yes)
r_koku_linijas_topo=fasterize(koku_linijas_topo,template_r,field="yes")
raster::writeRaster(r_koku_linijas_topo,
                    "./640_KokuLinijas_topo.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(koku_linijas_topo)
rm(r_koku_linijas_topo)
rm(linijas_topo)

# apvienosana
r_krumi_lad=rast("./620_krumi_lad.tif")
r_pkk_topo=rast("./640_pkk_topo.tif")
r_krumi_topo=rast("./620_krumi_topo.tif")
r_krumu_linijas_topo=rast("./620_KrumuLinijas_topo.tif")
r_koku_linijas_topo=rast("./640_KokuLinijas_topo.tif")
r_palsar=rast("./630_palsar.tif")
r_tcl=rast("./610_TCL.tif")
r_augstas_mvr=rast("./630_augstas_mvr.tif")
r_zemas_mvr=rast("./620_zemas_mvr.tif")
r_izcirtumi_mvr=rast("./610_izcirtumi_mvr.tif")

rastri_meziem=sprc(r_tcl,r_izcirtumi_mvr,
                   r_zemas_mvr,r_krumu_linijas_topo,r_krumi_topo,r_krumi_lad,
                   r_augstas_mvr,
                   r_pkk_topo,r_koku_linijas_topo,
                   r_palsar)
rastrs_mezi=terra::merge(rastri_meziem,
                      filename="./600_meziem_premask.tif",
                      overwrite=TRUE)
# liekā aizvākšana
rm(r_krumi_lad)
rm(r_pkk_topo)
rm(r_krumi_topo)
rm(r_krumu_linijas_topo)
rm(r_koku_linijas_topo)
rm(r_palsar)
rm(r_tcl)
rm(r_augstas_mvr)
rm(r_zemas_mvr)
rm(r_izcirtumi_mvr)
rm(rastri_meziem)
rm(rastrs_mezi)
```


<br>



- klase `700` - **mitrāji**: apvienojot ar niedrājiem, purviem un bebrainēs saistītos ģeotelpiskos datus, **aizpildīta secībā** - dominē pār klasēm ar lielāku vērtību. Šīs klases izveidošanai apvienoti (pārklāšanās secībā):

  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `landus_A` klases "Meldrājs_ūdenī_poligons", "poligons_Grīslājs", "poligons_Meldrājs", "poligons_Nec_purvs_grīslājs", "poligons_Nec_purvs_meldrājs", "Sēklis_poligons", kura rezultāts kodēts ar `720`;
  
  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `landus_A` klases "poligons_Nec_purvs_sūnājs", "poligons_Sūnājs", kuru rezultāts kodēts ar `710`;
  
  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `swamp_A`, kura rezultāts kodēts ar `710`;

  -- [Meža valsts reģistrā](#Chapter3.1.1) atzīmētās zemes kategorijas "21", "22", "23", kura rezultāts kodēts ar `710`;
  
  -- [Meža valsts reģistrā](#Chapter3.1.1) atzīmētās  zemes kategorijas "41", "42", kura rezultāts kodēts ar `730`.


Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `700`, kuru failā `700_mitraji_premask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)


# topo
topo=st_read_parquet("./Topo_landusA.parquet")
table(topo$FNAME,useNA="always")

## niedrāji
niedraji_topo=topo %>% 
  filter(FNAME %in% c("Meldrājs_ūdenī_poligons","poligons_Grīslājs",
                      "poligons_Meldrājs","poligons_Nec_purvs_grīslājs",
                      "poligons_Nec_purvs_meldrājs","Sēklis_poligons")) %>% 
  mutate(yes=720) %>% 
  dplyr::select(yes)
r_niedraji_topo=fasterize(niedraji_topo,template_r,field="yes")
raster::writeRaster(r_niedraji_topo,
                    "./720_niedraji_topo.tif",
                    progress="text")
# liekā aizvākšana
rm(niedraji_topo)
rm(r_niedraji_topo)


## purvi
purvi_topo=topo %>% 
  filter(FNAME %in% c("poligons_Nec_purvs_sūnājs","poligons_Sūnājs")) %>% 
  mutate(yes=710) %>% 
  dplyr::select(yes)
topo_purvi=st_read_parquet("./Topo_swampA.parquet")
topo_purvi=topo_purvi %>% 
  mutate(yes=710) %>% 
  dplyr::select(yes)
purvi=rbind(purvi_topo,topo_purvi)
r_purvi_topo=fasterize(purvi,template_r,field="yes")
raster::writeRaster(r_purvi_topo,
                    "./710_purvi_topo.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(purvi_topo)
rm(topo_purvi)
rm(purvi)
rm(r_purvi_topo)


# mvr
mvr=st_read_parquet("./nogabali_2024janv.parquet")

# sūnu, zālu pārejas purvi
mvr_purvi=mvr %>% 
  filter(zkat %in% c("21","22","23")) %>% 
  mutate(yes=710) %>% 
  dplyr::select(yes)
r_purvi_mvr=fasterize(mvr_purvi,template_r,field="yes")
raster::writeRaster(r_purvi_mvr,
                    "./710_purvi_mvr.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(mvr_purvi)
rm(r_purvi_mvr)

# bebraines un pārplūstoši klajumi
mvr_bebri=mvr %>% 
  filter(zkat %in% c("41","42")) %>% 
  mutate(yes=730) %>% 
  dplyr::select(yes)
r_bebri_mvr=fasterize(mvr_bebri,template_r,field="yes")
raster::writeRaster(r_bebri_mvr,
                    "./730_bebri_mvr.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(mvr_bebri)
rm(r_bebri_mvr)
rm(mvr)

# apvienosana
r_niedraji_topo=rast("./720_niedraji_topo.tif")
r_purvi_topo=rast("./710_purvi_topo.tif")
r_purvi_mvr=rast("./710_purvi_mvr.tif")
r_bebri_mvr=rast("./730_bebri_mvr.tif")


rastri_mitrajiem=sprc(r_niedraji_topo,r_purvi_topo,r_purvi_mvr,r_bebri_mvr)
rastrs_mitraji=terra::merge(rastri_mitrajiem,
                               filename="./700_mitraji_premask.tif",
                               overwrite=TRUE)
# liekā aizvākšana
rm(r_niedraji_topo)
rm(r_purvi_topo)
rm(r_purvi_mvr)
rm(r_bebri_mvr)
rm(rastri_mitrajiem)
rm(rastrs_mitraji)
```


<br>



- klase `800` - **smiltāji un kūdras lauki**: apvienojot ar smiltājiem, virsājiem un kūdras karjeriem saistītos slāņus, **aizpildīta secībā** - tā kā šī ir augstākā klase, tā dominē tikai pār robu aizpildīšanai izmantoto *Dynamic World*. Šīs klases izveidošanai apvienoti (pārklāšanās secībā):

  -- [topogrāfiskās kartes](#Chapter3.1.3) slāņa `landus_A` klases "poligons_Smiltājs", "poligons_Kūdra", kura rezultāts kodēts ar `800`;
  
  -- [Meža valsts reģistrā](#Chapter3.1.1) atzīmētās  zemes kategorijas "33", "34", kura rezultāts kodēts ar `730`.

Zemāk esošās komandu rindas izveido slāni ar ainavas klasi `800`, kuru failā `800_smiltaji_premask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)

smiltaji_topo=st_read_parquet("./Topo_landusA.parquet")
table(smiltaji_topo$FNAME,useNA="always")
smiltaji_topo=smiltaji_topo %>% 
  filter(FNAME %in% c("poligons_Smiltājs","poligons_Kūdra")) %>% 
  mutate(yes=800) %>% 
  dplyr::select(yes)
r_smiltaji_topo=fasterize(smiltaji_topo,template_r,field="yes")
raster::writeRaster(r_smiltaji_topo,
                    "./800_SmiltajiKudra_topo.tif",
                    progress="text")
# liekā aizvākšana
rm(smiltaji_topo)
rm(r_smiltaji_topo)

# mvr zkat 33 un 34
mvr=st_read_parquet("./nogabali_2024janv.parquet")

smiltajiem=mvr %>% 
  filter(zkat %in% c("33","34")) %>% 
  mutate(yes=800) %>% 
  dplyr::select(yes)
r_smiltaji_mvr=fasterize(smiltajiem,template_r,field="yes")
raster::writeRaster(r_smiltaji_mvr,
                    "./800_SmiltVirs_mvr.tif",
                    progress="text",
                    overwrite=TRUE)
# liekā aizvākšana
rm(mvr)
rm(smiltajiem)
rm(r_smiltaji_mvr)

# apvienosana
r_smiltaji_topo=rast("./800_SmiltajiKudra_topo.tif")
r_smiltaji_mvr=rast("./800_SmiltVirs_mvr.tif")

rastri_smiltajiem=sprc(r_smiltaji_topo,r_smiltaji_mvr)
rastrs_smiltajiem=terra::merge(rastri_smiltajiem,
                               filename="./800_smiltaji_premask.tif",
                               overwrite=TRUE)
# liekā aizvākšana
rm(r_smiltaji_topo)
rm(r_smiltaji_mvr)
rm(rastri_smiltajiem)
rm(rastrs_smiltajiem)
```



<br>

**Apvienošana un aizpildīšana**.

Zemāk esošās komandu rindas pareizā secībā apvieno iepriekš izveidotos slāņus ar ainavas klasēm un nodrošina robu aizpildīšanu ar atbilstoši klasificētu *Dynamic World* 2023. gada aprīļa-augusta kompozītu, kuru, pēc maskēšanas tikai analīzes telpai, failā `Ainava_vienk_mask.tif` saglabā turpmākam darbam.


``` r
# Libs
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(raster)) {install.packages("raster"); require(raster)}
if(!require(fasterize)) {install.packages("fasterize"); require(fasterize)}
if(!require(gdalUtilities)){install.packages("gdalUtilities");require(gdalUtilities)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}

# templates
template_t=rast("./LV10m_10km.tif")
template_r=raster(template_t)


# DW pildījums 
dynworld=rast("./DW_2023_apraug.tif")
klases=matrix(c(0,200,
              1,620,
              2,330,
              3,720,
              4,310,
              5,710,
              6,500,
              7,800,
              8,500),ncol=2,byrow=TRUE)
dw2=terra::classify(dynworld,klases)
writeRaster(dw2,
            "./DW_reclass.tif",
            overwrite=TRUE)

celi=rast("./100_celi.tif")
udeni=rast("./200_udens_premask.tif")
lauki=rast("./300_lauki_premask.tif")
vasarnicas=rast("./400_varnicas_premask.tif")
mezi=rast("./600_meziem_premask.tif")
mitraji=rast("./700_mitraji_premask.tif")
smiltaji=rast("./800_smiltaji_premask.tif")
dw2=rast("./DW_reclass.tif")

rastri_ainavai=sprc(celi,udeni,lauki,vasarnicas,mezi,mitraji,smiltaji,dw2)
rastrs_ainava=terra::merge(rastri_ainavai,
                               filename="./Ainava_vienkarsa.tif",
                               overwrite=TRUE)
# liekā aizvākšana
rm(celi)
rm(udeni)
rm(lauki)
rm(vasarnicas)
rm(mezi)
rm(mitraji)
rm(smiltaji)
rm(klases)
rm(dynworld)
rm(dw2)
rm(rastri_ainavai)
rm(rastrs_ainava)

# maskēšana
rastrs_ainava=rast("./Ainava_vienkarsa.tif")
masketa_ainava=terra::mask(rastrs_ainava,
                           template_t,
                           filename="./Ainava_vienk_mask.tif",
                           overwrite=TRUE)
# liekā aizvākšana
rm(rastrs_ainava)
rm(masketa_ainava)
```


<br>





#### Lauku ainava {#Chapter3.2.2.1}

Šajā apakšnodaļā apkopoti ar lauku ainavu saistītie ievades produkti - 10 m izšķirtspējā sagatavoti rastra slāņi, kas cieši saistīti ar virsnodaļā aprakstīto ainavu un nepieciešami tālākai EGV sagatavošanai. Lai atvieglotu meklēšanu un atsaukšanos, tie iedalīti vēl zamāka līmeņa apakšnodaļās.


##### Lauku bloku platība {#Chapter3.2.2.1.1}

##### Zālāji ārpus lauku blokiem, pieskaitot bezatbalsta {#Chapter3.2.2.1.2}

##### Zālāji visi {#Chapter3.2.2.1.3}

##### Zālāji LAD ne ppg {#Chapter3.2.2.1.4}

##### Zālāji ilglaicīgie {#Chapter3.2.2.1.5}

##### Papuves {#Chapter3.2.2.1.6}

##### Krūmveida stādījumi {#Chapter3.2.2.1.7}

##### Augļudārzi LAD {#Chapter3.2.2.1.8}

##### Aramzemes visas {#Chapter3.2.2.1.9}

##### Aramzemes: ziemas rapsis un ripsis {#Chapter3.2.2.1.10}

##### Aramzemes: vasaras rapsis un ripsis + kukurūza + pākšaugi {#Chapter3.2.2.1.11}

##### Aramzemes: vagu un rušināmkultūras {#Chapter3.2.2.1.12}

##### Aramzemes: ne- labības, rapši, kukurūzas, pākšaugi, vagu kultūras {#Chapter3.2.2.1.13}

##### Aramzemes: labība ziemāji {#Chapter3.2.2.1.14}

##### Aramzemes: labība vasarāji {#Chapter3.2.2.1.15}

##### Lauku daudzveidībai {#Chapter3.2.2.1.16}


<br>





#### Mežu ainava {#Chapter3.2.2.2}

Šajā apakšnodaļā apkopoti ar mežu ainavu saistītie ievades produkti - 10 m izšķirtspējā sagatavoti rastra slāņi, kas cieši saistīti ar virsnodaļā aprakstīto ainavu un nepieciešami tālākai EGV sagatavošanai. Lai atvieglotu meklēšanu un atsaukšanos, tie iedalīti vēl zamāka līmeņa apakšnodaļās.

##### Oligotrofi susinātie meši {#Chapter3.2.2.2.1}

##### Oligotrofi purvaiņu meži {#Chapter3.2.2.2.2}

##### Oligotrofi sausieņu un slapjaiņu meži {#Chapter3.2.2.2.3}

##### Mezotrofi sausieņu un slapjaiņu meži {#Chapter3.2.2.2.4}

##### Eitrofi susinātie meži {#Chapter3.2.2.2.5}

##### Eitrofi purvaiņu meži {#Chapter3.2.2.2.6}

##### Eitrofi sausieņu un slapjaiņu meži {#Chapter3.2.2.2.7}





##### Izcirtumi un jaunaudzes līdz 5 m {#Chapter3.2.2.2.8}

##### Jaunaudzes no 5 m un krūmāji {#Chapter3.2.2.2.9}

##### Vidēja vecuma un briestaudzes {#Chapter3.2.2.2.10}

##### Pieaugušās un pāraugušās mežaudzes {#Chapter3.2.2.2.11}






##### Skujkoku {#Chapter3.2.2.2.12}

##### Šaurlapju {#Chapter3.2.2.2.13}

##### Platlapju {#Chapter3.2.2.2.14}

##### Jauktu koku {#Chapter3.2.2.2.15}





##### Skujkoku jaunaudzes, vidēja vecuma un briestaudzes {#Chapter3.2.2.2.16}

##### Skujkoku pieaugušās un pāraugušās audzes {#Chapter3.2.2.2.17}

##### Šaurlapju jaunaudzes, vidēja vecuma un briestaudzes {#Chapter3.2.2.2.18}

##### Šaurlapju pieaugušās un pāraugušās audzes {#Chapter3.2.2.2.19}

##### Platlapju jaunaudzes, vidēja vecuma un briestaudzes {#Chapter3.2.2.2.20}

##### Platlapju pieaugušās un pāraugušās audzes {#Chapter3.2.2.2.21}

##### Jauktu koku jaunaudzes, vidēja vecuma un briestaudzes {#Chapter3.2.2.2.22}

##### Jauktu koku pieaugušās un pāraugušās audzes {#Chapter3.2.2.2.23}

##### Mežu daudzveidībai {#Chapter3.2.2.2.24}



<br>





#### Kombinētā ainava {#Chapter3.2.2.3}

Šajā apakšnodaļā apkopoti ar virsnodaļā aprakstīto ainavu saistītie ievades produkti - 10 m izšķirtspējā sagatavoti rastra slāņi, kas nepieciešami tālākai EGV sagatavošanai. Lai atvieglotu meklēšanu un atsaukšanos, tie iedalīti vēl zamāka līmeņa apakšnodaļās.


##### Parki, kapi, alejas {#Chapter3.2.2.3.1}

##### Vasarnīcas un mazdārziņi {#Chapter3.2.2.3.2}

##### Ūdensobjektu platība {#Chapter3.2.2.3.3}

##### Niedrāji, meldrāji, grīslāji un pārplūstošā {#Chapter3.2.2.3.4}

##### Mitrāju platība {#Chapter3.2.2.3.5}

##### Atklāta augsne un karjeri {#Chapter3.2.2.3.6}

##### Kokiem klātās platības {#Chapter3.2.2.3.7}

##### Netaksētās mežaudzes {#Chapter3.2.2.3.8}

##### Apbūve {#Chapter3.2.2.3.9}

##### Daudzās klases daudzveidībai {#Chapter3.2.2.3.10}


<br>





#### Malu slāņi {#Chapter3.2.2.4}

Šajā apakšnodaļā apkopoti ar virsnodaļā aprakstīto ainavu saistītie ievades produkti - 10 m izšķirtspējā sagatavoti rastra slāņi, kas nepieciešami tālākai EGV sagatavošanai. Lai atvieglotu meklēšanu un atsaukšanos, tie iedalīti vēl zamāka līmeņa apakšnodaļās.

##### Apbūves un LIZ mala  {#Chapter3.2.2.4.1}

##### Apbūves un koku mala {#Chapter3.2.2.4.2}

##### Aramzemju (visu) malas {#Chapter3.2.2.4.3}

##### LIZ, izcirtumu un jaunaudžu (<5m) malas ar kokiem >5m  {#Chapter3.2.2.4.4}

##### Koku virs 5m malas {#Chapter3.2.2.4.5}

##### Niedrāju malas ar ūdeni {#Chapter3.2.2.4.6}

##### Pieaugušu un pāraugušu mežaudžu malas {#Chapter3.2.2.4.7}

##### Zālāju (visu) malas {#Chapter3.2.2.4.8}

##### Ūdens un LIZ malas {#Chapter3.2.2.4.9}

##### Ūdens un zālāju malas {#Chapter3.2.2.4.10}

##### Ūdensobjektu malas {#Chapter3.2.2.4.11}

##### Ceļu garums (malas/2) {#Chapter3.2.2.4.12}


<br>





### Vides pārmaiņas {#Chapter3.2.3}

Vides pārmaiņas nepieciešamas novērojumu filtrēšanai. Daļēji tās būtu iegūstamas no [Meža Valsts reģistrs](#Chapter3.1.1) un [LAD lauku informācija](#Chapter3.1.2) datiem, tomēr projekta darba grupā nav pieejami ik gada raksturojumi (1) un šīs datubāzes neaptver visu valsts teritoriju (2), tādēļ nepieciešams neatkarīgs vērtējums. Tāda izstrādāšanai izmantojām [*Dynamic World* izpēte](#Chapter4) aprīļa līdz augusta ik gadam no 2017. līdz 2023. rezultātus un [*Global Forest Watch*](#Chapter3.1.9) datus, raksturojot pārmaiņu apjomus analīzes šūnā (nodaļa [100 m režģis Latvijā](#Chapter2.1)) un putnu ligzdošanas iecirkņu rādiusu grupu (\@ref(fig:AinavTelpas) att.) buferos ap analīzes šūnu centriem.


Saskaņā ar [*Dynamic World* izpēte](#Chapter4) rezultātiem, ir vērts izmantot šo resursu vides kopējo pārmaiņu analīzē kopš 2017. gada. Par kopējām pārmaiņām uzskatīta jebkura izmaiņa Dynamic World klasē, to salīdzinot ik 10 m pikselim aprīļa-augusta sezonā starp katriem diviem secīgiem gadiem. Pārmaiņu apjoms raksturots kā platības īpatsvars 100 m šūnā vai putnu ligzdošanas iecirkņu rādiusu grupu buferos ap šīs šūnas centru. Tā kā pārmaiņas analizētas vienos un tajos pašos rastros, izmantojot dažādus laukumveida objektus, kurus nepieciešams apvienot vienā failā, katras ģeometrijas raksturojums iestrādāts lauku nosaukumos.

Kopumā līdzīga procedūra veikta koku vainagu seguma izzušanas apjoma (īpatsvara no telpas kopumā) raksturošanai. Tomēr šī informācija ir iestrādāta vienā rastra slānī, notikuma gadu norādot kā pikseļa vērtību. Tas ikgadējā samazinājuma apjoma aprēķināšanu apgrūtina, tomēr nepadara par neiespējamu (skatīt komandu rindas zemāk, specifiski - funkciju `darbiba`). Līdz ar ik gadu zudušā koku vainagu seguma īpatsvara no analīzes telpas platības iegūšanu, tā pievienota analizētajai ģeometrijai kā atsevišķs lauks katram notikuma gadam. Tāpat kā iepriekš - lauku nosaukumi harmonizēti, tajos iestrādājot analīzes telpas raksturojumu, un rezultāti pievienoti 100 m režģa atbilstošajām šūnām.



``` r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)){install.packages("exactextractr");require(exactextractr)}
if(!require(foreach)) {install.packages("foreach"); require(foreach)}
if(!require(doParallel)) {install.packages("doParallel"); require(doParallel)}


# režģis un buferi
lapas_tikls=data.frame(fails_c=list.files("./lapas/"))
lapas_tikls$cels_grid=paste0("./lapas/",lapas_tikls$fails_c)
lapas_tikls$lapa=substr(lapas_tikls$fails,10,13)
lapas_radiusi=data.frame(fails_r=list.files("./lapas/"))
lapas_radiusi$cels_radiuss=paste0("./lapas/",lapas_radiusi$fails_r)
lapas_radiusi=separate(lapas_radiusi,fails_r,
                       into=c("sakums","veids","lapa","beigas"),remove = FALSE)

lapas_r500=lapas_radiusi %>% 
  filter(veids=="r500") %>% 
  mutate(fails_r500=fails_r,
         cels_r500=cels_radiuss) %>% 
  dplyr::select(-sakums,-beigas,-fails_r,-cels_radiuss,-veids)

lapas_r1250=lapas_radiusi %>% 
  filter(veids=="r1250") %>% 
  mutate(fails_r1250=fails_r,
         cels_r1250=cels_radiuss) %>% 
  dplyr::select(-sakums,-beigas,-fails_r,-cels_radiuss,-veids)

lapas_r3000=lapas_radiusi %>% 
  filter(veids=="r3000") %>% 
  mutate(fails_r3000=fails_r,
         cels_r3000=cels_radiuss) %>% 
  dplyr::select(-sakums,-beigas,-fails_r,-cels_radiuss,-veids)

lapas=lapas_tikls %>% 
  left_join(lapas_r500) %>% 
  left_join(lapas_r1250) %>% 
  left_join(lapas_r3000)

# vides rastri
tcl=rast("./TreeCoverLossYear.tif")
tcl2=ifel(tcl<17,NA,tcl) # Zudumi tikai kopš 2017. gada
writeRaster(tcl2,"./KokuVainagiem.tif")

dw17=rast("./DW_2017_apraug.tif") 
dw18=rast("./DW_2018_apraug.tif")
dw19=rast("./DW_2019_apraug.tif")
dw20=rast("./DW_2020_apraug.tif")
dw21=rast("./DW_2021_apraug.tif")
dw22=rast("./DW_2022_apraug.tif")
dw23=rast("./DW_2023_apraug.tif")

chDWa=ifel(dw17==dw18,0,1) # Pārmaiņas no 2017. uz 2018. gadu
writeRaster(chDWa,"./chDWa.tif")
chDWb=ifel(dw18==dw19,0,1) # Pārmaiņas no 2018. uz 2019. gadu
writeRaster(chDWb,"./chDWb.tif")
chDWc=ifel(dw19==dw20,0,1) # Pārmaiņas no 2019. uz 2020. gadu
writeRaster(chDWc,"./chDWc.tif")
chDWd=ifel(dw20==dw21,0,1) # Pārmaiņas no 2020. uz 2021. gadu
writeRaster(chDWd,"./chDWd.tif")
chDWe=ifel(dw21==dw22,0,1) # Pārmaiņas no 2021. uz 2022. gadu
writeRaster(chDWe,"./chDWe.tif")
chDWf=ifel(dw22==dw23,0,1) # Pārmaiņas no 2022. uz 2023. gadu
writeRaster(chDWf,"./chDWf.tif")
plot(chDWf)

# pārmaiņu analīze
soli=levels(factor(lapas$lapa))

cl <- makeCluster(12) # jānorāda izmantojamo kodolu (fizisko) skaits
registerDoParallel(cl)

foreach(i = 1:length(soli)) %dopar% {
  library(terra)
  library(sf)
  library(tidyverse)
  library(arrow)
  library(sfarrow)
  library(exactextractr)
  
  # funkcija platībaīpatsvarā kurā noticis koku vainagu seguma zudums
  # noteikšanai katrā gadā (2017-2023)
  darbiba <- function(raster, vector) {
    exact_extract(raster, vector, function(value, coverage_fraction) {
      data.frame(value = value,
                 frac = coverage_fraction/sum(coverage_fraction,na.rm = TRUE)) %>%
        arrange(value) %>% 
        group_by(value) %>%
        summarize(freq = sum(frac, na.rm = TRUE), .groups = 'drop') %>%
        pivot_wider(names_from = 'value',
                    names_prefix = 'freq_',
                    values_from = 'freq')
    }) %>%
      mutate(across(starts_with('freq'), ~replace_na(., 0)))
  }
  
  # darba lapas
  solis=soli[i]
  celi=lapas %>% filter(lapa==solis)
  
  # poligonu ielasīšana
  sunas=st_read_parquet(celi$cels_grid)
  sunas=sunas %>% dplyr::select(id,yes,tks50km,X,Y)
  r500=st_read_parquet(celi$cels_r500)
  r500=r500 %>% dplyr::select(id,yes,tks50km,X,Y)
  r1250=st_read_parquet(celi$cels_r1250)
  r1250=r1250 %>% dplyr::select(id,yes,tks50km,X,Y)
  r3000=st_read_parquet(celi$cels_r3000)
  r3000=r3000 %>% dplyr::select(id,yes,tks50km,X,Y)
  
  # konkrētās darba lapas robežas
  telpa=st_as_sfc(st_bbox(r3000))
  telpa2=st_buffer(telpa,dist=1000)
  
  # koku vainagu seguma pārmaiņas
  tcl2=rast("./KokuVainagiem.tif")
  tcl_telpa=crop(tcl2,telpa2)
  
  loss_cell=darbiba(tcl_telpa, sunas)
  sunas=cbind(sunas,loss_cell)
  loss_r500=darbiba(tcl_telpa, r500)
  r500=cbind(r500,loss_r500)
  loss_r1250=darbiba(tcl_telpa, r1250)
  r1250=cbind(r1250,loss_r1250)
  loss_r3000=darbiba(tcl_telpa, r3000)
  r3000=cbind(r3000,loss_r3000)
  
  # Vides pārmaiņas Dynamic World datos
  chDWa=rast("./chDWa.tif")
  chDWb=rast("./chDWb.tif")
  chDWc=rast("./chDWc.tif")
  chDWd=rast("./chDWd.tif")
  chDWe=rast("./chDWe.tif")
  chDWf=rast("./chDWf.tif")
  
  names(chDWa)="DWchange_1718"
  names(chDWb)="DWchange_1819"
  names(chDWc)="DWchange_1920"
  names(chDWd)="DWchange_2021"
  names(chDWe)="DWchange_2122"
  names(chDWf)="DWchange_2223"
  
  mazs_chDWa=crop(chDWa,telpa2)
  mazs_chDWb=crop(chDWb,telpa2)
  mazs_chDWc=crop(chDWc,telpa2)
  mazs_chDWd=crop(chDWd,telpa2)
  mazs_chDWe=crop(chDWe,telpa2)
  mazs_chDWf=crop(chDWf,telpa2)
  
  mazas_DW=raster::stack(c(mazs_chDWa,mazs_chDWb,mazs_chDWc,
                           mazs_chDWd,mazs_chDWe,mazs_chDWf))
  
  sunam=exact_extract(mazas_DW,sunas,"mean")
  r500am=exact_extract(mazas_DW,r500,"mean")
  r1250am=exact_extract(mazas_DW,r1250,"mean")
  r3000am=exact_extract(mazas_DW,r3000,"mean")
  
  # iegūto rezultātu apvienošana
  sunas=cbind(sunas,sunam)
  r500=cbind(r500,r500am)
  r1250=cbind(r1250,r1250am)
  r3000=cbind(r3000,r3000am)
  
  # rezultējošo failu saglabāšana
  st_write_parquet(sunas,celi$cels_grid)
  st_write_parquet(r500,celi$cels_r500)
  st_write_parquet(r1250,celi$cels_r1250)
  st_write_parquet(r3000,celi$cels_r3000)
}
stopCluster(cl)

# darba lapu apvienošana
pirmas_sunas=sfarrow::st_read_parquet(lapas$cels_grid[lapas$lapa==soli[1]])
pirmas_r500=sfarrow::st_read_parquet(lapas$cels_r500[lapas$lapa==soli[1]])
pirmas_r1250=sfarrow::st_read_parquet(lapas$cels_r1250[lapas$lapa==soli[1]])
pirmas_r3000=sfarrow::st_read_parquet(lapas$cels_r3000[lapas$lapa==soli[1]])

dati_c=pirmas_sunas
dati_r500=pirmas_r500
dati_r1250=pirmas_r1250
dati_r3000=pirmas_r3000

for(i in 2:length(soli)){
  solis=soli[i]
  nakosas_sunas=sfarrow::st_read_parquet(lapas$cels_grid[lapas$lapa==solis])
  nakosas_r500=sfarrow::st_read_parquet(lapas$cels_r500[lapas$lapa==solis])
  nakosas_r1250=sfarrow::st_read_parquet(lapas$cels_r1250[lapas$lapa==solis])
  nakosas_r3000=sfarrow::st_read_parquet(lapas$cels_r3000[lapas$lapa==solis])
  
  dati_c=bind_rows(dati_c,nakosas_sunas)
  dati_r500=bind_rows(dati_r500,nakosas_sunas)
  dati_r1250=bind_rows(dati_r1250,nakosas_sunas)
  dati_r3000=bind_rows(dati_r3000,nakosas_sunas)
}

# apvienoto lapu saglabāšana
st_write_parquet(dati_c,"./VidesParmainas_suna.parquet")
st_write_parquet(dati_r500,"./VidesParmainas_r500.parquet")
st_write_parquet(dati_r1250,"./VidesParmainas_r1250.parquet")
st_write_parquet(dati_r3000,"./VidesParmainas_r3000.parquet")

# lauku nosaukumu harmonizēšana
dati_c2=dati_c %>% 
  mutate(cell_TCLNaN=freq_NaN,
         cell_TCL17=freq_17,
         cell_TCL18=freq_18,
         cell_TCL19=freq_19,
         cell_TCL20=freq_20,
         cell_TCL21=freq_21,
         cell_TCL22=freq_22,
         cell_TCL23=freq_23,
         cell_DWchange1718=mean.DWchange_1718,
         cell_DWchange1819=mean.DWchange_1819,
         cell_DWchange1920=mean.DWchange_1920,
         cell_DWchange2021=mean.DWchange_2021,
         cell_DWchange2122=mean.DWchange_2122,
         cell_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,yes,tks50km,X,Y,
                cell_TCLNaN,cell_TCL17,cell_TCL18,cell_TCL19,cell_TCL20,
                cell_TCL21,cell_TCL22,cell_TCL23,
                cell_DWchange1718,cell_DWchange1819,cell_DWchange1920,
                cell_DWchange2021,cell_DWchange2122,cell_DWchange2223)

dati_r500a=data.frame(dati_r500) %>% 
  mutate(r500_TCLNaN=freq_NaN,
         r500_TCL17=freq_17,
         r500_TCL18=freq_18,
         r500_TCL19=freq_19,
         r500_TCL20=freq_20,
         r500_TCL21=freq_21,
         r500_TCL22=freq_22,
         r500_TCL23=freq_23,
         r500_DWchange1718=mean.DWchange_1718,
         r500_DWchange1819=mean.DWchange_1819,
         r500_DWchange1920=mean.DWchange_1920,
         r500_DWchange2021=mean.DWchange_2021,
         r500_DWchange2122=mean.DWchange_2122,
         r500_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,
                r500_TCLNaN,r500_TCL17,r500_TCL18,r500_TCL19,r500_TCL20,
                r500_TCL21,r500_TCL22,r500_TCL23,
                r500_DWchange1718,r500_DWchange1819,r500_DWchange1920,
                r500_DWchange2021,r500_DWchange2122,r500_DWchange2223)

dati_r1250a=data.frame(dati_r1250) %>% 
  mutate(r1250_TCLNaN=freq_NaN,
         r1250_TCL17=freq_17,
         r1250_TCL18=freq_18,
         r1250_TCL19=freq_19,
         r1250_TCL20=freq_20,
         r1250_TCL21=freq_21,
         r1250_TCL22=freq_22,
         r1250_TCL23=freq_23,
         r1250_DWchange1718=mean.DWchange_1718,
         r1250_DWchange1819=mean.DWchange_1819,
         r1250_DWchange1920=mean.DWchange_1920,
         r1250_DWchange2021=mean.DWchange_2021,
         r1250_DWchange2122=mean.DWchange_2122,
         r1250_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,
                r1250_TCLNaN,r1250_TCL17,r1250_TCL18,r1250_TCL19,r1250_TCL20,
                r1250_TCL21,r1250_TCL22,r1250_TCL23,
                r1250_DWchange1718,r1250_DWchange1819,r1250_DWchange1920,
                r1250_DWchange2021,r1250_DWchange2122,r1250_DWchange2223)


dati_r3000a=data.frame(dati_r3000) %>% 
  mutate(r3000_TCLNaN=freq_NaN,
         r3000_TCL17=freq_17,
         r3000_TCL18=freq_18,
         r3000_TCL19=freq_19,
         r3000_TCL20=freq_20,
         r3000_TCL21=freq_21,
         r3000_TCL22=freq_22,
         r3000_TCL23=freq_23,
         r3000_DWchange1718=mean.DWchange_1718,
         r3000_DWchange1819=mean.DWchange_1819,
         r3000_DWchange1920=mean.DWchange_1920,
         r3000_DWchange2021=mean.DWchange_2021,
         r3000_DWchange2122=mean.DWchange_2122,
         r3000_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,
                r3000_TCLNaN,r3000_TCL17,r3000_TCL18,r3000_TCL19,r3000_TCL20,
                r3000_TCL21,r3000_TCL22,r3000_TCL23,
                r3000_DWchange1718,r3000_DWchange1819,r3000_DWchange1920,
                r3000_DWchange2021,r3000_DWchange2122,r3000_DWchange2223)

# visu rādiusu pievienošana režģim
vides_parmainas=dati_c2 %>% 
  left_join(dati_r500a,by=c("id")) %>% 
  left_join(dati_r1250a,by=c("id")) %>% 
  left_join(dati_r3000a,by=c("id"))

# rezultāta saglabāšana
st_write_parquet(vides_parmainas,"./VidesParmainas_visas.parquet")
```

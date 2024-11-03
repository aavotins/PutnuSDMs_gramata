# Ar modeļiem aptveramā (analīzes) telpa un standartizācijas faili  {#Chapter2}

Lai definētu analīzes telpu, nodrošinātu slāņu savstarpēju atbilstību un atvieglotu savienošanu ar citiem Latvijas ģeodatiem, izmantoti atvērto datu portālā esošie ģeoreferencētie slāņi:

- Latvijas teritoriju aptverošs režģis ar šūnas malas garumu 100 m (https://data.gov.lv/dati/lv/dataset/rezgis) [skatīts: 2024-01-20];

- Latvijas administratīvās teritorijas pēc 2021. gada reformas (atbilstoši Administratīvo teritoriju un apdzīvoto vietu likuma redakcijai, kas stājās spēkā 2021. gada 3. jūnijā) (https://data.gov.lv/dati/lv/dataset/atr)  [skatīts: 2024-01-20].

Šie slāņi savā starpā savienoti un tālāk apstrādāti ērtākai lietošanai.

## 100 m režģis Latvijā  {#Chapter2.1}

Tā kā lejupielādētais režģis ietver arī Latvijas Ekskluzīvās Ekonomiskās Zonas ūdeņus, no tā atlasīti tikai tie kvadrāti, kas pārklājas ar administratīvajām teritorijām. Rezultējošais objekts saglabāts {sf} tieši atbalstītā *geoparquet* formātā turpmāko darbu paātrināšanai.

Lai samazinātu faila apjomu un to izmantotu Zemes novērošanas sistēmas datu filtrēšanai, sagatavots *ESRI shapefile* slānis, kurā apvienoti visi sauszemes kvadrāti.




```r
# Pakotnes
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}

# Administratīvās teritorijas
adm_ter=read_sf("./Administrativas_teritorijas_2021.shp")


# režģis
tikls100=read_sf("./grid_lv_100.gpkg",layer="grid_lv_100")
tikls100$yes=1
tikls100=st_transform(tikls100,crs=3059)
tikls100_sauszeme=tikls100[adm_ter,,]
st_write_parquet(tikls100_sauszeme,"./tikls100_sauzeme.parquet")

# apvienošana
tikls100_apvienots=tikls100_sauszeme %>% 
  group_by(yes) %>% 
  summarise()
st_write(tikls100_apvienots,"./tikls100_apvienots.shp")
```


<br>


### Stratificēšana ģeoprocesēšanas paralelizācijai  {#Chapter2.2}

Lai atvieglotu un paātrinātu ģeoprocesēšanu, analīzes telpu ir nepieciešams sadalīt mazākās daļās. Tam izmantots Envirotech izplatītajā GIS_Latvia_10.2 ģeodatubāzē pieejamais 1993. gada topogrāfisko karšu sistēmas M:50000 rāmis.


```r
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}

# Nepieciešamie slāņi
tks50km=st_read("./GIS_Latvija10.2.gdb/",layer="satelitkarte_tks93_50000")
tikls100=st_read_parquet("./tikls100_sauzeme.parquet")

# Tāda procedūra, lai telpiskās apvienošanas rezultātā nedublētos kvadrāti
tikls100$tks50km=NA
numuri=levels(factor(tks50km$NUMURS))
for(i in 1:length(numuri)){
  numurs=numuri[i]
  lapa=tks50km %>% filter(NUMURS == numurs)
  mazais=tikls100[lapa,,]
  tikls100$tks50km=ifelse(tikls100$id %in% mazais$id,numurs,tikls100$tks50km)
}

# saglabāšana
st_write_parquet(tikls100,"./Templates/TemplateGrids/tikls100_sauzeme.parquet")
```

<br>


Dažādu ainavas metriku aprēķināšanai sugu ligzdošanas iecirkņu un tiem atbilstošo ainavu mērogos, sagatavots 100 m režģa centra punktu slānis un, ik TKS karšu lapai atsevišķā failā, atbilstoši buferētu laukumu slāņi.


```r
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}

# Nepieciešamais slānis
rezgis=st_read_parquet("./tikls100_sauzeme.parquet")

# Centra koordinātes
rezgis$X=st_coordinates(st_centroid(rezgis))[,1]
rezgis$Y=st_coordinates(st_centroid(rezgis))[,2]
st_write_parquet(rezgis,"./tikls100_sauzeme.parquet")


# Punktu ģeometrijas
karsu_lapas=levels(factor(rezgis$tks50km))
rc=data.frame(rezgis) %>% 
  dplyr::select(-geom) %>% 
  st_as_sf(coords=c("X","Y"),crs=3059,remove=FALSE)
st_write_parquet(rc,"./pts100_sauzeme.parquet")


# Buferēšana un saglabāšana
for(i in seq_along(karsu_lapas)){
  lapa=karsu_lapas[i]
  punkti=rc %>% filter(tks50km == lapa)
  
  rcbuff500=st_buffer(punkti,dist=500)
  st_write_parquet(rcbuff500,paste0("./lapas/pts100_r500_",lapa,".parquet"))
  
  rcbuff1250=st_buffer(punkti,dist=1250)
  st_write_parquet(rcbuff1250,paste0("./lapas/pts100_r1250_",lapa,".parquet"))
  
  rcbuff3000=st_buffer(punkti,dist=3000)
  st_write_parquet(rcbuff3000,paste0("./lapas/pts100_r3000_",lapa,".parquet"))
  
  rcbuff10000=st_buffer(punkti,dist=10000)
  st_write_parquet(rcbuff10000,paste0("./lapas/pts100_r10000_",lapa,".parquet"))
}
```


<br>



## References rastri  {#Chapter2.3}

Lai nodrošinātu ievades datu (to pirmapstrādes produktu) un ekoģeogrāfisko mainīgo telpisko harmonizētību, sagatavoti references rastri. Tie saglabāti kā Geotiff faili ar diviem šūnas izmēriem - 10 m (ievades datiem) un 100 m (analīzes šūna). Katra rastra telpiskais pārklājums ir par 10 km plašāks nekā Latvijas sauszemes 100 m tīkls, lai nodrošinātu iespēju ainavmetriku aprēķiniem.



```r
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# Nepieciešamie slāņi
tikls100=st_read_parquet("./tikls100_sauzeme.parquet")
b=terra::crs(tikls100)
adm_ter=read_sf("./Administrativas_teritorijas_2021.shp")
adm_ter$yes=1

# 10 m
rastrs=terra::rast(xmin=302800,xmax=772800,ymin=162900,ymax=448900,
                   resolution=10,crs=b)
rast_LV=rasterize(vect(adm_ter),rastrs)
terra::writeRaster(rast_LV,"./LV10m_10km.tif")

# 100 m
rastrs100=terra::rast(xmin=302800,xmax=772800,ymin=162900,ymax=448900,
                      resolution=100,crs=b)
rast_LV100=rasterize(vect(adm_ter),rastrs100)
terra::writeRaster(rast_LV100,"./LV100m_10km.tif")
```



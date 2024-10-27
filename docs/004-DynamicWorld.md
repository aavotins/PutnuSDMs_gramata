# *Dynamic World* izpēte  {#Chapter4}

*Dynamic World* (DW) ir relatīvi nesens Zemes novērošanas sistēmu produkts, kurš klasificē zemes segumu un lietojumu (LULC) deviņās kategorijās (0=water, 1=trees, 2=grass, 3=flooded_vegetation, 4=crops, 5=shrub_and_scrub, 6=built, 7=bare, 8=snow_and_ice), katram ESA Copernicus Sentinel-2 attēlam ar identificēto mākoņainību $\le35%$, pieļaujot filtrēšanu un dažādu agregāciju veidošanu [@DynWorld]. Salīdzinot ar dažādiem statiskākiem (produktu veidā sagatavotiem konkrētiem gadiem ar smagnēju projicēšanu citiem gadiem) un/vai konkrētu ekosistēmas daļu raksturošanai paredzētiem, piemēram *EU Crop Map* [@CropMap2022] un *ELULC-10* [@ELULC10], DW neapšaubāmi ir ar lielākām sagaidāmajām kļūdām pie klašu (gēotelpiskajām) robežām, tomēr labāku telpisko (klasificēti ir visas izmantojamās satelītainas, nevis vadoties pēc kādas vidi atpazīstošas maskas) un temporālo pārklājumu (dinamiska un tuvu reāllaikam klasifikācijas pieejamība ik satelītainai, nevis atsevišķas projekcijas laikā). Dažādu nesen radīto augstas izšķirtspējas LULC klasifikatoru salīdzinājumos, piemēram, [@LULC10salidzinajums_Venter] un [@LULC10salidzinajums_Xu], ir konstatētas dažādas atšķirības starp tiem, turklāt DW nav bijis uzskatāms par precīzāko, jo sevišķi spējā detektēt relatīvi šaurus līnijaveida objektus un saistībā ar neironu tīklos balstīto pieeju tieksmi pārspīlēt vertikāli strukturētās klases, tomēr tam ir augstākā temporālā pieejamība. Par šajos salīdzinājumos precīzāko uzskatāmajam *ESA WorldCover* brīvi pieejama ir informācijai tikai par 2020. un 2021. gadiem (https://collections.sentinel-hub.com/worldcover/). Augstās temporālās pieejamības dēļ, DW izpēte turpināta, jo pat, ja klases nav vienmēr korekti atpazītas, ir vērts izpētīt spēju atpazīt pārmaiņas to sastopamībā.

Tā kā šī projekta komandai nav zināmi izsekojami (caurspīdīgi, reproducējami) Latvijā veikti DW klasifikācijas un tās pārmaiņu uzticamības pētījumi, šī resursa izpēte veikta projekta ietvaros. Izpētei ir sekojoši **mērķi**:

1. noskaidrot DW izmantošanas iespējas LĢIA topogrāfiskās kartes (un citu ierobežotas pieejamības resursu) aizstāšanai sugu izplatības modelēšanai;

2. noskaidrot labāko sezonu (mēnešu griezumā) Latvijas ainavas (un tās pārmaiņu) raksturošanai dzīvnieku vairošanās un veģetācijas sezonā;

3. iegūt informāciju par DW spēju raksturot ainavas pārmaiņas starp gadiem.

Izpēti fokusējām dzīvnieku vairošanās sezonai, kuras plaši pārklājas ar veģetācijas sezonu, kurā ir sagaidāma augstākā klasifikatoru spēja sniegt informatīvu rezultātu. **Sezonas sākums: aprīlis**, jo:

- šis ir mēnesis, kurā daļa valsts teritorijas vēl var būt zem sniega segas, bet lielākajā teritorijas daļā tas jau būs nokusis;

- šajā mēnesī sākas lapu koku plaukšana, bet tikai sākas, tomēr visbiežāk jau visā valsts teritorijā;

- lakstaugu veģetācija būs sazaļojusi galvenokārt ziemājos, bet ne dabiskajā veģetācijā; protams, uz mēneša beigām dažādi mauriņi u. tml., bet tas vēl nebūs noticis mēneša sākumā;

- vajadzētu būt vēl saglabājušamies sniega kušanas ūdeņiem, ja tādi bija uzkrājušies;

**Sezonas beigas: augusts**, jo:

- tas labi sakrīt ar laiku, kad ligzdošanas un vairošanās sezona ir noslēgusies *vairumam* dzīvnieku sugu;

- sākas migrāciju sezona, kas gan ierosina, ka jūlijs varētu būt labāks beigu punkts, bet ir vērts pārbaudīt dažādas kombinācijas;

- intensīvi sākas rudens aršanas darbi, kas veido (t.sk. iznīcina) dzīvotnes nākošajai sezonai (pat, ja ietekmēta ziemošana, tās reproduktīvā vai teritoriju aizņemtības izpausme būs novērojama nākošajā sezonā); arī šis sliecas ierosināt, ka jūlijs būtu labāks beigu punkts, bet ir vērts pārbaudīt dažādas kombinācijas;

- šis mēnesis vēl ir svarīgs daudzām bezmugurkaulnieku sugām, to konstatēšanai;

**Soļa garums analīzēm: 2-5 secīgi mēneši**, jo

- tikai viena mēneša izmantošana nebūtu sevišķi laba doma, ja tas ir, piemēram, tikai viens aprīļa mēnesis, varētu būt problēmas ar jebkādu veģetāciju, bet vasaras mēnešos ar ūdeņainajām vietām utml.;

- secīgi, jo savādāk nav loģiski;

- pieci, jo periodā ir tikai pieci;

- kopējais kombināciju skaits sezonalitātes pārbaudēm sanāk desmit (turpmākajos apzīmējumos lietots pirmā un pēdējā mēneša trīs burtu saīsinājumu angļu valodā apvienojums bez atdalītājiem):

  - apr-may;

  - apr-may-jun;

  - apr-may-jun-jul;

  - apr-may-jun-jul-aug;

  - may-jun;

  - may-jun-jul;

  - may-jun-jul-aug;

  - jun-jul;

  - jun-jul-aug;

  - jul-aug

Mērķa sasniegšanai ir izvirzāmi vairāki **izpētes jautājumi**, kuri ir risināti šīs nodaļas sekojošajās daļās:

0. Kuros gados un kādos griezumos DW slāņi nosedz visu Latviju, kāda ir datu multi-temporālā un telpiskā pieejamība?;

1. Cik labi tiek atpazītas lauksaimniecības kultūras plašās grupās - nepieciešams, lai šo izmantotu par pamatu turpmākam darbam ainavas klasificēšanā par kultūrām, par kurām nav izpratnes, un vietām, par kurām nav pieejama reģistru informācija, raksturošanai;

2. Kāda ir mežaudzes augstuma (atkarībā no valdošās koku sugas) saistība ar DW mežu/koku un krūmu klasēm - nepieciešama, lai veiktu ainavas klasifikāciju par vietām, kurām nav reģistru, izdalītu koku un krūmu pudurus;

3. Kāds ir topogrāfiskās kartes ar mitrājiem saistāmo klašu sadalījums DW klasēs, kad ir labākā saistība ar vēlamo klasi (un kura tad tā būtu augstajiem purviem un ūdeņu veģetācijai) - nepieciešams gan ainavas, gan pārmaiņu raksturošanai;

4. Kāda ir topogrāfiskās kartes karjeru un kūdras ieguves vietu, kā arī dažādu ceļu saistība ar DW klasēm - nepieciešams gan ainavas, gan pārmaiņu raksturošanai;

5. Kāda ir izcirtuma izmēra (un formas) saistība ar DW klasēm - nepieciešams gan ainavas, gan pārmaiņu raksturošanai;

6. Kāda DW klase tiek piešķirta aramzemēm, kuras pirms gada transformētas no zālājiem - nepieciešams ainavas pārmaiņām.


**Kopējie uzstādījumi analīžu veikšanai**

- poligonu atlasei izmantojam 'set.seed(0)', lai nodrošinātu rezultātu reproducējamību;

- laika taupīšanai, ik analizei nejauši izlozējam 999 vai izmantojam visus pieejamos poligonus;

- ik analīzi veicam kā zonālo statistiku, aptverot visu pētāmo plankumu;

- DW ik periodam ir resamplēts sakritībai ar references 10 m šūnu un ietver tikai Latvijas teritoriju.

DW ievades informācija - rastra slānis katrai sezonai katrā gadā - sagtavots Google Earth Engine (GEE) platformā [@GEEpaper], izmantojot [replicēšanas skriptu](https://code.earthengine.google.com/941bb1a16331727787bb3fc1bbbda95b?noload=true). Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Izpildot komandrindas tiks piedāvāta lejuplāde failam, kas aptver laika periodu no vērtības 7. rindā līdz vērtībai 8. rindā - šis skripts nav optimizēts visu sezonālo griezumu visiem gadiem sagatavošanai, lai reproducētu vai paplašinātu šo izpēti, tās nepieciešams manuāli izmainīt.

Pēc komandrindu izpildes un rezultātu sagatavošanas Google Drive diskā ir redzams, ka katrs visu Latviju aptverošais slānis ir sadalīts vairākās lapās. Tas ir tādēļ, ka, lai nodrošinātu nulles patieso vērtību (klase "water", nevis fons), slāņi kodēti kā *Float*, nevis veselie skaitļi. Visas šīs lapas ir nepieciešams lejuplādēt, sekojošās R komandrindas tās apvieno, nodrošinot koordinātu sistēmas un pikseļu atbilstību references rastram.


```r
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
paraugs=rast("./LV10m_10km.tif")

# saraksts ar lejupielādētajiem failiem, pieņemot, ka tie atrodas direktorijā 
# "DWE_float"
faili=data.frame(faili=list.files("./DWE_float/"))
faili$celi_sakums=paste0("./DWE_float/",faili$faili)

# Korekti projicētu mozaīku sagatavošana
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


## Q0: DW nosegums

Katram gadam (2015-2023) ik iepriekš minētajam sezonas griezumam DW datu pārklājum ir apskatāmi zemāk esošajā attēlā  \@ref(fig:DW_q00). Kā jau sagaidāms, 2015. gadā ir trūcīgs nosegums. Pārskata periodā resurss ir samērā droši izmantojams kopš 2018. gada, kopš 2016. gada pielietojamība ir vērtējama, atkarībā no mērķiem un vērtējama saistībā ar sezonas griezumiem.

<div class="figure">
<img src="./Atteli/ch004_missings.png" alt="DW rezultātu pieejamība dažādos sezonālajos griezumos kopš Sentinel-2 programmas datu pieejamības. Pikseļu krāsa attēla daļās raksturo 1 km šūnās esošo klasifikācijas iztŗukumu īpatsvaru, savukārt skaitļi attēla daļās - kopējo klasifikācijas robu īpatsvaru procentos (%)." width="100%" />
<p class="caption">(\#fig:DW_q00)DW rezultātu pieejamība dažādos sezonālajos griezumos kopš Sentinel-2 programmas datu pieejamības. Pikseļu krāsa attēla daļās raksturo 1 km šūnās esošo klasifikācijas iztŗukumu īpatsvaru, savukārt skaitļi attēla daļās - kopējo klasifikācijas robu īpatsvaru procentos (%).</p>
</div>

<br>

Komandu rindas reproducēšanai:


```r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)) {install.packages("exactextractr"); require(exactextractr)}
if(!require(openxlsx)) {install.packages("openxlsx"); require(openxlsx)}

# 10 m rastra template
paraugs=rast("./LV10m_10km.tif")

# 100 m režģis
kvadrati=st_read_parquet("./tikls1k_sauzeme.parquet")

# robu analīze
failu_objekts2=data.frame(faili=list.files("./DWE_mosaic/"))
failu_objekts2$celi_sakums=paste0("./DWE_mosaic/",failu_objekts2$faili)
failu_objekts2$celi_beigas=paste0("./DWEm_missing/","missing_",failu_objekts2$faili)
failu_objekts2=failu_objekts2 %>% 
  separate(faili,into=c("DW","gads","sezona","ext"),remove = FALSE)
failu_objekts2$celi_parquet=paste0("./DWEm_missing/","missing_","DW_",
                                   failu_objekts2$gads,"_",
                                   failu_objekts2$sezona,
                                   ".parquet")
failu_objekts2$missings=NA_real_
for(j in 1:length(failu_objekts2$faili)){
    print(j)
  cels=failu_objekts2$celi_sakums[j]
  cels_beigas=failu_objekts2$celi_beigas[j]
  cels_parquet=failu_objekts2$celi_parquet[j]
  gads=failu_objekts2$gads[j]
  sezona=failu_objekts2$sezona[j]
  print(cels)
  print(cels_beigas)
  dw1=terra::rast(cels)
  dw2=classify(dw1,cbind(0,10,0))
  dw3=terra::cover(dw2,paraugs,filename=cels_beigas,overwrite=TRUE)
  iztrukumi=global(dw3, "mean", na.rm=TRUE)
  failu_objekts2$missings[j]=round(iztrukumi$mean*100,2)
  robi_tikla=exact_extract(dw3,kvadrati,"mean",max_cells_in_memory=1300000000)
  kvadrati2=kvadrati
  kvadrati2$robi_tikla=robi_tikla
  kvadrati2$gads=gads
  kvadrati2$sezona=sezona
  st_write_parquet(kvadrati2,cels_parquet)
}
write.xlsx(failu_objekts2,"./DWmc_missing.xlsx")

# parquet savienošana
robu_kvadrati <- map_dfr(list.files("./DWEm_missing/",pattern=".parquet",
                                    full.names = TRUE), 
                 sfarrow::st_read_parquet, show_col_types = FALSE)

robu_kvadrati2=robu_kvadrati %>% 
  mutate(gads2=as.numeric(gads),
         sezona2=factor(sezona,ordered=TRUE,
                        levels=c("aprmay","aprjun","aprjul","apraug","mayjun",
                                 "mayjul","mayaug","junjul","junaug","julaug")))

failu_objekts2=failu_objekts2 %>% 
  mutate(gads2=as.numeric(gads),
         sezona2=factor(sezona,ordered=TRUE,
                        levels=c("aprmay","aprjun","aprjul","apraug","mayjun",
                                 "mayjul","mayaug","junjul","junaug","julaug"))) %>% 
  mutate(x=410000,y=210000,
         missings2=paste0(missings," %"))

# rezultāta vizualizācija
ggplot()+
  geom_sf(data=robu_kvadrati2,aes(fill=robi_tikla,col=robi_tikla))+
  facet_grid(gads2~sezona2)+
  theme_bw()+
  coord_sf(datum=sf::st_crs(3059))+
  geom_text(data=failu_objekts2,aes(x=x,y=y,label=missings2),size=2.5)+
  labs(fill="Missing",col="Missing")+
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid.major = element_blank())
ggsave("./pic_missings.png",height = 3000,width=5000,units="px")
```



## Q1: Lauksaimniecības kultūras

Ir tādas kultūras, par kurām ir skaidrs, ka tām ir jāsakrīt ar DW klasēm, tās ir apskatāmas, lai pārbaudītu šīs Zemes novērošanas sistēmu (EO) klasifikācijas korektumu.

Ir tādas kultūras, par kurām nav īsti skaidra šī atbilstība, to ir jānoskaidro pēc pirmās grupas izpētes rezultāta.

Bet ir arī tādas kultūras, par kurām ir zināmas bažas par EO datu klasifikācijas rezultātu precizitātes iespējamību, piemēram, kukurūza un auzas.

Aplūkojam sekojošas izpētes grupas:

- ziemāji aramzemēs, kur nav sagaidāmas problēmas, piemēram, rudzi, ziemas mieži, ziemas kvieši, ziemas tritikāle;

- ziemas rapsis;

- vasarāji aramzemēs, kur nav sagaidāmas problēmas, piemēram, vasaras mieži, vasaras kvieši, vasaras tritikāle;

- vasaras rapsis;

- auzas, jo dažādā izpratnē un pētījumos sarežģīti klasificējas EO datos;

- kukurūza, jo tur ir visādi jautājumi ar augšanu, augstumu un novākšanu - katrā no trim veidiem, lai labāk saprastu šo ainavā un dabas aizsardzībā nozīmīgo grupu;

- papuves, lai labāk izprastu šo klasi;

- ilggadīgi zālāji;

- kultivētās pļavas, lai labāk saprastu šo klasi;

- augļukoki, kur apvieno, augļu koki, ābeles, bumbieres, lai labāk saprastu šo klasi;

- ogu-krūmi, kur apvieno avenes, upenes, jāņogas, ērkšķogas, krūmcidonijas, kazenes, lai labāk saprastu šo klasi;

- zemās ogas, kur apvieno krūmmellenes un lieogu dzērvenes,

- bezatbalsta platības, kur apvieno kodus 620 un 792

- vagu un rušināmkultūras, kuru ilustrēšanai izmantošu kodus 821, 825, 843, 844

- īscirtmeta atvasāji un enerģijas augi, kurā apvienoti kodi 644, 645, 646, 641, 642

Izmantojam 2023. gada DW sezonālos slāņus. Lai gan šajā izpētes solī fokuss ir uz augstāk minētajām grupām, sugu izplatības modelēšanai ir nepieciešams klasificēt visas kultūras, tādēļ jau uzreiz skatām visas kultūras. 

Komandu rindas DW klašu sastopamības izpētei ir zemāk. To ietvaros izmantota [LAD lauku informācija](#Chapter3.1.2) un šajā nodaļā (augstāk) sagatavotās 2023. gada DW sezonālās mozaīkas.


```r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)) {install.packages("exactextractr"); require(exactextractr)}
if(!require(ggview)) {install.packages("ggview"); require(ggview)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}
if(!require(ggrepel)) {install.packages("ggrepel"); require(ggrepel)}

# ievades dati
LAD <- st_read_parquet("./LAD_lauki.parquet")

AprAug <- rast("./DW_2023_apraug.tif")
AprJul <- rast("./DW_2023_aprjul.tif")
AprJun <- rast("./DW_2023_aprjun.tif")
AprMay <- rast("./DW_2023_aprmay.tif")
JulAug <- rast("./DW_2023_julaug.tif")
JunAug <- rast("./DW_2023_julaug.tif")
JunJul <- rast("./DW_2023_junjul.tif")
MayAug <- rast("./DW_2023_mayaug.tif")
MayJul <- rast("./DW_2023_mayjul.tif")
MayJun <- rast("./DW_2023_mayjun.tif")

# utility
darbiba <- function(raster, vector, period) {
  exact_extract(raster, vector, function(value, coverage_fraction) {
    data.frame(value = value,
               frac = coverage_fraction / sum(coverage_fraction, na.rm = TRUE)) %>%
      group_by(value) %>%
      summarize(freq = sum(frac, na.rm = TRUE), .groups = 'drop') %>%
      pivot_wider(names_from = 'value',
                  names_prefix = 'freq_',
                  values_from = 'freq')
  }) %>%
    mutate(across(starts_with('freq'), ~replace_na(., 0))) %>%
    mutate(periods = period) 
}


# DW klašu ekstrakcija ik lauka kultūru nejauši izlozētiem plankumiem
# kultūru kodi
kodi=data.frame(kodi=levels(factor(LAD$PRODUCT_CODE)))
# saglabāšanas datu pamatne
dati=LAD[1,]
dati=dati %>% 
  mutate(periods=NA_character_,
         id=NA_real_,
         freq_0=NA_real_,
         freq_1=NA_real_,
         freq_2=NA_real_,
         freq_3=NA_real_,
         freq_4=NA_real_,
         freq_5=NA_real_,
         freq_6=NA_real_,
         freq_7=NA_real_,
         freq_8=NA_real_,
         freq_NA=NA_real_)
# ekstrakcija ik kodams, veicot izlozi
for (i in 1:length(kodi$kodi)){
  kods=kodi$kodi[i]
  # nejaušo plankumu izloze
  set.seed(0)
  lauki <- LAD %>% filter(`PRODUCT_CODE` == kods)
  if (nrow(lauki) < 999) {rand_l <- lauki} else {rand_l <- lauki %>% sample_n(999)}
  rand_l <- rand_l %>%  mutate(id = row_number())
  # ekstrakcija
  a=cbind(rand_l,darbiba(AprAug, rand_l, "AprAug"))
  b=cbind(rand_l,darbiba(AprJul, rand_l, "AprJul"))
  c=cbind(rand_l,darbiba(AprJun, rand_l, "AprJun"))
  d=cbind(rand_l,darbiba(AprMay, rand_l, "AprMay"))
  e=cbind(rand_l,darbiba(JulAug, rand_l, "JulAug"))
  f=cbind(rand_l,darbiba(JunAug, rand_l, "JunAug"))
  g=cbind(rand_l,darbiba(JunJul, rand_l, "JunJul"))
  h=cbind(rand_l,darbiba(MayAug, rand_l, "MayAug"))
  i=cbind(rand_l,darbiba(MayJul, rand_l, "MayJul"))
  j=cbind(rand_l,darbiba(MayJun, rand_l, "MayJun"))
  # rezultātu apvienošana
  rez=bind_rows(a,b,c,d,e,f,g,h,i,j)
  dati <- bind_rows(dati, rez)
  }
# ērtāki lauku nosaukumi
dati=dati %>% 
  mutate(water=freq_0,
         trees=freq_1,
         grass=freq_2,
         flooded_vegetation=freq_3,
         crops=freq_4,
         shrub_and_scrub=freq_5,
         built=freq_6,
         bare=freq_7,
         snow_and_ice=freq_8)
# atbrīvošanās no liekā ieraksta
dati_real=dati[-1,]
# rezultāta saglabāšana
sfarrow::st_write_parquet(dati_real,"./Q1_kulturas.parquet")
```


### Q1.1: Ziemāji aramzemēs


Sekojošajā attēlā \@ref(fig:DW_q11) ir ilustrēta ziemāju aramzemēs (kultūru kodi "121","122","132","112","116","151") saistība ar DW klasēm dažādos temporālajos griezumos. Skaitļi attēlu daļās norāda klases "crops" ar lauka platību svērto vidējo īpatsvaru. Redzams, ka zemākā atbilstība ir izmantojot tikai vasaras mēnešus. Ievērojami zemāka par atlikušajām klasēm ir arī tikai pavasara klasifikācija. Atlikušās ir visai līdzīgas, nedaudz pārāki temporālie griezumi šķiet maijā-jūnijā un maijā-jūlijā.

<div class="figure">
<img src="./Atteli/ch004_q11.png" alt="Lauksaimniecības kultūru grupas &quot;ziemāji&quot; saistība ar DW klasēm." width="100%" />
<p class="caption">(\#fig:DW_q11)Lauksaimniecības kultūru grupas "ziemāji" saistība ar DW klasēm.</p>
</div>

<br>


Komandu rindas attēla sagatavošanas reproducēšanai:


```r
dati=sfarrow::st_read_parquet("./Q1_kulturas.parquet")
dati=dati %>% 
  mutate(sezona=factor(periods,ordered=TRUE,
                       levels=c("AprMay","AprJun","AprJul","AprAug","MayJun",
                                "MayJul","MayAug","JunJul","JunAug","JulAug")))

ziemaji_aramzemes=c("121","122","132","112","116","151")

q11data=data.frame(dati) %>% 
  filter(PRODUCT_CODE %in% ziemaji_aramzemes) %>% 
  dplyr::select(PRODUCT_CODE,PRODUCT_DESCRIPTION,SHAPE.AREA,sezona,water:snow_and_ice) %>% 
  group_by(PRODUCT_CODE) %>% 
  mutate(skaits=n()/10) %>% 
  ungroup() %>% 
  mutate(nosaukums=paste0(PRODUCT_DESCRIPTION,"\n","n=",skaits)) %>% 
  pivot_longer(cols=water:snow_and_ice,names_to = "klase",values_to = "proporcija")

q11data2=q1data %>% 
  group_by(nosaukums,sezona,klase) %>% 
  summarise(vertiba=round(weighted.mean(proporcija,w=SHAPE.AREA,na.rm=TRUE)*100,0)) %>% 
  ungroup() %>% 
  filter(klase=="crops")

ggplot(q11data,aes(sezona,proporcija,col=klase))+
  facet_wrap(~nosaukums)+
  geom_point(position=position_dodge(width=0.75),alpha=0.2)+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90,vjust=0.5),
        axis.title.y = element_blank(),
        legend.title = element_blank())+
  geom_text(data=q11data2,aes(sezona,y=1.1,label=vertiba),size=3)+
  scale_color_viridis_d()+
  scale_y_continuous(labels=scales::label_percent(),breaks=seq(0,1,by=.1))+
  labs(x="Sezona")
ggview(width=300,height=150,units="mm",dpi=600,device="png")
ggsave(filename="./pic_q11.png",width=300,height=150,units="mm",dpi=600)
```


### Q1.2: Ziemas rapsis


### Q1.3: Vasarāji aramzemēs

### Q1.4: Vasaras rapsis

### Q1.5: Auzas

### Q1.6: Kukurūza


### Q1.7: Papuves


### Q1.8: Ilggadīgie zālāji


### Q1.9: Kultivētie zālāji


### Q1.10: Agļukoki

### Q1.11: Ogu-krūmi


### Q1.12: Zemās ogas

### Q1.13: Bezatbalsta platība


### Q1.14: Vagu un rušināmkultūras

### Q1.15: Īscirtmeta atvasāji un enerģijas kultūras

### Q1: LAD kultūru stratificēšanai


## Q2: Mežaudzes augstums sugu grupās


## Q3: Topogrāfiskās kartes mitrāji


## Q4: Karjeri, kūdras ieguves vietas un ceļi

## Q5: Izcirtuma izmērs un forma

### Q5.1: 2022. gada izcirtumi


### Q5.2: senākas kailcirtes, bet vēl joprojām izcirtumi

## Q6: Zālāju transformācija uz aramzemēm


## Secinājumi

1. Kā sagaidāms, Dymanic World izteikti pārspīlē vertikāli strukturēto klašu (piemēram, 'trees' un 'built', kura šajā analīzē nav sevišķi uzsvērta) sastopamību. Sevišķi izteikti tas parādās jaunaudžu un izcirtumu analīzēs. Tas nozīmē, ka, izmantojot tikai šo resursu vides raksturošanai, ir sagaidāma krietns troksnis visiem parametriem, kas saistās ar kokiem. To varētu risināt, pārskatot varbūtību sliekšņus katrai no klasēm, lai optimizētu Latvijas apstākļiem un sugu izplatības modelēšanas mērķim. Tomēr tas pieprasa liela apjoma specifisku analīzi, kas šī darba ietvaros netiks veikta.

2. Mitrāji, kas definēti topogrāfiskajā kartē, visai slikti uzrādās Dynamic World, galvenokārt augsto lakstaugu, kas klasificēti kā 'trees'. Tā kā daudzām ar mitrājiem saistītajām sugām koku klātbūtne ir uzskatāma par nozīmīgu negatīvi ietekmējošu mainīgo, paļauties uz Dynamic World viltus pozitīvo koku klātbūtni nozīmētu samazināt dzīvotņu piemērotības modeļu skaidrojamību un potenciāli arī projekciju uzticamību. Šo nāksies risināt kombinējot dažādākus slāņus, piemēram Global Forest Watch informācijai par kokiem.

3. Lai gan vides klasifgikāciju nevar balstīt tikai Dynamic World rezultātos, tie pietiekoši labi demonstrē zālāju transformāciju un vismaz lielāka mēroga koku vainagu seguma izzušanu. Tā kā arī apbūves teritoriju klases sastopamība ir līdzīga koku klasei, tas pietiekoši aptver nozīmīgākās pārmaiņas vidē, lai varētu izmantot novērojumu atlasē.

4. Tikai vasaras mēnešu izmantošana sniedz zemāko atbalstu sagaidāmajiem rezultātiem. Nedaudz zemāks atbalsts par pārējām klasēm ir tikai pavasara mēnešiem. Tādēļ pārmaiņu analīzē izmantojama sezona, kas aptver gan pavasara, gan vasaras mēnešus. Tā kā atlikušajos sezonas griezumos Dynamic World rezultātos ir tikai marginālas atšķirības, analīzēm izmantošu Aprīļa-Augusta klašu vidējās varbūtības, jo šis periods sniedz klasifikācijas labāko telpisko pārklājumu.

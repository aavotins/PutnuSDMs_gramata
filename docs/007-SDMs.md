# Sugu izplatības (dzīvotņu piemērotības) modeļi  {#Chapter7}

Šajā nodaļā aprakstīta sugu izplatības modelēšanas pieeja no sugai specifiskās 
modeļos iekļaujamās vides aprakstiem (EGV), caur modeļu parametrizāciju un labākās 
izvēli, līdz modeļu rezultātu izvērtēšanai nepieciešamās informācijas sagatavošanai. 

Iegūtie ik-sugas izplatības modeļi apkopoti, vizualizēti un konspektīvi aprakstīti nodaļas [Rezultāti](#Chapter10) 
pirmajā apakšnodaļā [Individuālu sugu rezultāti](#Chapter10.1). Izplatības modelēšanai 
izmantotās klātbūtnes vietas, to apkopošanas un filtrēšanas procedūras raksturotas 
nodaļā [Novērojumu atlase](#Chapter6), specifiskās - par uzticamām klātbūtnes 
vietām uzskatāmo atlases soļi ir tās apakšnodaļā [Novērojumu atlases gaita](#Chapter6.1), 
savukārt to dalījums modeļa apmācības un neatkarīgās testēšanas kopā un katras no 
tām papildināšana ar vidi-kopumā aprakstošām nejaušās izlozes vietās ir 
apakšnodaļā [Modelēšanas datu saglabāšana un procesa vizualizēšana](#Chapter6.2).

Ekoģeogrāfiskie mainīgie, kuru sagatavošanas procedūras un tajos iekļauto vides 
raksturojumu apraksti ir nodaļā [Ekoģeogrāfiskie mainīgie](#Chapter5), ir gatavoti 
mērķtiecīgai sugu izplatības modelēšanai - pirms pašas EGV sagatavošanas ir sastādīts 
no modelēšanai sākotnēji plānoto sugu (nodaļa [Sugu saraksts un pamata apraksti](#Chapter1)) 
nepieciešamībām izrietošs plāns. Tas ir apskatāms [šajā failā](./Papilddati/EGV_putniem.xlsx), 
kurā ir redzams, ka daļa EGV ir veidoti vienkārši plūsmas ērtībai vai domājot arī 
par citām, ne tikai putnu sugām. Diemžēl pirms EGV ir sagatavoti, nav zināms vai 
tie visi būs faktiski izmantojami sugu izplatības modelēšanai, tādēļ pirms tās 
uzsākšanas pārbaudīta ik sugas modeļos iekļaujamo EGV vērtību savstarpējā neatkarība 
aprēķinot dispersijas ietekmētības faktoru (*variance inflation factor*; VIF), 
turpmākam darbam izvēlot tikai pietiekoši neatkarīgos, kuriem veikta indikatīva 
testēšana to iekļaušanai sugu izpla'tibu prognozējošajos modeļos. Vairāk - šīs 
nodaļas [Sākotnēji izvēlēto pazīmju neatkarība un EGV atlases otrā kārta (VIF)](#Chapter7.1) apakšnodaļā.

Pēc EGV izvēles, veikta sugu izplatības modeļu parametrizācija maximuma entropijas 
analīzes ietvarā [@PhillipsDudikSchapire2004]. Analīzes gaita, parametrizācijas 
pieejas un pieņemtie lēmumi ar ieviešanas procedūru (komandu rindām) ir raksturoti 
šīs nodaļas [Modeļa parametrizācija, izvēle un izvērtēšanas apraksti](#Chapter7.2) apakšnodaļā. 
Šīs procedūras ietvaros, izvēlēts modelis, kurš vislabāk spēj raksturot 
interesējošās sugas izplatību, izšķirot tai piemēroto un nepiemēroto dzīvotņu 
projekcijas ģeogrāfiskajā telpā (nosedzot visu Latvijas iekšzemes teritoriju 100 m 
izšķirtspējā).

Part labāko atzītajam modelim sagatavoti dažādi klasifikācijas spējas raksturojumi, 
raksturojot sagaidāmo kļūdu apjomu gan modeļa apmācībai izmantotajos (un iekšējās 
validācijas), gan neatkarīgās testēšanas datos. Sniegti ieteikumi izmantojamajiem 
dzīvotņu piemērotības klasifikācijas sliekšņiem ar izmešanas un pieskaitīšanas 
kļūdām kā arī kopējo klasifikācijas statistisko nozīmīgumu. Papildus tam, raksturotas 
projicētās dzīvotņu piemērotības gradienta īpašības un individuālu novērojumu ietekme 
modelī, kas turklāt vērtētas kontekstā ar nulles modeļiem informācijas telpas nozīmīguma 
novērtēšanai. Nedaudz plašāk šie mēri un to interpretācija aprakstīti rezultātu 
nodaļā ([Individuālu sugu rezultāti](#Chapter10.1)), to izvēles pamatojums un izmantotās 
analītiskās pieejas (ar komandu rindām) raksturotas šīs nodaļas [Nulles modelis](#Chapter7.3).

Šīs nodaļas noslēgumā ([Labākā modeļa rezultāti](#Chapter7.4)) sniegtas komandu 
rindas rezultātu nodaļā izmantoto attēlu sagatavošanai.

## Sākotnēji izvēlēto pazīmju neatkarība un EGV atlases otrā kārta (VIF)  {#Chapter7.1}

Jebkurā prognostiskā statistiskajā modelī, kuram ir nepieciešama gan ekstrapolācijas, 
gan skaidrošanas spēja, regresoriem ir jābūt savstarpēji neatkarīgiem [@McElreathBook],
[@ZuurGAMS]. Turklāt, modelī nav pamata atrasties pazīmēm, kuras nepiedalās sugas 
izplatības prognozēšanā vai sniedz niecīgu pienesumu - jo vairāk EGV, jo skaitļošanā 
izaicinošāks un resursu ietilpīgāks ir jebkurš izstrādājamais modelis.

Pazīmju neatkarības izvērtējums sniegts nodaļā [Multikolinearitāte](#Chapter7.1.1), 
savukārt modelī iekļaujamo pazīmju izvēle - [EGV indikatīvā nozīme kompleksā modelī](#Chapter7.1.2).



### Multikolinearitāte  {#Chapter7.1.1}

Lai gan nereti statistiskajos modeļos par neatkarīgām tiek pieņemtas pazīmes, kuru 
dispresijas efektīvi neprognozē jebkāda kopa ar citām pazīmēm, to raksturojot ar
$\text{VIF} \le 4$ [@ZuurGAMS], vides ekoģeogrāfiskajiem mainīgajiem, to telpiskā 
novietojuma īpašību dēļ, tik zemas vērtības ievērojami ierobežo pieejamo pazīmju 
loku [@Wikleetal2019]. Maksimuma entropijas analīze tiek uzskatīta par relatīvi 
robustu pret EGV savstarpējām korelācijām [@PhillipsDudikSchapire2004], 
[@PhillipsAndersonSchapire2004], tomēr, lai novērstu spēcīgi ietekmētus 
modeļa parametru vērtējumus [@Montgomeryetal2012], izvēlējos tikai tos sākotnēji 
ieplānotos EGV, kuru  $\text{VIF} \le 10$, sekojot [@Avotinsetal2022], [@PucuPlans] 
un [@DzenuPlans] piemēriem.

Šī izvēle veikta R pakotnē {usdm} [@usdm_pakotne], izmantojot sekojošajā koda 
apgabalā pieejamās komandu rindas. Darba gaitā no kopējās EGV izvēles tabulas, 
sagatavota katrai sugai individuāla, tajā pierakstot turpmākam darbam izvēlēto 
EGV aprēķinātās VIF vērtības. To aprēķināšanai izmantota soli-pa-solim EGV izslēgšanas 
pieeja sākot ar EGV ar lielāko VIF vērtību un turpināta līdz visām atlikušajām pazīmēm 
nejauši izlozētos 20 000 punktos aprēķināta $\text{VIF} \le 10$.


``` r
# libs
if(!require(usdm)) {install.packages("usdm"); require(usdm)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}
if(!require(openxlsx)) {install.packages("openxlsx"); require(openxlsx)}
if(!require(doParallel)) {install.packages("doParallel"); require(doParallel)}
if(!require(foreach)) {install.packages("foreach"); require(foreach)}


# EGVs ----
faili=data.frame(fails=list.files(path="./Rastri_100m/Scaled/",
                                  pattern=".tif$"),
                 cels=list.files(path="./Rastri_100m/Scaled/",
                                 pattern=".tif$",full.names = TRUE))

# sugam paredzetie ----
sakumam=read_excel("./Rastri_100m/EGV_putniem.xlsx")


sakumam_long=sakumam %>% 
  pivot_longer(cols = COTCOT:EMBCIT,names_to="suga_kods",values_to="sakuma_izvele")

# Izvēle ----
sugas=levels(factor(sakumam_long$suga_kods))
cl <- makeCluster(8)
registerDoParallel(cl)

foreach(i = 1:length(sugas)) %dopar% {
  suppressPackageStartupMessages(library(tidyverse))
  suppressPackageStartupMessages(library(terra))
  suppressPackageStartupMessages(library(arrow))
  suppressPackageStartupMessages(library(usdm))
  suppressPackageStartupMessages(library(maps))
  suppressPackageStartupMessages(library(rasterVis))
  suppressPackageStartupMessages(library(readxl))
  suppressPackageStartupMessages(library(SDMtune))
  suppressPackageStartupMessages(library(ENMeval))
  suppressPackageStartupMessages(library(zeallot))
  suppressPackageStartupMessages(library(openxlsx))
  print(i)
  sakums=Sys.time()
  suga=sugas[i]
  print(suga)
  sakumsaraksts_sugai=sakumam_long %>% 
    filter(suga_kods==suga)
  isssakums_sugai=sakumsaraksts_sugai %>% 
    filter(sakuma_izvele==1)
  faili_sugai=faili %>% 
    filter(fails %in% isssakums_sugai$scale_NAME)
  rastri_sugai=terra::rast(faili_sugai$cels)
  
  VifStep_sugai=usdm::vifstep(rastri_sugai,th=10,size=20000)
  izslegt=VifStep_sugai@excluded
  saglabat=VifStep_sugai@results
  
  saglabat2=saglabat %>% 
    mutate(faila_nosaukums=paste0(Variables,".tif"),
           sakumVIF=VIF) %>% 
    dplyr::select(faila_nosaukums,sakumVIF)
  sakums2=sakumsaraksts_sugai %>% 
    left_join(saglabat2,by=c("scale_NAME"="faila_nosaukums"))
  
  EGVtabulai=paste0("./SuguModeli/EGVselection/EGV_",suga,".xlsx")
  write.xlsx(sakums2,EGVtabulai)
  beigas=Sys.time()
  ilgums=beigas-sakums
  print(ilgums)
}
stopCluster(cl)
```


### EGV indikatīvā nozīme kompleksā modelī  {#Chapter7.1.2}



Vismaz 1% vidējā permutāciju nozīme sarežģītākajā modelī

## Modeļa parametrizācija, izvēle un izvērtēšanas apraksti  {#Chapter7.2}

Feature types and algorithms

Regularization multipliers

Krosvalidācija

TSS neatkarīgos testa datos

## Nulles modelis  {#Chapter7.3}

salīdzinājums ar nulles modeli


## Labākā modeļa rezultāti  {#Chapter7.4}

Dažādu failu ģenerēšana un modeļa spējas apraksti

Marginālās atbildes funkciju attēli




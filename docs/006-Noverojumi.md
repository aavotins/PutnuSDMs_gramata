# Novērojumu atlase {#Chapter6}


Kopumā šim pētījumam ir iegūtas ir 16 datu kopas, tās ir apvienojamas plašākās 
grupās pēc datu rakstura un būtības:

- pētnieki, eksperti, gredzenotāji:

  - ar sistemātisku datu ieguvi un padziļinātu sugu izpēti strādājošu putnu 
  pētnieku (D. Ūlanda, A. Avotiņa, E. Lediņa, I. Jakovļeva, A. Kalvāna, J. Ķuzes, 
  E. Račinska) personīgo un uzturētajās datubāzēs (daļa, kuras atvēršana nepārkāpj 
  sugu aizsardzības un datu drošības normas, personu līgumsaistības) esošo lauka novērojumu 
  apkopojums;
  
  - nozīmīgāko ar lielo ligzdu apdzīvošanu saistīto sugu aizsardzības un izpētes 
  projektu, kuros notikuši apjomīgi lauka darbi kopš 2016. gada, novērojumi. Šie 
  projekti ir:
  
    -- Latvijas Dabas fonda īstenotais projekts "Mazā ērgļa aizsardzība Latvijā" 
    (LIFE AQPOM Nr.LIFE 13 NAT/LV/001078);
    
    -- Latvijas Ornitoloģijas biedrības īstenotais projekts par sugas aizsardzības 
    plāna izstrādi sugu grupai "Pūces";
    
    -- Latvijas Universitātes īstenotā AS "Latvijas valsts meži" pasūtītā zinātniskās 
    izpētes projekta "Vistu vanaga *Accipiter gentilis* monitoringa pilnveidošana 
    un dzīvotņu piemērotības telpiskā modeļa izveide" (AS “Latvijas valsts meži” 
    dokumenta Nr. 5-5.5.1_000r_101_23_27_6) 2023. gada lauka darbu dati;

- monitoringu dati:

  - "Plēsīgo putnu fona monitoringa" dati no 2017. līdz 2023. gada lauka darbu sezonām;
  
  - "Ligzdojošo putnu uzskaites" dati par 2023. gada lauka darbu sezonu;

- oportūnistiski dabas draugu novērojumi dabas novērojumu no portāla [dabasdati.lv](https://dabasdati.lv/lv) [SQL-dump: 2023-12-01];

- DAP dabas datu pārvaldības sistēmas OZOLS [brīvpieejas informācija](https://data.gov.lv/dati/organization/dap) [lejupielāde: 2024-11-17].


Datu meklēšanas komunikācijā un sākotnējās apkopošanas procesā pieprasīti tikai 
kā punkti reģistrēti novērojumi.

Šajās datu kopās apkopotā informācija izmantota sugu izplatības/dzīvotņu piemērotības 
modeļu apmācībai, validācijai un testēšanai. Protams, pirms modeļa sagatavošanas 
ir nepieciešama datu tīrīšana - tikai uzticamo novērojumu atlase no vietām, 
kurās nav notikušas ievērojamas vides pārmaiņas, izslēdzot dublikātus utml. 
Lai to paveiktu, nepieciešams harmonizēt datu kopas. Harmonizēšanas ietvaros 
veikta sākotnējā atlase, kas dokumentēta līdz ar lauku aprakstu. Pēc harmonizēšanas 
datu kopas apvienotas, ievērojot secību, kāda ir augstāk esošajā uzskaitījaumā 
(tai ir nozīme dupbikātu izslēgšanā), un veikta novērojumu atlase (tīrīšana) 
modelēšanai, kas aprakstīta sekojošajās nodaļās.


Pirms datu kopu harmonizēšanas katrai no tām piešķirti pieci lauki, kuros veikta 
sugu nosaukumu harmonizēšana ar citos projektos izmantoto, sekojot Latvijas 
Ornitoloģijas biedrības padomē apstiprinātajm un publicētajam [putnu sugu nosaukumu sarakstam](https://putnidaba.lob.lv/latvijas-putnu-nosaukumi/). Pievienotie lauki:

- `Grupa`: visos gadījumumos satur vērtību "Putni";

- `NR`: sugas numurs pēc kārtas, saskaņā ar sarakstu. Var izmantot kartošanai 
taksonomiskās sistemātiskas kārtībā;

- `Name_key`: apvienots Latviskais un zinātniskais nosaukums;

- `KODS`: sugas apzīmējums ar sešiem lielajiem burtiem. Tas veidots no zinātniskā 
nosaukuma ģints apzīmējuma pirmajiem trīs burtiem un sugas epiteta pirmajiem trīs 
burtiem, izņemot sugas, kurām tie atkārtojas - tādā gadījumā visām sugām pēdējie 
trīs burti apzīmējumā ir no sugas epiteta pēdējiem trīs burtiem;

- `zinatniski`: zinātniskais nosaukums.

Visās datu kopās izveidoti sekojoši lauki, veicoet vērtību ievietošanu vai 
ierakstu izslēgšanu, sekojot uzskaitījumam:

- `gads`: novērojuma gads. Izdalīts no novērojuma datuma (periodu gadījumā - 
sākuma datuma), ja nav atsevišķi norādīts;

- `datums_no`: novērojuma datums vai ar novērojumu aptvertā perioda sākuma 
datums. Daļā gadījumu precīzs datums nav bijis zināms. Ekspertu datu kopās, kurās 
ir ziņots par apdzīvotām ligzdām, ievietots atbilstošā gada 15.jūnijs, pārējos 
gadījumos ieraksti izslēgti;

- `datums_lidz`: ar novērojumu aptvertā perioda beigu datums; "NA", ja novērojums 
neattiecas uz periodu;

- `nov_periods`: ar novērojumu aptvertā perioda ilgums dienās kā starpība starp 
lauku `datums_lidz` un `datums_no` starpība; ja vērtība ir tikai laukā `datums_no`, 
ievietota vērtība "0";

- `pazime`: datu kopā reģistrētā [ligzdošanas ticamības pazīme](https://www.lob.lv/projekti/latvijas-ligzdojoso-putnu-atlants/llpa-metodika/latvijas-ligzdojoso-putnu-atlanta-instrukcija/pazimes/); "NA", ja tādas 
nav, bet ir ligzdošanas ticamības kategorija, izņemot ekspertu datus, kuros 
ziņojumiem par apzīvotām ligzdām piešķirta vērtība "AL";

- `BreedCat`: [ligzdošanas ticamības kategorija](https://www.lob.lv/projekti/latvijas-ligzdojoso-putnu-atlants/llpa-metodika/latvijas-ligzdojoso-putnu-atlanta-instrukcija/pazimes/) kā reģistrēta datu kopā vai ievietota atbilstoši vērtībai laukā `pazime`. 
Ieraksti, kuriem nav ne ligzdošanas ticamības pazīmes, ne kategorijas, izslēgti. 
Izslēgti arī novērojumi, kuriem reģistrētie statusi nav attiecināmi uz ligzdošanu;

- `BreedCode`: skaitliski kodēta ligzdošanas ticamības kategorija: 

  - "Pierādīta ligzdošana" = 1;
  
  - "Ticama ligzdošana" = 2;
  
  - "Iespējama ligzdošana" = 3;

- `lksX`: Latvijas taisnleņķa projicēto koordinātu 
sistēmas ([epsg: 3059](https://epsg.io/3059)) X-koordināte;

- `lksY`: Latvijas taisnleņķa projicēto koordinātu 
sistēmas ([epsg: 3059](https://epsg.io/3059)) Y-koordināte;

- `DatuKopa`: datu kopas nosaukums plašās kategorijās: "eksperti", "monitoringi", 
"dabasdati", "DAP", "TestaKopa".

Visi novērojumi sagatavoti atbilstībai Latvijas taisnleņķa projicēto koordinātu 
sistēmai ([epsg: 3059](https://epsg.io/3059)) `simple features` objektā, kas 
saglabāts diskā Arrow *parquet* failā, izmantojot R pakotnes {arrow} funkcionalitāti. 
Novērojumi telpiski savienoti ar 100 m un 1 km [vektordatu režģi](#Chapter2.1). Šīs 
procedūras ietvaros pievienoti sekojoši lauki:

- `tikls100`: Latvijas 100 m vektordatu režģa šūnas, kurā atrodas novērojuma 
punkts, identifikators. No turpmākām darbībām izslēgti novērojumi, kuri nesavienojas 
ar šiem tīkliem;

- `tikls1000`:  Latvijas 1 km vektordatu režģa šūnas, kurā atrodas novērojuma 
punkts, identifikators. No turpmākām darbībām izslēgti novērojumi, kuri nesavienojas 
ar šiem tīkliem.

Šī darba laikā arī izslēdzu novērojumus, kuri apraksta neapdzīvotas 
ligzdas vai norāda neprecīzas koordinātes. Dabasdatu kopā izslēdzu novērojumus, kurus reģistrējušai personai uzticamības līmenis atzīmēts kā "Apzinātas muļķības" vai "Biežas kļūdas elementārās lietās". 




Vienīgajai sugai, kurai pieejama uzticama testa kopa - vistu vanagam (AS "Latvijas valsts meži" 
zinātniskās izpētes pakalpojuma projekta "Vistu 
vanaga *Accipiter gentilis* monitoringa pilnveidošana un dzīvotņu piemērotības 
telpiskā modeļa izveide" (AS “Latvijas valsts meži” dokumenta 
Nr. 5-5.5.1_000r_101_23_27_6) 2024. gada lauka darbu rezultāti), uzreiz veicu 
novērojumu atlasi līdz vienam punktam 1 km tīklā.

Ar sagatavoto harmonizēto datu kopu turpināju novērojumu atlasi modelēšanai.

## Novērojumu atlase {#Chapter6.1}

Novērojumu atlase sugu izplatības modelēšanai veikta vairākos soļos:

1. solis: tikai analizējamo sugu atlase;

2. solis: novērojumi no 2017-01-01 līdz 2023-12-01, saglabāju tikai tos, kuri 
attiecas uz ziņošanas laika periodu, kas nepārsniedz 10 dienas un nav mazāks par -1 dienu;

3. solis: dublieru izslēgšana - gan no ik viena datu avota, gan datu avotu kopas;

4. solis: savienošana ar [Corine Land Cover](#Chapter3.1.6) klasēm acīmredzami nekorekto novērojumu izslēgšanai;

5. solis: novērojums veikts [ligzdošanas sezonā](#Chapter1.3.2);

6. solis: saistīšana ar [vides pārmaiņām](#Chapter3.3);

7. solis: papildkritērijs vistu vanagam - attālums no apdzīvotajām vietām;

8. solis: novērojumu apjoma un izvietojuma izvērtēšana, lēmumu modelēšanai pieņemšana.



**Tā kā šajā apakšnodaļā esošais darbs ir izpildāms tikai secīgi, komandu rindu apgabalos kopīgās daļas neatkārtoju - tie izpildāmi tikai secīgi**

Sekojošajā koda apgabalā esošie kritēriji novērojumu atlasei ir tie paši, kas apskatāmi 
nodaļā [pamata apraksti novērojumu atlasei](#Chapter1.3).


``` r
# pakotnes darbam
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(readxl)) {install.packages("readxl"); require(readxl)}
if(!require(openxlsx)) {install.packages("openxlsx"); require(openxlsx)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(patchwork)) {install.packages("patchwork"); require(patchwork)}
if(!require(ggthemes)) {install.packages("ggthemes"); require(ggthemes)}
if(!require(ggtext)) {install.packages("ggtext"); require(ggtext)}



# Apvienoti novērojumi
dati=read_parquet("./IevadesDati/Noverojumi/apkopoti/apvienoti_putni.parquet")

# atlases kritēriji
kriteriji=read_excel("./IevadesDati/Noverojumi/apkopoti/NoverojumuAtlasei.xlsx")
```




### Solis 1: Analizējamās sugas {#Chapter6.1.1}

Tikai [analizējamo sugu izvēle](#Chapter1.1) lokā iekļauto sugu novērojumi. Veicot 
atlasi, turpmākam darbam saglabājas 524 151 novērojumi. Pārējos 486 631 novērojumu 
no turpmākās datu apstrādes faila izslēdzu, lai atvieglotu tā procesēšanu.

Turpmākās atlases gaitā iestrādāšu atzīmi par novēorjuma iekļaušanu vai izslēgšanu, 
lai nodrošinātu izsekojamību darba gaitai.




``` r
# solis 1 ----
dati=dati %>% 
  mutate(solis1=ifelse(KODS %in% kriteriji$kods,1,0))
table(dati$solis1,useNA="always")
# tiek izslēgti 486631 novērojumi, paliek - 524151
dati2=dati %>% 
  filter(solis1==1)
```


### Solis 2: Datums un laiks {#Chapter6.1.2}

Novērojumi no 2017-01-01 līdz 2023-12-01 un novērojumu periods ir [-1,10] dienas. 
Šajā solī (neatkarīgi no citiem) no izmantošanas modelēšanā tiek izslēgti 132 842 novērojumi.



``` r
# solis 2 ----
dati2=dati2 %>% 
  mutate(solis2=ifelse(datums_no>=as.Date("2017-01-01")&
                         (datums_lidz<=as.Date("2023-12-01")|is.na(datums_lidz))&
                         (nov_periods>=-1&nov_periods<=10),1,0))
table(dati2$solis2,useNA="always")
#       0      1   <NA> 
#  132842 391309      0 
```

### Solis 3: Dublieri {#Chapter6.1.3}

Dublieru izslēgšana. Izslēgšanai izmantoju lauku `Name_key`, `BreedCat`, `datums_no`, `tikls100` un `tikls1000` apvienojumu. 

Šajā solī tiek izslēgti 88 138 novērojumi (neatkarīgi no iepriekšējiem soļiem).


``` r
# solis 3 ----

dati2=dati2 %>% 
  mutate(dublieriem=paste0(Name_key,"_",BreedCat,"_",datums_no,"_",tikls100,"_",tikls1000)) %>% 
  mutate(solis3=as.numeric(!duplicated(dublieriem))) %>% 
  dplyr::select(-dublieriem)

table(dati2$solis3,useNA="always")
#       0      1   <NA> 
#  88138 436013      0 
```

### Solis 4: Novietojums {#Chapter6.1.4}

Savienošana ar Corine LandCover klasēm acīmredzami nekorekto novērojumu izslēgšanai. 
Šis ir plašāk aprakstīts nodaļā [nepiemērota vide](#Chapter1.3.1), tomēr uzsveru, ka šī 
soļa mērķis un uzdevums ir atbrīvoties no novērojumiem, kas visticamāk ir pozicionēšanas 
kļūda.

Šajā solī tiek izslēgti 12 008 novērojumi (neatkarīgi no iepriekšējiem soļiem).


``` r
# solis 4 ----

clc=st_read_parquet("./IevadesDati/CLC/CLC_LV_2018.parquet")
maksligie=c("111","112","121","122","123","124","131","132","133","142")
atvertie=c("211","222","231","242","243","321","322","331")
koki=c("141","311","312","313","324","333")
mitraji=c("411","412")
udeni=c("511","512","523")
clc = clc %>% 
  mutate(clc_kopa=ifelse(code_18 %in% maksligie,"maksligie",
                         ifelse(code_18 %in% atvertie,"atvertie",
                                ifelse(code_18 %in% koki, "koki",
                                       ifelse(code_18 %in% mitraji,"mitraji",
                                              ifelse(code_18 %in% udeni, "udeni",NA)))))) %>% 
  dplyr::select(clc_kopa)
clc_lks=st_transform(clc,crs=3059)

dati_sf=dati %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059) %>% 
  dplyr::select(novID,KODS) %>% 
  st_join(clc_lks)
dati_clc=data.frame(dati_sf) %>% 
  dplyr::select(novID,KODS,clc_kopa)

dati_clcKrit=dati_clc %>% 
  left_join(kriteriji,by=c("KODS"="kods"))
dati_clcKrit2=dati_clcKrit %>% 
  mutate(solis4=ifelse(clc_kopa=="maksligie"&!is.na(Maksligie),0,1),
         solis4=ifelse(clc_kopa=="atvertie"&!is.na(Atvertie),0,solis4),
         solis4=ifelse(clc_kopa=="koki"&!is.na(Koki),0,solis4),
         solis4=ifelse(clc_kopa=="mitraji"&!is.na(Mitraji),0,solis4),
         solis4=ifelse(clc_kopa=="udeni"&!is.na(Udeni),0,solis4),
         solis4=ifelse(is.na(clc_kopa)&is.na(solis4)&
                         (KODS %in% c("CHADUB","CHAHIA","TADTAD")),1,solis4),
         solis4=ifelse(is.na(clc_kopa)&is.na(solis4),0,solis4))

table(dati_clcKrit2$solis4,useNA="always")
#       0      1   <NA> 
#  12008 998774      0 

pievienot_solis4=dati_clcKrit2 %>% 
  dplyr::select(novID,clc_kopa,solis4)

dati2=dati2 %>% 
  left_join(pievienot_solis4,by="novID") 
```

### Solis 5: Sezonalitāte {#Chapter6.1.5}

Ligzdošanas sezona, izņemot pierādītajām ligzdošanām ekspertu datos (tas iestrādāts 
jau harmonizēšanas gaitā). Pārējās datubāzēs tie saglabāti kā izslēdzami, jo 
nav droši zināms ligzdošanas gads vai attālums, kādā mazuļi jau no ligzdas pārvietojušies.

Sugām raksturīgās ligzdošanas laika noteikšana raksturota nodaļā [ligzdošanas sezona](#Chapter1.3.2).

Šajā solī tiek izslēgti 85 793 novērojumi (neatkarīgi no iepriekšējiem soļiem).


``` r
# solis 5 ----
sezonai=kriteriji %>% 
  dplyr::select(kods,Ligzd_sakums,Ligzd_beigas)
dati2=dati2 %>% 
  left_join(sezonai,by=c("KODS"="kods"))
dati2=dati2 %>% 
  mutate(sakums_DoY=lubridate::yday(datums_no),
         beigas_DoY=ifelse(!is.na(datums_lidz),lubridate::yday(datums_lidz),lubridate::yday(datums_no))) %>% 
  mutate(solis5=ifelse(sakums_DoY>=Ligzd_sakums&
                         sakums_DoY<=Ligzd_beigas&
                         beigas_DoY>=Ligzd_sakums&
                         beigas_DoY<=Ligzd_beigas,1,0))

table(dati2$solis5,useNA="always")
#       0      1   <NA> 
#  85793 438358      0
```

### Solis 6: Vides pārmaiņas {#Chapter6.1.6}


Katrs novērojums saistīts ar [vides pārmaiņām](#Chapter3.3) **Global Forest Watch** (ik gadu izzudušais koku vainagu segums) un **DynamicWorld** (klašu atšķirības divos sekojošos gados) datu salīdzinājumos.  Katrai sugai aprēķinātas vides pārmaiņas katrā no minētajiem avotiem gan analīzes šūnā, gan [dzīves telpai raksturīgajā rādiusā](#Chapter1.2) ap analīzes šūnas centru. Aprēķini veikti novērošanas gadā un katram gadam uz priekšu līdz 2023. gadam. Tomēr 2023 gada novērojumiem šī analīze nav veikta, jo sagatavotie vides apraksti raksturo situāciju 2023. gadā. Kā tālāk neizmantojami atzīmēti 285 567 novērojumi, kuru analīzes šūnās vai dzīves telpu raksturojošā buferzonā ap novērojuma šūnu ir notikušas pārmaiņas koku vainagu segumā vai zemes seguma/zemes lietojuma veida klasēs apjomā, kas ir vismaz 10% no attiecīgās platības.



``` r
# solis 6 ----

## Saistīšana ar vides pārmaiņām

radiusiem=kriteriji %>% 
  dplyr::select(kods,radiuss)
dati2=dati2 %>% 
  left_join(radiusiem,by=c("KODS"="kods"))
vides_parmainas=st_read_parquet("./VidesParmainas/VidesParmainas_visas.parquet")
vides_parmainas=data.frame(vides_parmainas) %>% 
  dplyr::select(-geom)
datiem=dati2 %>% 
  dplyr::select(tikls100,novID,gads,radiuss)
datiem=datiem %>% 
  left_join(vides_parmainas,by=c("tikls100"="id"))

## solis 6 r500 ----

datiem_r500=datiem %>% 
  filter(radiuss==500)

datiem_r500=datiem_r500 %>% 
  rowwise() %>% 
  mutate(cell_TCL=ifelse(gads==2017,
                         sum(c(cell_TCL17,cell_TCL18,cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         NA)) %>% 
  mutate(cell_TCL=ifelse(gads==2018,
                         sum(c(cell_TCL18,cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2019,
                         sum(c(cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2020,
                         sum(c(cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2021,
                         sum(c(cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2022,
                         sum(c(cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2023,
                         sum(c(cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2017,
                       sum(c(r500_TCL17,r500_TCL18,r500_TCL19,r500_TCL20,r500_TCL21,r500_TCL22,r500_TCL23),
                           na.rm=TRUE),
                       NA)) %>% 
  mutate(hr_TCL=ifelse(gads==2018,
                       sum(c(r500_TCL18,r500_TCL19,r500_TCL20,r500_TCL21,r500_TCL22,r500_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2019,
                       sum(c(r500_TCL19,r500_TCL20,r500_TCL21,r500_TCL22,r500_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2020,
                       sum(c(r500_TCL20,r500_TCL21,r500_TCL22,r500_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2021,
                       sum(c(r500_TCL21,r500_TCL22,r500_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2022,
                       sum(c(r500_TCL22,r500_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2023,
                       sum(c(r500_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(cell_DWchange=ifelse(gads==2017,
                              sum(c(cell_DWchange1718,cell_DWchange1819,cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              NA)) %>% 
  mutate(cell_DWchange=ifelse(gads==2018,
                              sum(c(cell_DWchange1819,cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2019,
                              sum(c(cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2020,
                              sum(c(cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2021,
                              sum(c(cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2022,
                              sum(c(cell_DWchange2223),
                                  na.rm=TRUE),
                              ifelse(is.na(cell_DWchange),1,cell_DWchange))) %>%
  mutate(cell_DWchange=ifelse(gads==2023,0,cell_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2017,
                            sum(c(r500_DWchange1718,r500_DWchange1819,r500_DWchange1920,r500_DWchange2021,
                                  r500_DWchange2122,r500_DWchange2223),
                                na.rm=TRUE),
                            NA)) %>% 
  mutate(hr_DWchange=ifelse(gads==2018,
                            sum(c(r500_DWchange1819,r500_DWchange1920,r500_DWchange2021,
                                  r500_DWchange2122,r500_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2019,
                            sum(c(r500_DWchange1920,r500_DWchange2021,
                                  r500_DWchange2122,r500_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2020,
                            sum(c(r500_DWchange2021,
                                  r500_DWchange2122,r500_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2021,
                            sum(c(r500_DWchange2122,r500_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2022,
                            sum(c(r500_DWchange2223),
                                na.rm=TRUE),
                            ifelse(is.na(hr_DWchange),1,hr_DWchange))) %>%
  mutate(hr_DWchange=ifelse(gads==2023,0,hr_DWchange)) %>% 
  mutate(solis6=ifelse(cell_TCL<0.1&cell_DWchange<0.1&hr_TCL<0.1&hr_DWchange<0.1,1,0))
table(datiem_r500$solis6,useNA="always")
table(datiem_r500$solis6,datiem_r500$gads,useNA="always")

datiem_r500=datiem_r500 %>% 
  dplyr::select(novID,cell_TCL,hr_TCL,cell_DWchange,hr_DWchange,solis6)


## solis 6 r1250 ----

datiem_r1250=datiem %>% 
  filter(radiuss==1250)

datiem_r1250=datiem_r1250 %>% 
  rowwise() %>% 
  mutate(cell_TCL=ifelse(gads==2017,
                         sum(c(cell_TCL17,cell_TCL18,cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         NA)) %>% 
  mutate(cell_TCL=ifelse(gads==2018,
                         sum(c(cell_TCL18,cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2019,
                         sum(c(cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2020,
                         sum(c(cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2021,
                         sum(c(cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2022,
                         sum(c(cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2023,
                         sum(c(cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2017,
                       sum(c(r1250_TCL17,r1250_TCL18,r1250_TCL19,r1250_TCL20,r1250_TCL21,r1250_TCL22,r1250_TCL23),
                           na.rm=TRUE),
                       NA)) %>% 
  mutate(hr_TCL=ifelse(gads==2018,
                       sum(c(r1250_TCL18,r1250_TCL19,r1250_TCL20,r1250_TCL21,r1250_TCL22,r1250_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2019,
                       sum(c(r1250_TCL19,r1250_TCL20,r1250_TCL21,r1250_TCL22,r1250_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2020,
                       sum(c(r1250_TCL20,r1250_TCL21,r1250_TCL22,r1250_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2021,
                       sum(c(r1250_TCL21,r1250_TCL22,r1250_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2022,
                       sum(c(r1250_TCL22,r1250_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2023,
                       sum(c(r1250_TCL23),
                           na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(cell_DWchange=ifelse(gads==2017,
                              sum(c(cell_DWchange1718,cell_DWchange1819,cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              NA)) %>% 
  mutate(cell_DWchange=ifelse(gads==2018,
                              sum(c(cell_DWchange1819,cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2019,
                              sum(c(cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2020,
                              sum(c(cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2021,
                              sum(c(cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2022,
                              sum(c(cell_DWchange2223),
                                  na.rm=TRUE),
                              ifelse(is.na(cell_DWchange),1,cell_DWchange))) %>%
  mutate(cell_DWchange=ifelse(gads==2023,0,cell_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2017,
                            sum(c(r1250_DWchange1718,r1250_DWchange1819,r1250_DWchange1920,r1250_DWchange2021,
                                  r1250_DWchange2122,r1250_DWchange2223),
                                na.rm=TRUE),
                            NA)) %>% 
  mutate(hr_DWchange=ifelse(gads==2018,
                            sum(c(r1250_DWchange1819,r1250_DWchange1920,r1250_DWchange2021,
                                  r1250_DWchange2122,r1250_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2019,
                            sum(c(r1250_DWchange1920,r1250_DWchange2021,
                                  r1250_DWchange2122,r1250_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2020,
                            sum(c(r1250_DWchange2021,
                                  r1250_DWchange2122,r1250_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2021,
                            sum(c(r1250_DWchange2122,r1250_DWchange2223),
                                na.rm=TRUE),
                            hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2022,
                            sum(c(r1250_DWchange2223),
                                na.rm=TRUE),
                            ifelse(is.na(hr_DWchange),1,hr_DWchange))) %>%
  mutate(hr_DWchange=ifelse(gads==2023,0,hr_DWchange)) %>% 
  mutate(solis6=ifelse(cell_TCL<0.1&cell_DWchange<0.1&hr_TCL<0.1&hr_DWchange<0.1,1,0))
table(datiem_r1250$solis6,useNA="always")
table(datiem_r1250$solis6,datiem_r1250$gads,useNA="always")

datiem_r1250=datiem_r1250 %>% 
  dplyr::select(novID,cell_TCL,hr_TCL,cell_DWchange,hr_DWchange,solis6)
## solis 6 r3000 ----

datiem_r3000=datiem %>% 
  filter(radiuss==3000)

datiem_r3000=datiem_r3000 %>% 
  rowwise() %>% 
  mutate(cell_TCL=ifelse(gads==2017,
                         sum(c(cell_TCL17,cell_TCL18,cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         NA)) %>% 
  mutate(cell_TCL=ifelse(gads==2018,
                         sum(c(cell_TCL18,cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2019,
                         sum(c(cell_TCL19,cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2020,
                         sum(c(cell_TCL20,cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2021,
                         sum(c(cell_TCL21,cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2022,
                         sum(c(cell_TCL22,cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(cell_TCL=ifelse(gads==2023,
                         sum(c(cell_TCL23),
                             na.rm=TRUE),
                         cell_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2017,
                          sum(c(r3000_TCL17,r3000_TCL18,r3000_TCL19,r3000_TCL20,r3000_TCL21,r3000_TCL22,r3000_TCL23),
                              na.rm=TRUE),
                          NA)) %>% 
  mutate(hr_TCL=ifelse(gads==2018,
                          sum(c(r3000_TCL18,r3000_TCL19,r3000_TCL20,r3000_TCL21,r3000_TCL22,r3000_TCL23),
                              na.rm=TRUE),
                          hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2019,
                          sum(c(r3000_TCL19,r3000_TCL20,r3000_TCL21,r3000_TCL22,r3000_TCL23),
                              na.rm=TRUE),
                          hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2020,
                          sum(c(r3000_TCL20,r3000_TCL21,r3000_TCL22,r3000_TCL23),
                              na.rm=TRUE),
                          hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2021,
                          sum(c(r3000_TCL21,r3000_TCL22,r3000_TCL23),
                              na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2022,
                          sum(c(r3000_TCL22,r3000_TCL23),
                              na.rm=TRUE),
                          hr_TCL)) %>% 
  mutate(hr_TCL=ifelse(gads==2023,
                          sum(c(r3000_TCL23),
                              na.rm=TRUE),
                       hr_TCL)) %>% 
  mutate(cell_DWchange=ifelse(gads==2017,
                              sum(c(cell_DWchange1718,cell_DWchange1819,cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              NA)) %>% 
  mutate(cell_DWchange=ifelse(gads==2018,
                              sum(c(cell_DWchange1819,cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2019,
                              sum(c(cell_DWchange1920,cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2020,
                              sum(c(cell_DWchange2021,
                                    cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2021,
                              sum(c(cell_DWchange2122,cell_DWchange2223),
                                  na.rm=TRUE),
                              cell_DWchange)) %>% 
  mutate(cell_DWchange=ifelse(gads==2022,
                              sum(c(cell_DWchange2223),
                                  na.rm=TRUE),
                              ifelse(is.na(cell_DWchange),1,cell_DWchange))) %>%
  mutate(cell_DWchange=ifelse(gads==2023,0,cell_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2017,
                               sum(c(r3000_DWchange1718,r3000_DWchange1819,r3000_DWchange1920,r3000_DWchange2021,
                                     r3000_DWchange2122,r3000_DWchange2223),
                                   na.rm=TRUE),
                               NA)) %>% 
  mutate(hr_DWchange=ifelse(gads==2018,
                               sum(c(r3000_DWchange1819,r3000_DWchange1920,r3000_DWchange2021,
                                     r3000_DWchange2122,r3000_DWchange2223),
                                   na.rm=TRUE),
                               hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2019,
                               sum(c(r3000_DWchange1920,r3000_DWchange2021,
                                     r3000_DWchange2122,r3000_DWchange2223),
                                   na.rm=TRUE),
                               hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2020,
                               sum(c(r3000_DWchange2021,
                                     r3000_DWchange2122,r3000_DWchange2223),
                                   na.rm=TRUE),
                               hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2021,
                               sum(c(r3000_DWchange2122,r3000_DWchange2223),
                                   na.rm=TRUE),
                               hr_DWchange)) %>% 
  mutate(hr_DWchange=ifelse(gads==2022,
                               sum(c(r3000_DWchange2223),
                                   na.rm=TRUE),
                               ifelse(is.na(hr_DWchange),1,hr_DWchange))) %>%
  mutate(hr_DWchange=ifelse(gads==2023,0,hr_DWchange)) %>% 
  mutate(solis6=ifelse(cell_TCL<0.1&cell_DWchange<0.1&hr_TCL<0.1&hr_DWchange<0.1,1,0))
table(datiem_r3000$solis6,useNA="always")
table(datiem_r3000$solis6,datiem_r3000$gads,useNA="always")

datiem_r3000=datiem_r3000 %>% 
  dplyr::select(novID,cell_TCL,hr_TCL,cell_DWchange,hr_DWchange,solis6)

## apvienošana ----

datiem_videsparmainas=rbind(datiem_r500,datiem_r1250,datiem_r3000)

dati2=dati2 %>% 
  left_join(datiem_videsparmainas,by="novID")
table(dati2$solis6,useNA="always")
#       0      1   <NA> 
#  285567 238584      0 


arrow::write_parquet(dati2,"./IevadesDati/Noverojumi/apkopoti/putnu_dati2_solis6.parquet")

rm(vides_parmainas)
rm(datiem)
rm(datiem_videsparmainas)
rm(datiem_r500)
rm(datiem_r1250)
rm(datiem_r3000)
rm(dati_sf)
rm(dati_clc)
rm(dati_clcKrit)
rm(dati_clcKrit2)
rm(izkritosie)
rm(pievienot_solis4)
rm(radiusiem)
rm(clc)
```


### Solis 7: Papildkritēriji {#Chapter6.1.7}

Vienīga suga, kurai izmantoti papildkritēriji ir vistu vanags, kuram aprēķināts attālums no CLC atpazītas mākslīgās vides. Kā attāluma slieksni izvēlos 3000 m, kas ir apmēram sugas ligzdošanas iecirkņa rādiusa centrālā vērtība. Teritorijas lieluma rādiuss ir izrietošs no pētījumiem ar radioraitītājiem, šajos pētījumos ir skaidri redzams, ka teritorija netiek izmantota vienmērīgi un lielāki attālumi no ligzdas tiek izmantoti retāk. Tajā pašā laikā, uz labām barošanās vietām var lidot arī krietni tālāk par vidējā iecirkņa rādiusu. Izmantoju CLC datus, jo tie neuztver nelielas apbūves teritorijas, bet ar pilsētu saistītās klases laukos, piemēram, lielās fermas, ir pilsētvidei pietiekoši līdzīgas teritorijas. Tomēr šajā pētījumā modelējam vanagus, kas galvenokārt ir atkarīgi no mežiem un apstākļiem tajos.

Šajā solī tiek izslēgti 1 655 novērojumi (neatkarīgi no iepriekšējiem soļiem)


``` r
# solis 7 ----
accgen=dati2 %>% 
  filter(KODS=="ACCGEN") %>% 
  dplyr::select(novID,lksX,lksY)
clc_maksligie=clc_lks %>% 
  filter(clc_kopa=="maksligie")
accgen_sf=accgen %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
a=st_distance(accgen_sf,clc_maksligie)
b=apply(a,1,min)
accgen$dist_clc1=b
accgen$solis7=ifelse(accgen$dist_clc1<3000,0,1)
table(accgen$solis7,useNA="always")
accgen=accgen %>% 
  dplyr::select(novID,dist_clc1,solis7)
dati2=dati2 %>% 
  dplyr::select(-dist_clc1.x,-dist_clc1.y,-"1",-solis7.x,-solis7.y)
dati2=dati2 %>% 
  left_join(accgen,by="novID")
dati2=dati2 %>% 
  mutate(solis7=ifelse(is.na(solis7),1,solis7))
table(dati2$solis7,useNA="always")
#     0      1   <NA> 
#  1655 522496      0 
arrow::write_parquet(dati2,"./IevadesDati/Noverojumi/apkopoti/putnu_dati2_solis7.parquet")
```


### Solis 8: novērojumu apjoma un izvietojuma izvērtēšana, lēmumu modelēšanai pieņemšana {#Chapter6.1.8}

Ligzdošanas ticamības pakāpju pierēķināšana, lai izvēlētos uzticamākos, bet pietiekoša apjoma datus bez acīmredzamām telpiskajām problēmām

Lai pieņemtu ik sugai vērtētu, tomēr kopīgai pieejai atbilstošu lēmumu kopu, sagatavota novērojumu skaita tabula un attēli, kuros vizualizēta novērojumu pieejamība dažādās ligzdošanas ticamības kategorījās un to izvietojums.

Sie attēli apskatīti, tabula papildināta ar piezīmēm un sagatavoti papildināti attēli, kuros iestrādāta informācija arī par modelēšanā izmantojamiem apmācību un testa datiem un vidi kopumā raksturojošajām fona vietām. Aizpildītā versija ir [šajā tabulā](./Papilddati/NoverojumuIzvele.xlsx), savukārt katrai sugai sagatavotie attēli (to pilnās versijas) ir [rezultātu nodaļā](#Chapter10).


``` r
# solis 8 ----

dati_atlaseB=dati2 %>% 
  filter(solis1==1) %>% 
  filter(solis2==1) %>% 
  filter(solis3==1) %>% 
  filter(solis4==1) %>% 
  filter(solis5==1) %>% 
  filter(solis6==1) %>% 
  filter(solis7==1)
dati_novB=dati_atlaseB %>% 
  group_by(KODS) %>% 
  summarise(Nov_BCD=n())

dati_atlaseC=dati2 %>% 
  filter(solis1==1) %>% 
  filter(solis2==1) %>% 
  filter(solis3==1) %>% 
  filter(solis4==1) %>% 
  filter(solis5==1) %>% 
  filter(solis6==1) %>% 
  filter(solis7==1) %>% 
  filter(BreedCode<=2)
dati_novC=dati_atlaseC %>% 
  group_by(KODS) %>% 
  summarise(Nov_CD=n())


dati_atlaseD=dati2 %>% 
  filter(solis1==1) %>% 
  filter(solis2==1) %>% 
  filter(solis3==1) %>% 
  filter(solis4==1) %>% 
  filter(solis5==1) %>% 
  filter(solis6==1) %>% 
  filter(solis7==1) %>% 
  filter(BreedCode==1)
dati_novD=dati_atlaseD %>% 
  group_by(KODS) %>% 
  summarise(Nov_D=n())

unikalajiemB_1km=dati_atlaseB %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  summarise(BCD_1km=n())
unikalajiemC_1km=dati_atlaseC %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  summarise(CD_1km=n())
unikalajiemD_1km=dati_atlaseD %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  summarise(D_1km=n())

unikalajiemB_100=dati_atlaseB %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  group_by(KODS) %>% 
  summarise(BCD_100m=n())
unikalajiemC_100=dati_atlaseC %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  summarise(CD_100m=n())
unikalajiemD_100=dati_atlaseD %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  summarise(D_100m=n())

izvelei_tab=dati_novB %>% 
  left_join(unikalajiemB_1km,by="KODS") %>% 
  left_join(unikalajiemB_100,by="KODS") %>% 
  left_join(dati_novC,by="KODS") %>% 
  left_join(unikalajiemC_1km,by="KODS") %>% 
  left_join(unikalajiemC_100,by="KODS") %>% 
  left_join(dati_novD,by="KODS") %>% 
  left_join(unikalajiemD_1km,by="KODS") %>% 
  left_join(unikalajiemD_100,by="KODS")

radiusi=kriteriji %>% 
  dplyr::select(kods,radiuss)

izvelei_tab_r=izvelei_tab %>% 
  left_join(radiusi,by=c("KODS"="kods"))

write.xlsx(izvelei_tab_r,"./IevadesDati/Noverojumi/apkopoti/tabula_izvelei.xlsx")

dati2_sf=dati2 %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)

dati_atlaseB_sf=dati_atlaseB %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
dati_atlaseC_sf=dati_atlaseC %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
dati_atlaseD_sf=dati_atlaseD %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)


unikalieB_1km=dati_atlaseB_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  ungroup()
unikalieC_1km=dati_atlaseC_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  ungroup()
unikalieD_1km=dati_atlaseD_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  ungroup()

unikalieB_100=dati_atlaseB_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  ungroup()
unikalieC_100=dati_atlaseC_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  ungroup()
unikalieD_100=dati_atlaseD_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  ungroup()

admin=read_sf("./Templates/TemplateGrids/administrativas_teritorijas_2021/Administrativas_teritorijas_2021.shp")

kodi=levels(factor(dati2$KODS))

### soli ----

beigam=dati2 %>% 
  dplyr::select(KODS,solis1,solis2,solis3,solis4,solis5,solis6,solis7)

solis1=beigam %>% 
  mutate(solis="solis 1") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=0,
            saglabat=n())

solis2=beigam %>% 
  mutate(solis="solis 2") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis2!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis2==1,1,0),na.rm=TRUE))


solis3=beigam %>% 
  filter(solis2==1) %>% 
  mutate(solis="solis 3") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis3!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis3==1,1,0),na.rm=TRUE))

solis4=beigam %>% 
  filter(solis2==1&solis3==1) %>% 
  mutate(solis="solis 4") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis4!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis4==1|is.na(solis4),1,0),na.rm=TRUE))

solis5=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1) %>% 
  mutate(solis = "solis 5") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis5!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis5==1,1,0),na.rm=TRUE))

solis6=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1&solis5==1) %>% 
  mutate(solis = "solis 6") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis6!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis6==1,1,0),na.rm=TRUE))

solis7=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1&solis5==1&solis6==1) %>% 
  mutate(solis = "solis 7") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis7!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis7==1,1,0),na.rm=TRUE))

soli=bind_rows(solis1,solis2,solis3,solis4,solis5,solis6,solis7)
soli2=soli %>% 
  ungroup() %>% 
  mutate(soli_seciba=factor(solis,ordered = TRUE,
                            levels=c("solis 1","solis 2","solis 3","solis 4",
                                     "solis 5","solis 6","solis 7","solis 8"))) %>% 
  pivot_longer(cols=saglabat:izmest,names_to = "darbiba",values_to = "skaits")



### abi atteli ----

dir.create("./IevadesDati/Noverojumi/apkopoti/AtteliIzvelei")

for(i in seq_along(kodi)){
  sakums=Sys.time()
  print(i)
  suga=kodi[i]
  print(suga)
  visi=dati2_sf %>% 
    filter(KODS==suga)
  skaits_visi=nrow(visi)
  BCD_1km=unikalieB_1km %>% 
    filter(KODS==suga)
  skaits_BCD1km=nrow(BCD_1km)
  BCD_100=unikalieB_100 %>% 
    filter(KODS==suga)
  skaits_BCD100=nrow(BCD_100)
  CD_1km=unikalieC_1km %>% 
    filter(KODS==suga)
  skaits_CD1km=nrow(CD_1km)
  CD_100=unikalieC_100 %>% 
    filter(KODS==suga)
  skaits_CD100=nrow(CD_100)
  D_1km=unikalieD_1km %>% 
    filter(KODS==suga)
  skaits_D1km=nrow(D_1km)
  D_100=unikalieD_100 %>% 
    filter(KODS==suga)
  skaits_D100=nrow(D_100)
  
  
  pic1=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=visi,col="grey20",alpha=0.5)+
    labs(subtitle=paste0("Visi pirms atlases (n=",skaits_visi,")"))
  
  pic2=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=BCD_1km,col="red")+
    geom_sf(data=BCD_100,col="black",pch=3,size=3)+
    labs(subtitle=paste0("Telpiski unikālie BCD pēc atlases (N=",
                         skaits_BCD1km,", n=",skaits_BCD100,")"))
  
  pic3=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=CD_1km,col="red")+
    geom_sf(data=CD_100,col="black",pch=3,size=3)+
    labs(subtitle=paste0("Telpiski unikālie CD pēc atlases (N=",
                         skaits_CD1km,", n=",skaits_CD100,")"))
  
  pic4=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=D_1km,col="red")+
    geom_sf(data=D_100,col="black",pch=3,size=3)+
    labs(subtitle=paste0("Telpiski unikālie D pēc atlases (N=",
                         skaits_D1km,", n=",skaits_D100,")"))
  
  solu_dati=soli2 %>% 
    filter(KODS==suga)
  
  stabini=ggplot(solu_dati,aes(soli_seciba,skaits,fill=darbiba))+
    geom_col()+
    theme_bw()+
    scale_fill_manual("Atlases lēmums",
                      values=c("grey","darkgreen"),
                      labels=c("izmest","saglabāt"))+
    labs(x="",y="Novērojumu skaits")+
    theme(legend.position = "bottom")+
    labs(title=suga,
         subtitle="Novērojumu atlases gaita")

  dizains <- c(
    area(2, 1, 5, 5),
    area(1, 6, 3, 11),
    area(1, 12, 3, 17),
    area(4, 6, 6, 11),
    area(4, 12, 6, 17)
  )
  attelsX=stabini+pic1+pic2+pic3+pic4+plot_layout(design=dizains)
  faila_nosaukumam=paste0("./IevadesDati/Noverojumi/apkopoti/AtteliIzvelei/ObsSelection_",suga,".png")
  ggsave(attelsX,filename=faila_nosaukumam,device="png",width = 1500,height = 750,units="px",dpi=100)
  beigas=Sys.time()
  ilgums=beigas-sakums
  print(ilgums)
}


## lēmums ----

lemums=read_excel("./IevadesDati/Noverojumi/apkopoti/tabula_izvelei_early.xlsx")
lemums2=lemums %>% 
  dplyr::select(KODS,izvele1)

dati2=dati2 %>% 
  left_join(lemums2,by="KODS")
table(lemums2$izvele1,useNA = "always")
table(dati2$BreedCat,dati2$BreedCode,useNA = "always")

dati2=dati2 %>% 
  mutate(solis8=case_when(izvele1=="pārāk maz"~0,
                           izvele1=="BCD"&BreedCode<=3~1,
                           izvele1=="CD"&BreedCode<=2~1,
                           izvele1=="D"&BreedCode==1~1),
         solis8=ifelse(is.na(solis8),0,solis8))
table(dati2$solis8,useNA="always")



beigam=dati2 %>% 
  dplyr::select(KODS,solis1,solis2,solis3,solis4,solis5,solis6,solis7,solis8)

solis1=beigam %>% 
  mutate(solis="solis 1") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=0,
            saglabat=n())

solis2=beigam %>% 
  mutate(solis="solis 2") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis2!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis2==1,1,0),na.rm=TRUE))


solis3=beigam %>% 
  filter(solis2==1) %>% 
  mutate(solis="solis 3") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis3!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis3==1,1,0),na.rm=TRUE))

solis4=beigam %>% 
  filter(solis2==1&solis3==1) %>% 
  mutate(solis="solis 4") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis4!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis4==1|is.na(solis4),1,0),na.rm=TRUE))

solis5=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1) %>% 
  mutate(solis = "solis 5") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis5!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis5==1,1,0),na.rm=TRUE))

solis6=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1&solis5==1) %>% 
  mutate(solis = "solis 6") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis6!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis6==1,1,0),na.rm=TRUE))

solis7=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1&solis5==1&solis6==1) %>% 
  mutate(solis = "solis 7") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis7!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis7==1,1,0),na.rm=TRUE))

solis8=beigam %>% 
  filter(solis2==1&solis3==1&solis4==1&solis5==1&solis6==1&solis7==1) %>% 
  mutate(solis = "solis 8") %>% 
  group_by(KODS,solis) %>% 
  summarise(izmest=sum(ifelse(solis8!=1,1,0),na.rm=TRUE),
            saglabat=sum(ifelse(solis8==1,1,0),na.rm=TRUE))


soli=bind_rows(solis1,solis2,solis3,solis4,solis5,solis6,solis7,solis8)

soli2=soli %>% 
  ungroup() %>% 
  mutate(soli_seciba=factor(solis,ordered = TRUE,
                            levels=c("solis 1","solis 2","solis 3","solis 4",
                                     "solis 5","solis 6","solis 7","solis 8"))) %>% 
  pivot_longer(cols=saglabat:izmest,names_to = "darbiba",values_to = "skaits")


write_parquet(dati2,"./IevadesDati/Noverojumi/apkopoti/putnu_dati2_solis8.parquet")
write_parquet(soli2,"./IevadesDati/Noverojumi/apkopoti/putnu_dati2_AtlasesGaita.parquet")
```


### Papildsolis: neatkarīgie testa dati {#Chapter6.1.9}

Šie ir rets izņēmums, bet tādi ir eksistējoši vistu vanagam. 

Lai saglabātu vienotību apmācību un testa datiem, arī testa datiem aprēķināts attālums līdz CLC mākslīgajai videi. Tomēr šoreiz par "pārāk tuviem" pieņemti novērojumi no 1500 m attāluma, kas ir puse no ligzdošanas iecirkņa platības. Tas tādēļ, ka testa datos iekļauti arī provocētu putnu novēorjumi, apmeklējot sākotnējā modeļa vietas.

Šādas atlases rezultātā, neviens novērojums nav uzskatāms par izslēdzamu no testa kopas.


``` r
ACCGEN_test=read_parquet("./TestaKopa_1km_2024.parquet")

clc_maksligie=clc_lks %>% 
  filter(clc_kopa=="maksligie")
ACCGEN_test_sf=ACCGEN_test %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
ta=st_distance(ACCGEN_test_sf,clc_maksligie)
tb=apply(ta,1,min)
ACCGEN_test$dist_clc1=tb
ACCGEN_test$metamie=ifelse(ACCGEN_test$dist_clc1<1500,0,1)
```


## Modelēšanas datu saglabāšana un procesa vizualizēšana {#Chapter6.2}

Balstoties pieņemtajos lēmumos par modelēšanai izmantojamajiem datiem, katrai sugai sagatavoti sekojoši faili:

- klātbūtnes testa dati:

  - vistu vanagam - 2024. gada novērojumi, kā rakstīts sākumā;
  
  - pārējām sugām - 25% unikālo 100 m šūnu, kurās esošie novēorjumi izturējuši 
  iepriekšējo atlasi. No tām atlasīts tikai viens novērojums 1 km šūnās;
  
- klātbūtnes apmācību datu:

  - vistu vanagam - tikai viens novēorjums 1 km šūnā, kas izturējis iepriekš aprakstīto atlasi;
  
  - pārējām sugām - pēc testa kopas izveidošanas atlikušie novērojumi 100 m šūnās 
  nodrošināti tā, lai izvēlēts tiktu tikai viens novērojums 1 km šūnā;
  
- testa fona dati:

  - izlozēti (katrai sugai savā nejaušā procesā) 27 500 punktu ekoģeogrāfisko 
  mainīgo aptvertajā telpā;
  
  - no kopējās 27 500 ik sugai sepcifiskās fona punktu kopas ik sugai izlozēti 7500, 
  kas pieņemti testa kopai;
  
- apmācību fona punkti:

  - tie 20 000 sugai specifiskie punkti, kas atlikuši pēc testa kopas izveides.

Tā kā fona punktu izloze ir nozīmīga sugu izplatības modelēšanas sastāvdaļa, ir 
pieejams vērā ņemams apjoms literatūras par dažādu procedūru ieviešanu vides aprakstu 
nodrošināšanai. Plaši izplatīts vispārīgs pieņēmums, ir vismaz 10 000 punktu, tomēr - jo 
sarežģītāka vide, jo vairāk pazīmju, kas to raksturo, jo sarežģītāka ir sugas ekoloģiskā niša, jo vairāk punktu būt nepieciešams. Tomēr, ir jārēķinās, ka pieaugot fona punktu apjomam, ievēorjami pieaug skaitļošanas laiks, bet pie kāda (katrai situācijai specifiska) apjoma pienesums analīzes uzlabošanā vairs neseko. Vērā ņemams literatūras apjoms raksturo 10 000 fona punktus kā šo sliekšņa līmeni vairumā situāciju. 

No šī "10 000 punktu īkšķa likuma" paredzēts veidot atsevišķas apmācību un testa kopas, tipiski 75% un 25%, tātad, ievērojami mazākas par šajā projektā izmantotajām. Ņemot vērā šajā materiālā jau aprakstītos skaitļošanas apjomus un šī materiāla autoru mērķtiecīgi veidoto sarežģīto vidi, nolēmām veidot pieeju ar 20 000 fona punktiem modeļa apmācībai un citu 7500 fona punktu kopu modeļa neatkarīgās testēšanas grupā. Šo izlozi veicām vienreiz, bet nefiksējām nejaušo skaitļu ģeneratora iterāciju, lai uzlabotu nejaušību un analīžu neatkarību katrai individuālai sugai. Esošais punktu skaits ievēorjami pārsniedz "īkšķa likumus"  attiecībā uz *presence-background* pieejās plaši izplatīto un arī attiecībā uz izplatītākajiem pieņēmumiem par rezultāta stabilitāti nodrošināt spējīgiem izlases apjomiem. Šada iteratoru nefiksēšana pieļauj vairāk nejaušības, uzlabojot statistisko kompleksu, tomēr var apgrūtināt identisku rezultātu reproducēšanu sugām ar mazāku novērojumus skaitu, tajā pašā laikā - nodrošinot savstarpējo neatkarību starp vides raksturojumiem sugām.


``` r
# Testa un treniņdati ----

## ACCGEN

### Testa dati

ACCGEN_test=read_parquet("../../../../LVM/priv_ACCGEN_LVM/TestaKopa_1km_2024.parquet")

clc_maksligie=clc_lks %>% 
  filter(clc_kopa=="maksligie")
ACCGEN_test_sf=ACCGEN_test %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
ta=st_distance(ACCGEN_test_sf,clc_maksligie)
tb=apply(ta,1,min)
ACCGEN_test$dist_clc1=tb
ACCGEN_test$metamie=ifelse(ACCGEN_test$dist_clc1<1500,0,1)

ACCGEN_test=ACCGEN_test %>% 
  filter(!duplicated(tikls1000)) %>% 
  mutate(x=lksX,
         y=lksY) %>% 
  dplyr::select(KODS,Name_key,x,y,tikls100,tikls1000)
write_parquet(ACCGEN_test,"./SuguModeli/ApmacibuDati/TestingPresence/TestPres_ACCGEN.parquet")


### Apmacibu dati

ACCGEN_train=dati2 %>% 
  filter(KODS=="ACCGEN") %>% 
  filter(solis1==1,solis2==1,solis3==1,solis4==1,
         solis5==1,solis6==1,solis7==1,solis8==1) %>% 
  filter(!duplicated(tikls1000)) %>% 
  mutate(x=lksX,
         y=lksY) %>% 
  dplyr::select(KODS,Name_key,x,y,tikls100,tikls1000)
write_parquet(ACCGEN_train,"./SuguModeli/ApmacibuDati/TrainingPresence/TrainPres_ACCGEN.parquet")


### Background

egv_telpa=terra::rast("./Rastri_100m/nulles_LV100m_10km.tif")
vides_fons <- terra::spatSample(egv_telpa, size = 27500, na.rm = TRUE, 
                             values = FALSE, xy = TRUE) |> as.data.frame()
vides_fons$rinda=rownames(vides_fons)

fons_test=vides_fons %>% 
  sample_n(7500)

fons_trenins=vides_fons %>% 
  filter(!(rinda %in% fons_test$rinda)) %>% 
  dplyr::select(-rinda)
write_parquet(fons_trenins,"./SuguModeli/ApmacibuDati/TrainingBackground/TrainBg_ACCGEN.parquet")

fons_test=fons_test %>% 
  dplyr::select(-rinda)
write_parquet(fons_test,"./SuguModeli/ApmacibuDati/TestingBackground/TestBg_ACCGEN.parquet")

## Pārējās sugas


unikalie100=dati2 %>% 
  filter(solis1==1,solis2==1,solis3==1,solis4==1,
         solis5==1,solis6==1,solis7==1,solis8==1) %>% 
  filter(KODS!="ACCGEN") %>% 
  mutate(atslega100=paste0(KODS,"_",tikls100)) %>% 
  filter(!duplicated(atslega100))

skaits_unikalie100=unikalie100 %>% 
  group_by(KODS) %>% 
  summarise(skaits100=n()) %>% 
  mutate(TestaIzlozei=ceiling(skaits100*0.25))


unikalie100X=unikalie100 %>% 
  left_join(skaits_unikalie100,by="KODS")

testam=unikalie100X %>% 
  group_by(KODS) %>% 
  sample_frac(0.25) %>% 
  mutate(atslega1km=paste0(KODS,"_",tikls1000)) %>% 
  filter(!duplicated(atslega1km))

treninam=unikalie100X %>% 
  filter(!atslega100 %in% testam$atslega100) %>% 
  mutate(atslega1km=paste0(KODS,"_",tikls1000)) %>% 
  filter(!duplicated(atslega1km))

testasugas=levels(factor(testam$KODS))
treninsugas=levels(factor(treninam$KODS))

min(testasugas==treninsugas)
max(testasugas==treninsugas)



egv_telpa=terra::rast("./Rastri_100m/nulles_LV100m_10km.tif")


for(i in seq_along(testasugas)){
  sakums=Sys.time()
  print(i)
  
  suga=testasugas[i]
  print(suga)
  testadati=testam %>% 
    filter(KODS==suga) %>% 
    mutate(x=lksX,
           y=lksY) %>% 
    dplyr::select(KODS,Name_key,x,y,tikls100,tikls1000)
  write_parquet(testadati,
                paste0("./SuguModeli/ApmacibuDati/TestingPresence/TestPres_",
                       suga,".parquet"))
  
  trenindati=treninam %>% 
    filter(KODS==suga) %>% 
    mutate(x=lksX,
           y=lksY) %>% 
    dplyr::select(KODS,Name_key,x,y,tikls100,tikls1000)
  write_parquet(trenindati,
                paste0("./SuguModeli/ApmacibuDati/TrainingPresence/TrainPres_",
                       suga,".parquet"))
  
  
  vides_fons <- terra::spatSample(egv_telpa, size = 27500, na.rm = TRUE, 
                                  values = FALSE, xy = TRUE) |> as.data.frame()
  vides_fons$rinda=rownames(vides_fons)
  fons_test=vides_fons %>% 
    sample_n(7500)
  fons_trenins=vides_fons %>% 
    filter(!(rinda %in% fons_test$rinda)) %>% 
    dplyr::select(-rinda)
  write_parquet(fons_trenins,
                paste0("./SuguModeli/ApmacibuDati/TrainingBackground/TrainBg_",
                       suga,".parquet"))
  
  fons_test=fons_test %>% 
    dplyr::select(-rinda)
  write_parquet(fons_test,
                paste0("./SuguModeli/ApmacibuDati/TestingBackground/TestBg_",
                       suga,".parquet"))
  
  print(paste0("Testēšanai: ",nrow(testadati)))
  print(paste0("Apmācībai: ",nrow(trenindati)))
  beigas=Sys.time()
  ilgums=beigas-sakums
  print(ilgums)
}




# Beigu attēls ----

dati2=read_parquet("./IevadesDati/Noverojumi/apkopoti/putnu_dati2_solis8.parquet")
dati2_sf=dati2 %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)


soli2=read_parquet("./IevadesDati/Noverojumi/apkopoti/putnu_dati2_AtlasesGaita.parquet")



dati_atlaseB=dati2 %>% 
  filter(solis1==1) %>% 
  filter(solis2==1) %>% 
  filter(solis3==1) %>% 
  filter(solis4==1) %>% 
  filter(solis5==1) %>% 
  filter(solis6==1) %>% 
  filter(solis7==1)
dati_novB=dati_atlaseB %>% 
  group_by(KODS) %>% 
  summarise(Nov_BCD=n())

dati_atlaseC=dati2 %>% 
  filter(solis1==1) %>% 
  filter(solis2==1) %>% 
  filter(solis3==1) %>% 
  filter(solis4==1) %>% 
  filter(solis5==1) %>% 
  filter(solis6==1) %>% 
  filter(solis7==1) %>% 
  filter(BreedCode<=2)
dati_novC=dati_atlaseC %>% 
  group_by(KODS) %>% 
  summarise(Nov_CD=n())


dati_atlaseD=dati2 %>% 
  filter(solis1==1) %>% 
  filter(solis2==1) %>% 
  filter(solis3==1) %>% 
  filter(solis4==1) %>% 
  filter(solis5==1) %>% 
  filter(solis6==1) %>% 
  filter(solis7==1) %>% 
  filter(BreedCode==1)
dati_novD=dati_atlaseD %>% 
  group_by(KODS) %>% 
  summarise(Nov_D=n())

unikalajiemB_1km=dati_atlaseB %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  summarise(BCD_1km=n())
unikalajiemC_1km=dati_atlaseC %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  summarise(CD_1km=n())
unikalajiemD_1km=dati_atlaseD %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  summarise(D_1km=n())

unikalajiemB_100=dati_atlaseB %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  group_by(KODS) %>% 
  summarise(BCD_100m=n())
unikalajiemC_100=dati_atlaseC %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  summarise(CD_100m=n())
unikalajiemD_100=dati_atlaseD %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  summarise(D_100m=n())


dati_atlaseB_sf=dati_atlaseB %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
dati_atlaseC_sf=dati_atlaseC %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)
dati_atlaseD_sf=dati_atlaseD %>% 
  st_as_sf(coords=c("lksX","lksY"),crs=3059)


unikalieB_1km=dati_atlaseB_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  ungroup()
unikalieC_1km=dati_atlaseC_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  ungroup()
unikalieD_1km=dati_atlaseD_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls1000)) %>% 
  ungroup()

unikalieB_100=dati_atlaseB_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  ungroup()
unikalieC_100=dati_atlaseC_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  ungroup()
unikalieD_100=dati_atlaseD_sf %>% 
  group_by(KODS) %>% 
  filter(!duplicated(tikls100)) %>% 
  ungroup()

testa_klatbutnes=readbulk::read_bulk(directory="./SuguModeli/ApmacibuDati/TestingPresence/",
                                     name_contains = ".parquet",
                                     fun=arrow::read_parquet)
trenina_klatbutnes=readbulk::read_bulk(directory="./SuguModeli/ApmacibuDati/TrainingPresence/",
                                       name_contains = ".parquet",
                                       fun=arrow::read_parquet)
testa_fons=readbulk::read_bulk(directory="./SuguModeli/ApmacibuDati/TestingBackground/",
                               name_contains = ".parquet",
                               fun=arrow::read_parquet)
trenina_fons=readbulk::read_bulk(directory="./SuguModeli/ApmacibuDati/TrainingBackground/",
                                 name_contains = ".parquet",
                                 fun=arrow::read_parquet)


dir.create("./SuguModeli/ApmacibuDati/IzvelesAtteli")


admin=read_sf("./Templates/TemplateGrids/administrativas_teritorijas_2021/Administrativas_teritorijas_2021.shp")
kodi=levels(factor(dati2$KODS))

nosaukumiem=dati2 %>% 
  dplyr::select(KODS,Name_key,zinatniski) %>% 
  mutate(latviski=sub("^(.*)(\\s+\\S+){2}$", "\\1", Name_key))



for(i in seq_along(kodi)){
  sakums=Sys.time()
  print(i)
  suga=kodi[i]
  print(suga)
  
  nosaukumam=nosaukumiem %>% 
    filter(KODS==suga)
  
  
  visi=dati2_sf %>% 
    filter(KODS==suga)
  skaits_visi=nrow(visi)
  BCD_1km=unikalieB_1km %>% 
    filter(KODS==suga)
  skaits_BCD1km=nrow(BCD_1km)
  BCD_100=unikalieB_100 %>% 
    filter(KODS==suga)
  skaits_BCD100=nrow(BCD_100)
  CD_1km=unikalieC_1km %>% 
    filter(KODS==suga)
  skaits_CD1km=nrow(CD_1km)
  CD_100=unikalieC_100 %>% 
    filter(KODS==suga)
  skaits_CD100=nrow(CD_100)
  D_1km=unikalieD_1km %>% 
    filter(KODS==suga)
  skaits_D1km=nrow(D_1km)
  D_100=unikalieD_100 %>% 
    filter(KODS==suga)
  skaits_D100=nrow(D_100)
  
  
  
  pic1=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=visi,col="grey20",alpha=0.5)+
    labs(subtitle=paste0("Visi pirms atlases (n=",skaits_visi,")"))
  
  pic2=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=BCD_1km,col="red")+
    geom_sf(data=BCD_100,col="black",pch=3,size=3)+
    labs(subtitle=paste0("Telpiski unikālie BCD pēc atlases (N=",
                         skaits_BCD1km,", n=",skaits_BCD100,")"))
  
  pic3=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=CD_1km,col="red")+
    geom_sf(data=CD_100,col="black",pch=3,size=3)+
    labs(subtitle=paste0("Telpiski unikālie CD pēc atlases (N=",
                         skaits_CD1km,", n=",skaits_CD100,")"))
  
  pic4=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=D_1km,col="red")+
    geom_sf(data=D_100,col="black",pch=3,size=3)+
    labs(subtitle=paste0("Telpiski unikālie D pēc atlases (N=",
                         skaits_D1km,", n=",skaits_D100,")"))
  
  solu_dati=soli2 %>% 
    filter(KODS==suga)
  stabini=ggplot(solu_dati,aes(soli_seciba,skaits,fill=darbiba))+
    geom_col()+
    theme_bw()+
    scale_fill_manual("Atlases lēmums",
                      values=c("grey","darkgreen"),
                      labels=c("atteikties","saglabāt"))+
    labs(x="",y="Novērojumu skaits")+
    theme(legend.position = "bottom")+
    labs(title=substitute(a~"-"~b~italic(x), 
                          list(a=nosaukumam$KODS,
                               b=nosaukumam$latviski,
                               x=nosaukumam$zinatniski)),
         subtitle="Novērojumu atlases gaita")+
    theme(panel.grid = element_blank())
  
  
  treninklatbutnes=trenina_klatbutnes %>% 
    filter(KODS==suga) %>% 
    st_as_sf(coords=c("x","y"),crs=3059)
  skaits_treninklatbutnes=nrow(treninklatbutnes)
  treninfons=trenina_fons %>% 
    filter(str_detect(File,suga)) %>% 
    st_as_sf(coords=c("x","y"),crs=3059)
  pic5=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=treninfons,col="black",pch=3)+
    geom_sf(data=treninklatbutnes,col="red")+
    labs(subtitle=paste0("Modeļa apmācību kopa (pirms telpisko bloku krosvalidācijas; N=",
                         skaits_treninklatbutnes,")"))
  
  testklatbutnes=testa_klatbutnes %>% 
    filter(KODS==suga) %>% 
    st_as_sf(coords=c("x","y"),crs=3059)
  skaits_testklatbutnes=nrow(testklatbutnes)
  testfons=testa_fons %>% 
    filter(str_detect(File,suga)) %>% 
    st_as_sf(coords=c("x","y"),crs=3059)
  pic6=ggplot()+
    theme_map()+
    geom_sf(data=admin)+
    geom_sf(data=testfons,col="black",pch=3)+
    geom_sf(data=testklatbutnes,col="red")+
    labs(subtitle=paste0("Modeļa neatkarīgās testēšanas kopa (N=",
                         skaits_testklatbutnes,")"))
  
  
  dizains <- c(
    area(2, 1, 5, 5),
    area(1, 6, 3, 11),
    area(1, 12, 3, 17),
    area(4, 6, 6, 11),
    area(4, 12, 6, 17),
    area(1, 18, 3, 23),
    area(4, 18, 6, 23)
  )
  #plot(dizains)
  attelsX=stabini+pic1+pic2+pic3+pic4+pic5+pic6+
    plot_layout(design=dizains) +
    plot_annotation(tag_levels = "A") 
  faila_nosaukumam=paste0("./SuguModeli/ApmacibuDati/IzvelesAtteli/ObsSelection_",suga,".png")
  ggsave(attelsX,filename=faila_nosaukumam,device="png",
         width = 2000,height = 750,units="px",dpi=100)
  beigas=Sys.time()
  ilgums=beigas-sakums
  print(ilgums)
}
```


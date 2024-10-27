# *Dynamic World* izpēte  {#Chapter4}

*Dynamic World* (DW) ir relatīvi nesens Zemes novērošanas sistēmu produkts, kurš klasificē zemes segumu un lietojumu (LULC) deviņās kategorijās (0=water, 1=trees, 2=grass, 3=flooded_vegetation, 4=crops, 5=shrub_and_scrub, 6=built, 7=bare, 8=snow_and_ice), katram ESA Copernicus Sentinel-2 attēlam ar identificēto mākoņainību $\le35%$, pieļaujot filtrēšanu un dažādu agregāciju veidošanu [@DynWorld]. Salīdzinot ar dažādiem statiskākiem (produktu veidā sagatavotiem konkrētiem gadiem ar smagnēju projicēšanu citiem gadiem) un/vai konkrētu ekosistēmas daļu raksturošanai paredzētiem, piemēram *EU Crop Map* [@CropMap2022] un *ELULC-10* [@ELULC10], DW neapšaubāmi ar lielākām sagaidāmajām kļūdām pie klašu (gēotelpiskajām) robežām, tomēr labāku telpisko (klasificēti ir visas izmantojamās satelītainas, nevis vadoties pēc kādas vidi atpazīstošas maskas) un temporālo pārklājumu (dinamiska un tuvu reāllaikam klasifikācijas pieejamība ik satelītainai, nevis atsevišķas projekcijas laikā). Dažādu nesen radīto augstas izšķirtspējas LULC klasifikatoru salīdzinājumos, piemēram, [@LULC10salidzinajums_Venter] un [@LULC10salidzinajums_Xu], ir konstatētas dažādas atšķirības starp tiem, turklāt DW nav bijis uzskatāms par precīzāko, jo sevišķi spējā detektēt relatīvi šaurus līnijaveida objektus un saistībā ar neironu tīklos balstīto pieeju tieksmi pārspīlēt vertikāli strukturētās klases, tomēr tam ir augstākā temporālā pieejamība. Par šajos salīdzinājumos precīzāko uzskatāmajam *ESA WorldCover* brīvi pieejama ir informācijai tikai par 2020. un 2021. gadiem (https://collections.sentinel-hub.com/worldcover/). Augstās temporālās pieejamības dēļ, izvēlēts DW, jo pat, ja klases nav vienmēr korekti atpazītas, ir vērts izpētīt spēju atpazīt pārmaiņas to sastopamībā.

Tā kā šī projekta komandai nav zināmi izsekojami (caurspīdīgi, reproducējami) Latvijā veikti DW klasifikācijas un tās pārmaiņu uzticamības pētījumi, šī resursa izpēte veikta projekta ietvaros. Izpētei ir sekojoši **mērķi**:

1. noskaidrot DW izmantošanas iespējas LĢIA topogrāfiskās kartes aizstāšanai sugu izplatības modelēšanai;

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

DW ievades informācija - rastra slānis katrai sezonai katrā gadā - sagtavots Google Earth Engine (GEE) platformā [@GEEpaper], izmantojot [replicēšanas skriptu](https://code.earthengine.google.com/026fa26868a38566482c1f3191f7be43?noload=true). Lai izmantotu šo skriptu, ir nepieciešams [GEE konts un projekts](https://code.earthengine.google.com/register) un pietiekošs apjoms vietas Google Drive diskā. Izpildot komandrindas tiks piedāvāta lejuplāde failam, kas aptver laika periodu no vērtības 7. rindā līdz vērtībai 8. rindā - šis skripts nav optimizēts visu sezonālo griezumu visiem gadiem sagatavošanai, lai reproducētu vai paplašinātu šo izpēti, tās nepieciešams manuāli izmainīt.

Pēc komandrindu izpildes un rezultātu sagatavošanas Google Drive diskā ir redzams, ka katrs visu Latviju aptverošais slānis ir sadalīts vairākās lapās. Tas ir tādēļ, ka, lai nodrošinātu nulles patieso vērtību (klase "water", nevis fons), slāņi kodēti kā *Float*, nevis veselie skaitļi. Visas šīs lapas ir nepieciešams lejuplādēt, sekojošās R komandrindas tās apvieno, nodrošinot koordinātu sistēmas un pikseļu atbilstību references rastram.


```r
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(terra)) {install.packages("terra"); require(terra)}

# reference
paraugs=rast("./LV10m_10km.tif")

# saraksts ar lejupielādētajiem failiem, pieņemot, ka tie atrodas direktorijā 
## "DWE_float"
faili=data.frame(faili=list.files("./DWE_float/"))
faili$celi_sakums=paste0("./DWE_float/",faili$faili)

# Korekti projicētu mozaīku sagatavošana

## failu nosaukumi saglabāšanai
faili=faili %>% 
  separate(faili,into=c("DW","gads","periods","parejais"),sep="_",remove = FALSE) %>% 
  mutate(unikalais=paste0(DW,"_",gads,"_",periods),
         mosaic_name=paste0(unikalais,".tif"),
         masaic_cels=paste0("./DWE_mosaic/",mosaic_name))

## unikālie failu nosaukumi cikla vadībai
unikalie=levels(factor(faili$unikalais))

## cikls uzdevuma veikšanai
for(i in seq_along(unikalie)){
  unikalais=faili %>% filter(unikalais==unikalie[i])
  beigu_cels=unique(unikalais$masaic_cels)
  
  ### ik slānis sastāv no divām lapām
  viens=rast(unikalais$celi_sakums[1])
  divi=rast(unikalais$celi_sakums[2])
  
  viens2=project(viens,paraugs)
  divi2=project(divi,paraugs)
  
  mozaika=mosaic(viens2,divi2,fun="first")
  maskets=mask(mozaika,paraugs,filename=beigu_cels,overwrite=TRUE)

}
```


## Q0: DW nosegums

## Q1: Lauksaimniecības kultūras


### Q1.1: Ziemāji aramzemēs

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

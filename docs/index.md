--- 
title: "Putnu sugu izplatības modelēšana biodaudzveidības aizsardzībai: materiāli reproducēšanai"
author: "Andris Avotiņš"
date: "2025-02-17"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
csl: elsevier-harvard.csl
# url: https://aavotins.github.io/PutnuSDMs_gramata/
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  Putnu sugu izplatības modelēšana biodaudzveidības aizsardzībai: materiāli reproducējamības nodrošināšanai.
link-citations: yes
github-repo: rstudio/bookdown-demo
---

# Par šo materiālu {.unnumbered}

Šis materiāls ir izstrādāts trīs, sugu izplatības modelēšanā dziļi sakņotu, Latvijas Universitātē īstenotu projektu rezultātu atvēršanai un par to svarīgāk - darba gaitas un pieņemto lēmumu demonstrēšanai un skaidrošanai, lai nodrošinātu to atkārtojamību un reproducējamību. Šie projekti ir:

- Latvijas Vides Aizsardzības Fonda administrācijas finansētais projekts "Esošo 
aizsargāto teritoriju pārklājuma ģeotelpisko datu slāņa sagatavošana ES Bioloģiskās 
daudzveidības stratēģijas 2030 ieviešanai" (Nr. 1-08/73/2023);

- AS "Latvijas valsts meži" pasūtītais zinātniskās izpētes pakalpojuma projekts "Vistu 
vanaga *Accipiter gentilis* monitoringa pilnveidošana un dzīvotņu piemērotības 
telpiskā modeļa izveide" (AS “Latvijas valsts meži” dokumenta Nr. 5-5.5.1_000r_101_23_27_6);

- Valsts pētījumu programmas "Bioloģiskās daudzveidības prioritāro rīcību programmā noteikto pētījumu izstrāde" projekts “Augstas izšķirtspējas bioloģiskās daudzveidības kvantificēšana dabas saglabāšanai un apsaimniekošanai: HiQBioDiv” (VPP-VARAM-DABA-2024/1-0002).

Materiāls ir izstrādāts R, izmantojot {bookdown}. Saturā raksturotā datu apstrāde un analīze galvenokārt ir veikta R un viens no nozīmīgiem iemesliem šī materiāla tapšanai ir darba reproducēšanai nepieciešamās informācijas nodošana, izmantojot pārbaudītas komandu rindas. Kā vēlamais blakusprodukts - veicināt zinātniskās prakses un praktiskās zinātnes atvērtību un reproducējamību.





## Kas nav šis materiāls? {.unnumbered}

Šis materiāls **nav**:

* *iepazīstināšana ar R vai citu programmēšanas valodu*. Gluži pretēji - lietderīgākais tas būs personām ar izpratni komandu rindu lietošanā. Tomēr informatīvs par izmantotajām pieejām tas būs arī citiem lietotājiem;

* *pamācība ģeoprocesēšanā*. Šajā materiāla ir apkopotas tās pieejas, kuras tā izstrādes brīdī autoru kolektīvam ir zināmas kā efektīvākās (apstrādei nepieciešamā laika, operatīvās atmiņas un cietā diska apjoma, izpildes garantiju un uzticamības ziņā), bet noteikti nav vienīgās iespējamās;

* sugu izplatības (dzīvotņu piemērotības, sastopamības, skaita vai tml.) *modelēšanas rokasgrāmata*. Šis materiāls apraksta darba gaitu un pieņemtos datu analīzes lēmumus, izstrādājot produktu, kas iespējami vienkāršiem un ātriem līdzekļiem vienotā darba plūsmā ļauj iegūt informāciju sugu un biotopu aizsardzības plānošanai. Tātad, eksistē dažādas modelešēnas metodes un to parametrizācijas un vēl vairāk - pieejas, kuras gadījumu no gadījuma var būt piemērotākas sugu izplatības modelēšanai, tomēr šeit uzturēta vienota plūsma un iespējami unificēta pieeja. Tas arī nozīmē, ka šeit iegūtos rezultātus primāri ir paredzēts vērtēt kopumā, nevis individuālu vietu individuālām sugām izšķirtspējā, jo sevišķi, domājot par vietas aizņemtību, tomēr tie siendz nozīmīgu pamatu šādu (vietu aizņemtības, populāciju lielumu) un līdzīgu varbūtību risināšanai.

* *copy/paste gatavs produkts*. Lai gan komandu rindu lietošana un publiskošana ir ar tendenci būt šiem mērķiem paredzētai, situācijā, kad darbam izmantoti liela apjoma un vismaz daļēji - ierobežotas pieejamības dati, tas gluži vienkārši nav iespējams. Tomēr, nodrošinot datu pieejamību un izvietojumu atbilstoši šī projekta failu struktūrai (demonstrēta zemāk), komandu rindas būs atkārtojamas bez izmaiņām un radīs tos pašus rezultātus.

## Kas ir šis materiāls un kā to lietot? {.unnumbered}

Šis materiāls ir sagatavots, lai sniegtu reproducējamu darba gaitu, aprakstot pieņemtos lēmumus un ieviestos risinājumus putnu sugu izplatības (dzīvotņu piemērotības) modelēšanai biodaudzveidības aizsardzības plānošanai. Mazākā mērā arī rezultātu demonstrēšanai un to pieejamības nodrošināšanai.

Lielākoties šis materiāls sastāv no:

* *paskaidrojošā teksta*, kas ir atpazīstams kā teksts;

* *komandu rindām*, kas pēc noklusējuma ir noslēptas, lai atvieglotu teksta lasāmību. Vietas, kurās ir koamndu rindas ir atpazīstamas pēc lapas kreisajā pusē redzama "|> Code", kā tieši zem šīs rindkopas. Uzklikšķinot, atvērsies koda apgabals, kurā uz pelēka fona esošais teksts ir komandu rindas, piemēram,:


``` r
objekts=funkcija(arguments1,arguments2,
                 ceļš="./ceļš/failu/kokā/objekts.paplašinājums")
# komentārs
```

<br>


Augstāk esošajā piemērā pirmajā rindā ir izveidots objekts ("objekts"), kurš ir funkcijas ("funkcija()") rezultāts. Funkcijai ir trīs argumenti ("arguments1", "arguments2" un "ceļš"), kas ir atdalīti ar komantu (kā visu funkciju argumenti R). Trešais arguments ir ceļš failu kokā (tas atrodas jaunā rindā, bet ir turpinājums iepriekšējās rindas funkcijai, jo iekavas nav noslēgtas), kuram aiz vienādības zīmes (un pēdiņās) ir norādīts šis ceļš (uzmanība vēršama sākumam "./", kurš apzīmē relatīvo ceļu - novietojums failu kokā ir relatīvs projekta atrašanās vietai).

Augstāk esošā piemēra otrā rinda ir komentārs - viss aiz "#" ir komentārs. Jebkam komandu rindā pirms "#" ir jābūt izpildāmai funkcijai vai objektam. Komentārs var saturēt jebko un atrasties vienā rindā ar izpildāmu funkciju (tās beigās).

Komandu rindas ir nozīmīgākā šī materiāla sastāvdaļa reproducējamībai. Tomēr personai, kas tās lieto, pašai ir jānodrošina ievades datu pieejamība un jāuztur korketi ceļi failu kokā.

Komandu rindas var atrasties arī tekstā, piemēram, `# komentārs kā komandu rinda tekstā`.

Reizēm tekstā atsaukšos uz R pakotnēm, tās likšu figūriekavās, piemēram, {pakotne}.

* *grafikām* - dažādām diagrammām, kas raksturo darba plūsmu vai datu īpašības;

* *saitēm uz citiem resursiem*, jo sevišķi uz augstāka līmeņa produktiem un rezultātiem, kas radīti projekta ietvaros, bet arī ievades datiem, ja tie ir publiski pieejami. Rezultāti ir paredzēti izmantošanai praksē.

Saprāta robežās, materiālā ir raksturotas visas izmantotās datu kopas un sniegti to metadati, kas attiecas uz reproducējamības nodrošināšanu. Tā kā ne visas datu kopas ir brīvi pieejamas, tās pašas par sevi nav publiskotas, tomēr visos gadījumos ir sniegta informācija par to ieguvi šī projekta izstrādei.


## Direktoriju koks {.unnumbered}

Direktoriju koku vislabāk iegūt klonējot projekta [github repozitoriju]() - tas nodrošinās gan komandu rindu failus, gan tos izvietos 
tam atbilstošās vietās direktoriju kokā, gan sagatavos pašu koku. Tomēr, ja ir vēlme izvērsties, sekojošais koda apgabals 
atkārto direktoriju koka izveidi lietotāja norādītā vietā un īsi skaidro tajā ievietojamos datus.


``` r
# references slāņiem ----
dir.create("./Templates") # virsmape projekta direktorijā
dir.create("./Templates/TemplateGrids") # vektordatiem, režģiem
dir.create("./Templates/TemplateGrids/lapas") # vektordatiem (režģiem) karšu lapās
dir.create("./Templates/TemplateGridPoints") # vektordatu režģu centriem
dir.create("./Templates/TemplateGridPoints/lapas") # vektordatu režģu centriem karšu lapās
dir.create("./Templates/TemplateRasters") # rastra (harmonizēšanas) slāņiem

# ievades datu produkti (10 m) ----
dir.create("./Rastri_10m") ----

# ievades datu produkti (500 m) ----
dir.create("./Rastri_500m")

# Ekoģeogrāfiskie mainīgie (ar apakšmapēm) ----
dir.create("./Rastri_100m") 
dir.create("./Rastri_100m/RAW") # tiešie rezultāti. Ne visi ir harmoniski
dir.create("./Rastri_100m/Proj") # harmonizēti pārklājumi
dir.create("./Rastri_100m/Scaled") # centrāti un mērogoti harmonizētie pārklājumi

# VidesParmainas  ----
# - direktorija vides pārmaiņu aprēķināšanai
dir.create("./VidesParmainas") 
dir.create("./VidesParmainas/Parmainam") # DynamicWorld ikgadējie slāņi pēc apstrādes, kas raksturota atsevišķā nodaļā



# Ievades dati ----
# - sarežģīta struktūra! Ietver gan datu izvietojumu, gan apstrādi. Haoss.
dir.create("./IevadesDati") 

## Ainava ----
dir.create("./IevadesDati/ainava") 
## šajā direktorijā norisinās ievērojama daļa EGV sagatavošanas, tādēļ ir daudz 
## skriptu un apakšdirektoriju
### Malas ----
dir.create("./IevadesDati/ainava/Malas") 
### malas raksturojošo slāņu sagatavošanai
### Klases platība ----
dir.create("./IevadesDati/ainava/ClassArea") 
### klases platību raksturojošo slāņu sagatavošanai
### Šenona daudzveidības indeksi ----
dir.create("./IevadesDati/ainava/Daudzveidibai") 
### Šenona daudzveidības indeksu aprēķiniem

## Atkritumi ----
dir.create("./IevadesDati/atkritumi") 
# šeit ievieto infromāciju par atkritumu poligoniem, glabātuvēm, šķirotavām utml

## Augsnes ----
dir.create("./IevadesDati/Augsnes") 
dir.create("./IevadesDati/Augsnes/noIvo") # EU JRC augšņu slāņi 


## CLC ----
dir.create("./IevadesDati/CLC") 
## CorineLandCover 2018 informācija

## distances  ----
dir.create("./IevadesDati/distances") 
## Komandu rindas EGV veidošanai

## DynamicWorld ----
dir.create("./IevadesDati/DynamicWorld") 
## Šeit ir veikta resursa izpēta, radot visai plašu struktūru
dir.create("./IevadesDati/DynamicWorld/DynamicWorld_Eksperimentam") 
### Apakšmapes ----
dir.create("./IevadesDati/DynamicWorld/DynamicWorld_Eksperimentam/DWE_float")
### ^ šeit ievieto GEE lejupielādi
dir.create("./IevadesDati/DynamicWorld/DynamicWorld_Eksperimentam/DWE_mosaic") 
### ^ šeit ievieto DWE_float apstrādi
dir.create("./IevadesDati/DynamicWorld/DynamicWorld_Eksperimentam/DWE_missing") 
### ^ šeit aprēķina informācijas seguma robus


## klimats ----
dir.create("./IevadesDati/klimats") 
## ar apakšmapēm
### RAW ----
dir.create("./IevadesDati/klimats/RAW")
### ^ šeit ievieto lejupielādi no GEE
### mozaikas ----
dir.create("./IevadesDati/klimats/mozaikas")
### ^ šeit ievieto apstrādes rezultātu


## koki ----
dir.create("./IevadesDati/koki") 
## Zemes novērošanas dati par kokiem un mežiem
## ar apakšmapēm
### RAW ----
dir.create("./IevadesDati/koki/RAW") 
### ^ šeit ievieto lejupielādi no GEE

## LAD ----
dir.create("./IevadesDati/LAD") 
## ^ šeit novieto un apstrādā LAD datus

## LV_EEZ ----
dir.create("./IevadesDati/LV_EEZ") 
## ^ šeit novieto un slāni ar Latvijas Ekskluzīvās Ekonomiskās zonas ūdeņiem

## LVM_AtvertieDati ----
dir.create("./IevadesDati/LVM_AtvertieDati") 
dir.create("./IevadesDati/LVM_AtvertieDati/lejupielades") 
## ^ šeit ievietos no atvērto datu portāla lejupielādētos 
## valsts akciju sabiedŗibas "Latvijas valsts meži" datus

## MKIS ----
dir.create("./IevadesDati/MKIS") 
## ^ šeit ievietos meliorācijas kadastra informācijas sistēmas datus 

## MVR ----
dir.create("./IevadesDati/MVR") 
## ^ šeit ievietos Valsts Meža dienesta MEža Valsts reģistra datus 

## Noverojumi ----
dir.create("./IevadesDati/Noverojumi") 
## ^ šeit ievietos apkopotos putnu novērojumus 

## reljefs ----
dir.create("./IevadesDati/reljefs") 
## ar DEM saistītās procedūras un dati. Satur apakšmapes
### meanDEM_1mOLD ----
dir.create("./IevadesDati/reljefs/meanDEM_1mOLD") 
### ^ šeit ievieto ievades DEM 1m
### meanDEM_10mOLD ----
dir.create("./IevadesDati/reljefs/meanDEM_10mOLD") 
### ^ šeit ir cits starprezultāts, kas gatavots LU
### Nartiss_visa_Latvija ----
dir.create("./IevadesDati/reljefs/Nartiss_visa_Latvija") 
### ^ šeit ievieto aizpildīšanas 10 m DEM. Mēs izmantojām Māra Nartiša izstrādāto
### meanDEM_10m ----
dir.create("./IevadesDati/reljefs/meanDEM_10m") 
### ^ šeit ievieto sagatavoto 10 m DEM bez robiem
### Reljefa ainavas līmeņa parametru sagatavošas direktorijas:
dir.create("./IevadesDati/reljefs/DiS_area_r500") 
dir.create("./IevadesDati/reljefs/DiS_area_r1250") 
dir.create("./IevadesDati/reljefs/DiS_area_r3000") 
dir.create("./IevadesDati/reljefs/DiS_area_r10000") 


## S2indices ----
dir.create("./IevadesDati/S2indices") 
dir.create("./IevadesDati/S2indices/RAW") 
### ^ lejupielāde no GEE
dir.create("./IevadesDati/S2indices/mozaikas") 
### ^ apstrādes rezultāts

## topo ----
dir.create("./IevadesDati/topo") 
## ^ šeit ievieto Latvijas Ģeotelpiskās Infromācijas Aaģentūras topogrāfiskās 
## kartes (M:10000) datus 
```


## Satura izklāsts (orientācijai) {.unnumbered}

Vispārīgā darba un informācijas plūsma projektā ir ilustrēta sekojošajā attēlā \@ref(fig:General-workflow). Tā ir izmantota par pamatu šī materiāla dalījumam nodaļās (nosauktas zemāk), kuru nosaukumi vispārīgi sakrīt ar uzdevumiem (etapiem) darba plūsmas vizualizācijā. 

<div class="figure">

```{=html}
<div class="grViz html-widget html-fill-item" id="htmlwidget-060f87a367caec9f223e" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-060f87a367caec9f223e">{"x":{"diagram":"digraph flowchart {\n\n  # node type 2: Līmeņi\n  node [fontname = Helvetica, shape = none,style=none,fontface=bold,fontsize=12];{\n    node [label=\"1. solis: Sagatavošanās\"]; step0;\n    node [label=\"2. solis: Ievades informācija\"]; step1;\n    node [label=\"3. solis: Ekoģeogrāfiskie mainīgie\"]; step2;\n    node [label=\"4. solis: Modelēšana\"]; step3;\n    node [label=\"5. solis: Prioritizēšana\"]; step4;\n  }\n  \n  \n  # node type 1: Vidējais\n  node [fontname = Helvetica, shape = rectangle,style=rounded,fontcolor=black]; {\n    node [label=\"Analīzes telpa\"]; vidus1;\n    node [label=\"Ievades \nģeodati\"]; vidus2;\n    node [label=\"Ekoģeogrāfiskie \nmainīgie\"]; vidus3;\n    node [label=\"Sugu izplatības \nmodelēšna\"]; vidus4;\n    node [label=\"Vietu prioritizēšana \naizsardzībai\"]; vidus5;\n  }\n\n  # node type 5: Kreisais \n  node [fontname = Helvetica, shape = rectangle,style=rounded,fontcolor=black,fontsize=12];{\n    node [label=\"*Dynamic World* izpēte\"]; DWexp;\n    }\n\n\n\n  # node type 3: Labais\n  node [fontname = Helvetica, shape = rectangle];{\n    node [label=\"Sugu saraksts \nun apraksti\"]; labais1;\n    node [label=\"Novērojumu atlase\"]; labais2;\n  }\n\n  # node type 4: Pecapstrade\n  node [fontname = Helvetica, shape = rectangle];{\n    node [label=\"Modeļu pēcapstrāde\"]; pec1;\n  }\n\n  \n  # specify which nodes are of the same \"rank\" so that they\"ll be drawn at the same level\n      {rank = same; step0 vidus1 labais1}\n      {rank = same; step1 DWexp vidus2 labais2}\n      {rank = same; step2 vidus3}\n      {rank = same; step3 vidus4 pec1}\n      {rank = same; step4 vidus5}\n  \n  # edge definitions with the node IDs\n  edge[tailclip = true, headclip = true,color=white];\n  step0 -> step1\n  step1 -> step2\n  step2 -> step3\n  step3->step4\n\n  edge[tailclip = true, headclip = true,color=black];\n  vidus1 -> vidus2\n  vidus2 -> vidus3\n  vidus3 -> vidus4\n  vidus4 -> vidus5\n  \n  vidus1 -> labais2\n  vidus1 -> DWexp\n  DWexp -> vidus2\n  DWexp -> labais2\n\n  labais1 -> labais2\n  labais2 -> vidus3\n  \n  labais1 -> vidus3\n  labais1 -> vidus5\n  labais1 -> vidus4\n  labais2 -> vidus4\n  vidus1 -> vidus3\n  \n  vidus4 -> pec1\n  vidus5 -> pec1\n  pec1 -> vidus5\n  }\n\n  ","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:General-workflow)Darba plūsma un saistība starp šī dokumenta nodaļām</p>
</div>

<br>

Katrai no šī materiāla nodaļām (tātad, uzdevumiem darba plūsmā) būt vairāku līmeņu apakšnodaļas (apakšuzdevumi). Tos vislabāk apskatīt konkrētajās nodaļās, tomēr vismaz sākotnēji sekojot secībai iepriekšējā attēlā. Nodaļas ar galvenajiem izstrādātājiem:

1. [Sugu saraksts un pamata apraksti](#Chapter1) (A. Avotiņš, A. Auniņš, J. Butkeviča, A. Baumane)

2. [Ar modeļiem aptveramā (analīzes) telpa un standartizācijas faili](#Chapter2) (A. Avotiņš)

3. [Ievades ģeodati](#Chapter3) (A. Avotiņš, I. Vinogradovs, A. Auniņš)

4. [*Dynamic World* izpēte](#Chapter4) (A. Avotiņš, B. Rubene)

5. [Ekoģeogrāfiskie mainīgie](#Chapter5) (A. Avotiņš, A. Auniņš)

6. [Novērojumu atlase](#Chapter6) (A. Avotiņš)

7. [Sugu izplatības (dzīvotņu piemērotības) modeļi](#Chapter7) (A. Avotiņš, A. Auniņš)

8. [Modeļu pēcapstrāde](#Chapter8) (A. Avotiņš)

9. [Vietu prioritizēšana aizsardzībai](#Chapter9) (A. Avotiņš, I. Vinogradovs, A. Auniņš)

10. [Rezultāti](#Chapter10) (A. Avotiņš)




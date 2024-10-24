--- 
title: "Putnu sugu izplatības modelēšana biodaudzveidības aizsardzībai: materiāli reproducēšanai"
author: "Andris Avotiņš"
date: "2024-10-24"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
# url: https://aavotins.github.io/PutnuSDMs_gramata/
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  Putnu sugu izplatības modelēšana biodaudzveidības aizsardzībai: materiāli reproducējamības nodrošināšanai.
link-citations: yes
github-repo: rstudio/bookdown-demo
---

# Par šo materiālu

Šis materiāls ir izstrādāts Latvijas Vides Aizsardzības Fonda administrācijas finansētā projekta "Esošo aizsargāto teritoriju pārklājuma ģeotelpisko datu slāņa sagatavošana ES Bioloģiskās daudzveidības stratēģijas 2030 ieviešanai" (Nr. 1-08/73/2023) ietvaros. Šī materiāla mērķis ir demonstrēt un skaidrot darba gaitu un pieņemtos lēmumus, lai nodrošinātu tā atkārtojamību un reproducējamību. Projekta mērķis ir ģeotelpisko datu slāņu sagatavošana aizsargājamo teritoriju pārklājuma paplašināšanai.

Materiāls ir izstrādāts R, izmantojot {bookdown}. Saturā raksturotā datu apstrāde un analīze galvenokārt ir veikta R un viens no nozīmīgiem iemesliem šī materiāla tapšanai ir informācijas par darba atkārtošanu, izmantojot pārbaudītas komandu rindas, nodošana. Kā vēlamais blakusprodukts - veicināt zinātniskās prakses un praktiskās zinātnes atvērtību un reproducējamību.





## Kas nav šis materiāls?

Šis materiāls **nav**:

* *iepazīstināšana ar R vai citu programmēšanas valodu*. Gluži pretēji - lietderīgākais tas būs personām ar izpratni komandu rindu lietošanā. Tomēr informatīvs par izmantotajām pieejām tas būs jebkuram;

* *pamācība ģeoprocesēšanā*. Šajā materiāla ir apkopotas tās pieejas, kuras tā izstrādes brīdī autoru kolektīvas ir zināmas kā efektīvākās (apstrādei nepieciešamā laika, operatīvās atmiņas un cietā diska apjoma, izpildes garantiju un uzticamības ziņā), bet noteikti nav vienīgās;

* sugu izplatības (dzīvotņu piemērotības, sastopamības, skaita vai tml.) *modelēšanas rokasgrāmata*. Šis materiāls apraksta darba gaitu un pieņemtos datu analīzes lēmumus, izstrādājot produktu, kas iespējami vienkāršiem un ātriem līdzekļiem vienotā darba plūsmā ļauj iegūt informāciju sugu un biotopu aizsardzības plānošanai. Tātad, rezultātus ir paredzēts vērtēt kopumā, nevis individuālu vietu individuālām sugām izšķirtspējā.

* *copy/paste gatavs produkts*. Lai gan komandu rindu lietošana un publiskošana ir ar tendenci būt šiem mērķiem paredzētai, situācijā, kad darbam izmantoti liela apjoma un vismaz daļēji - ierobežotas pieejamības dati, tas gluži vienkārši nav iespējams. Tas, kas iztrūkst (ir jānodrošina katrai šo materiaālu lietojošai personai personīgi) ir precīzi ceļi uz failiem - tos koriģējot, uzdevumi ir atkārtojami un rezultāti - replicējami.

## Kas ir šis materiāls un kā to lietot?

Šis materiāls ir sagatavots, lai sniegtu reproducējamu darba gaitu, aprakstot pieņemtos lēmumus un ieviestos risinājumus putnu sugu izplatības (dzīvotņu piemērotības) modelēšanai biodaudzveidības aizsardzības plānošanai. Mazākā mērā arī rezultātu demonstrēšanai.

Lielākoties šis materiāls sastāv no:

* *paskaidrojošā teksta*, kas ir atpazīstams kā teksts;

* *komandu rindām*, kas ir atpazīstamas kā ar pelēku fonu izcelti strukturēta teksta apgabali, piemēram,:


```r
objekts=funkcija(arguments1,arguments2,
                 ceļš="./ceļš/failu/kokā/objekts.paplašinājums")
# komentārs
```

Augstāk esošajā piemērā pirmajā rindā ir izveidots objekts ("objekts"), kurš ir funkcijas ("funkcija()") rezultāts. Funkcijai ir trīs argumenti ("arguments1", "arguments2" un "ceļš"), kas ir atdalīti ar komantu (kā visu funkciju argumenti R). Trešais arguments ir ceļš failu kokā (tas atrodas jaunā rindā, bet ir turpinājums iepriekšējās rindas funkcijai, jo iekavas nav noslēgtas), kuram aiz vienādības zīmes (un pēdiņās) ir norādīts šis ceļš (uzmanība vēršama sākumam "./", kurš apzīmē relatīvo ceļu - novietojums failu kokā ir relatīvs projekta atrašanās vietai).

Augstāk esošā piemēra otrā rinda ir komentārs - viss aiz "#" ir komentārs. Jebkam komandu rindā pirms "#" ir jābūt izpildāmai funkcijai vai objektam. Komentārs var saturēt jebko un atrasties vienā rindā ar izpildāmu funkciju (tās beigās).

Komandu rindas ir nozīmīgākā šī materiāla sastāvdaļa reproducējamībai. Tomēr personai, kas tās lieto, pašai ir jānodrošina ievades datu pieejamība un jāuztur korketi ceļi failu kokā.

Komandu rindas var atrasties arī tekstā, piemēram, `# komentārs kā komandu rinda tekstā`.

Reizēm tekstā atsaukšos uz R pakotnēm, tās likšu figūriekavās, piemēram, {pakotne}.

* *grafikām* - dažādām diagrammām, kas raksturo darba plūsmu vai datu īpašības, bet lielākoties, kartēm;

* *saitēm uz citiem resursiem*, jo sevišķi uz augstāka līmeņa produktiem un rezultātiem, kas radīti projekta ietvaros, bet arī ievades datiem, ja tie ir publiski pieejami. Rezultāti ir paredzēti izmantošanai praksē.




## Satura izklāsts (orientācijai)

Vispārīgā darba un informācijas plūsma projektā ir ilustrēta sekojošajā attēlā \@ref(fig:General-workflow). Tā ir izmantota par pamatu šī materiāla dalījumam nodaļās (nosauktas un īsi raksturotas zemāk), kuru nosaukumi vispārīgi sakrīt ar uzdevumiem (etapiem) darba plūsmas vizualizācijā. 

<div class="figure">

```{=html}
<div class="grViz html-widget html-fill-item" id="htmlwidget-efc423349530aa5c8d1f" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-efc423349530aa5c8d1f">{"x":{"diagram":"digraph flowchart {\n\n  # node type 2: Līmeņi\n  node [fontname = Helvetica, shape = none,style=none,fontface=bold,fontsize=12];{\n    node [label=\"1. solis: Sagatavošanās\"]; step0;\n    node [label=\"2. solis: Ievades informācija\"]; step1;\n    node [label=\"3. solis: Ekoģeogrāfiskie mainīgie\"]; step2;\n    node [label=\"4. solis: Modelēšana\"]; step3;\n    node [label=\"5. solis: Prioritizēšana\"]; step4;\n  }\n  \n  \n  # node type 1: Vidējais\n  node [fontname = Helvetica, shape = rectangle,style=rounded,fontcolor=black]; {\n    node [label=\"Analīzes telpa\"]; vidus1;\n    node [label=\"Ievades \nģeodati\"]; vidus2;\n    node [label=\"Ekoģeogrāfiskie \nmainīgie\"]; vidus3;\n    node [label=\"Sugu izplatības \nmodelēšna\"]; vidus4;\n    node [label=\"Vietu prioritizēšana \naizsardzībai\"]; vidus5;\n  }\n\n  # node type 5: Kreisais \n  node [fontname = Helvetica, shape = rectangle,style=rounded,fontcolor=black,fontsize=12];{\n    node [label=\"*Dynamic World* izpēte\"]; DWexp;\n    }\n\n\n\n  # node type 3: Labais\n  node [fontname = Helvetica, shape = rectangle];{\n    node [label=\"Sugu saraksts \nun apraksti\"]; labais1;\n    node [label=\"Novērojumu atlase\"]; labais2;\n  }\n\n  # node type 4: Pecapstrade\n  node [fontname = Helvetica, shape = rectangle];{\n    node [label=\"Modeļu pēcapstrāde\"]; pec1;\n  }\n\n  \n  # specify which nodes are of the same \"rank\" so that they\"ll be drawn at the same level\n      {rank = same; step0 vidus1 labais1}\n      {rank = same; step1 DWexp vidus2 labais2}\n      {rank = same; step2 vidus3}\n      {rank = same; step3 vidus4 pec1}\n      {rank = same; step4 vidus5}\n  \n  # edge definitions with the node IDs\n  edge[tailclip = true, headclip = true,color=white];\n  step0 -> step1\n  step1 -> step2\n  step2 -> step3\n  step3->step4\n\n  edge[tailclip = true, headclip = true,color=black];\n  vidus1 -> vidus2\n  vidus2 -> vidus3\n  vidus3 -> vidus4\n  vidus4 -> vidus5\n  \n  vidus1 -> labais2\n  vidus1 -> DWexp\n  DWexp -> vidus2\n  DWexp -> labais2\n\n  labais1 -> labais2\n  labais2 -> vidus3\n  \n  labais1 -> vidus3\n  labais1 -> vidus5\n  labais1 -> vidus4\n  labais2 -> vidus4\n  vidus1 -> vidus3\n  \n  vidus4 -> pec1\n  vidus5 -> pec1\n  pec1 -> vidus5\n  }\n\n  ","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:General-workflow)Darba plūsma un saistība starp šī dokumenta nodaļām</p>
</div>

<br>

Katrai no šī materiāla nodaļām (tātad, uzdevumiem darba plūsmā) būt vairāku līmeņu apakšnodaļas (apakšuzdevumi). Tos vislabāk apskatīt konkrētajās nodaļās, vismaz sākotnēji sekojot secībai iepriekšējā attēlā. Nedaudz plašāks nodaļu apraksts (galvenie izstrādātāji):

1. [Sugu saraksts un pamata apraksti](#Chapter1) (A. Avotiņš, A. Auniņš, J. Butkeviča, A. Baumane)

2. [Ar modeļiem aptveramā (analīzes) telpa un standartizācijas faili](#Chapter2) (A. Avotiņš)

3. [Ievades ģeodati](#Chapter3) (A. Avotiņš, I. Vinogradovs, A. Auniņš)

4. [*Dynamic World* izpēte](#Chapter4) (A. Avotiņš, B. Rubene)

5. [Ekoģeogrāfiskie mainīgie](#Chapter5) (A. Avotiņš, A. Auniņš)

6. [Novērojumu atlase](#Chapter6) (A. Avotiņš)

7. [Sugu izplatības (dzīvotņu piemērotības) modeļi](#Chapter7) (A. Avotiņš, A. Auniņš)

8. [Modeļu pēcapstrāde](#Chapter8) (A. Avotiņš, I. Vinogradovs, A. Auniņš)

9. [Vietu prioritizēšana aizsardzībai](#Chapter9) (A. Avotiņš, I. Vinogradovs, A. Auniņš)

10. [Rezultāti](#Chapter10) (A. Avotiņš)



<!--chapter:end:index.Rmd-->

# Sugu saraksts un pamata apraksti  {#Chapter1}

Šajā nodaļā sniegts analīzei izvēlēto sugu saraksta pamatojums un demonstrēta informācijas apkopošanas gaita sugu bioloģijas un ekoloģijas aprakstiem, kas tālāk izmantoti modelēšanā.

Saskaņā ar projekta pieteikumu, uzdevums ir izstrādāt vismaz 70 slāņus ar dzīvotņu piemērotības analīzes rezultātiem. Sākotnēji analīzei izvēlēto sugu loks ir 116, lai samazinātu spriedzi ap ik sugas rezultāta uzticamību un pielietojamību mērķim.

## Analizējamo sugu izvēle

No 375 Latvijā jebkad konstatētajām putnu sugām [@PutniLV], 335 ir uzskatāmas par (šobrīd vai vismaz vienu desmitgadi kopš 1900. gada) ligzdotājām [@Avotins_etal_2024a:LfS_Conference].


## Pamata apraksti analīzei

Ligzdošanas iecirkņa izmērs


## Pamata apraksti novērojumu atlasei

Ligzdošanas sezona


## Pamata apraksti starpsugu svarošanai


### Populācijas lielums un pārmaiņas


### Mūža reproduktīvais ieguldījums




<!--chapter:end:001-SuguSaraksts.Rmd-->

# Ar modeļiem aptveramā (analīzes) telpa un standartizācijas faili  {#Chapter2}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## 100 m režģis Latvijā


## References rastri


<!--chapter:end:002-AnalizesTelpa.Rmd-->

# Ievades ģeodati  {#Chapter3}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## Ievades jēldati

### Meža Valsts reģistrs

### Lauku atbalsts dienesta lauku informācija

### LĢIA topogrāfiskā karte

### MKIS

### LVM atvērtie dati

### Corine Land Cover

### Sentinel-2

### *Dynamic World*

### *Global Forest Watch*

### Palsar Tree cover

### ERA-5 Land


### Augsnes auglīgums

### Digitālie reljefa modeļi


## Ievades produkti

### Reljefs

### Klimats

### Satelītindeksi

### Augsne


### Ainava

### Ceļi

### Eiklīda distances

### Malas

### Ūdeņi

### Lauksaimniecībā izmantojamās zemes

### Meži



## Vides pārmaiņas

### *Dynamic World*

### Koku vainagu segums no Global forest watch


<!--chapter:end:003-IevadesGeodati.Rmd-->

# *Dynamic World* izpēte  {#Chapter4}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

### Kopējie uzstādījumi analīžu veikšanai


### DW klases


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

<!--chapter:end:004-DynamicWorld.Rmd-->

# Ekoģeogrāfiskie mainīgie  {#Chapter5}


## Reljefs

## Klimats

## Satelītindeksi

## Augsne


## Ainava

## Ceļi

## Eiklīda distances

## Malas

## Ūdeņi

## Lauksaimniecībā izmantojamās zemes

## Meži


<!--chapter:end:005-EGV.Rmd-->

# Novērojumu atlase  {#Chapter6}


## Datu avoti

## Nomenklatūra

## Atrašanās Latvijā

## Datums un laiks

## Ligzdošanas ticamība


## Dublieri


## Novietojums


## Sezonalitāte


## Pārmaiņas




<!--chapter:end:006-Noverojumi.Rmd-->

# Sugu izplatības (dzīvotņu piemērotības) modeļi  {#Chapter7}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## VIF

## Background points

## Feature selection


## Parameterisation


## Model selection


## Final model and output generation


## Rezultāta uzticamības izvērtējums



<!--chapter:end:007-SDMs.Rmd-->

# SDM pēcapstrāde  {#Chapter8}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## Ekoloģiskās nišas dziļumi


## Saistība ar aizsardzības režīmiem



<!--chapter:end:008-Pecapstrade.Rmd-->

# Vietu prioritizēšana aizsardzībai  {#Chapter9}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## Ik sugas aizsardzībai prioritārās vietas


## Daudzsugu pieeja dabas aizsardzības plānošanai


### Meži


### Lauksaimniecībā izmantojamās zemes


### Mitrāji



### Valstī kopumā



<!--chapter:end:009-Prioritisation.Rmd-->

# Rezultāti  {#Chapter10}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## Individuālu sugu rezultāti


## Kopējie valsts līmeņa rezultāti




<!--chapter:end:010-Rezultati.Rmd-->


# References {-}


<!--chapter:end:011-references.Rmd-->

# Hello bookdown 

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## A section

All chapter sections start with a second-level (`##`) or higher heading followed by your section title, like the sections above and below here. You can have as many as you want within a chapter.

### An unnumbered section {-}

Chapters and sections are numbered by default. To un-number a heading, add a `{.unnumbered}` or the shorter `{-}` at the end of the heading, like in this section.

<!--chapter:end:101-intro.Rmd-->

# Cross-references {#cross}

Cross-references make it easier for your readers to find and link to elements in your book.

## Chapters and sub-chapters

There are two steps to cross-reference any heading:

1. Label the heading: `# Hello world {#nice-label}`. 
    - Leave the label off if you like the automated heading generated based on your heading title: for example, `# Hello world` = `# Hello world {#hello-world}`.
    - To label an un-numbered heading, use: `# Hello world {-#nice-label}` or `{# Hello world .unnumbered}`.

1. Next, reference the labeled heading anywhere in the text using `\@ref(nice-label)`; for example, please see Chapter \@ref(cross). 
    - If you prefer text as the link instead of a numbered reference use: [any text you want can go here](#cross).

## Captioned figures and tables

Figures and tables *with captions* can also be cross-referenced from elsewhere in your book using `\@ref(fig:chunk-label)` and `\@ref(tab:chunk-label)`, respectively.

See Figure \@ref(fig:nice-fig).


```r
par(mar = c(4, 4, .1, .1))
plot(pressure, type = 'b', pch = 19)
```

<div class="figure" style="text-align: center">
<img src="102-cross-refs_files/figure-html/nice-fig-1.png" alt="Plot with connected points showing that vapor pressure of mercury increases exponentially as temperature increases." width="80%" />
<p class="caption">(\#fig:nice-fig)Here is a nice figure!</p>
</div>

Don't miss Table \@ref(tab:nice-tab).


```r
knitr::kable(
  head(pressure, 10), caption = 'Here is a nice table!',
  booktabs = TRUE
)
```



Table: (\#tab:nice-tab)Here is a nice table!

| temperature| pressure|
|-----------:|--------:|
|           0|   0.0002|
|          20|   0.0012|
|          40|   0.0060|
|          60|   0.0300|
|          80|   0.0900|
|         100|   0.2700|
|         120|   0.7500|
|         140|   1.8500|
|         160|   4.2000|
|         180|   8.8000|

<!--chapter:end:102-cross-refs.Rmd-->

# Parts

You can add parts to organize one or more book chapters together. Parts can be inserted at the top of an .Rmd file, before the first-level chapter heading in that same file. 

Add a numbered part: `# (PART) Act one {-}` (followed by `# A chapter`)

Add an unnumbered part: `# (PART\*) Act one {-}` (followed by `# A chapter`)

Add an appendix as a special kind of un-numbered part: `# (APPENDIX) Other stuff {-}` (followed by `# A chapter`). Chapters in an appendix are prepended with letters instead of numbers.




<!--chapter:end:103-parts.Rmd-->

# Footnotes and citations 

## Footnotes

Footnotes are put inside the square brackets after a caret `^[]`. Like this one ^[This is a footnote.]. 

## Citations

Reference items in your bibliography file(s) using `@key`.

For example, we are using the **bookdown** package [@R-bookdown] (check out the last code chunk in index.Rmd to see how this citation key was added) in this sample book, which was built on top of R Markdown and **knitr** [@xie2015] (this citation was added manually in an external file book.bib). 
Note that the `.bib` files need to be listed in the index.Rmd with the YAML `bibliography` key.


The RStudio Visual Markdown Editor can also make it easier to insert citations: <https://rstudio.github.io/visual-markdown-editing/#/citations>

<!--chapter:end:104-citations.Rmd-->

# Blocks

## Equations

Here is an equation.

\begin{equation} 
  f\left(k\right) = \binom{n}{k} p^k\left(1-p\right)^{n-k}
  (\#eq:binom)
\end{equation} 

You may refer to using `\@ref(eq:binom)`, like see Equation \@ref(eq:binom).


## Theorems and proofs

Labeled theorems can be referenced in text using `\@ref(thm:tri)`, for example, check out this smart theorem \@ref(thm:tri).

::: {.theorem #tri}
For a right triangle, if $c$ denotes the *length* of the hypotenuse
and $a$ and $b$ denote the lengths of the **other** two sides, we have
$$a^2 + b^2 = c^2$$
:::

Read more here <https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.html>.

## Callout blocks


The R Markdown Cookbook provides more help on how to use custom blocks to design your own callouts: https://bookdown.org/yihui/rmarkdown-cookbook/custom-blocks.html

<!--chapter:end:105-blocks.Rmd-->

# Sharing your book

## Publishing

HTML books can be published online, see: https://bookdown.org/yihui/bookdown/publishing.html

## 404 pages

By default, users will be directed to a 404 page if they try to access a webpage that cannot be found. If you'd like to customize your 404 page instead of using the default, you may add either a `_404.Rmd` or `_404.md` file to your project root and use code and/or Markdown syntax.

## Metadata for sharing

Bookdown HTML books will provide HTML metadata for social sharing on platforms like Twitter, Facebook, and LinkedIn, using information you provide in the `index.Rmd` YAML. To setup, set the `url` for your book and the path to your `cover-image` file. Your book's `title` and `description` are also used.



This `gitbook` uses the same social sharing data across all chapters in your book- all links shared will look the same.

Specify your book's source repository on GitHub using the `edit` key under the configuration options in the `_output.yml` file, which allows users to suggest an edit by linking to a chapter's source file. 

Read more about the features of this output format here:

https://pkgs.rstudio.com/bookdown/reference/gitbook.html

Or use:


```r
?bookdown::gitbook
```



<!--chapter:end:106-share.Rmd-->


# References {-}


<!--chapter:end:107-references.Rmd-->


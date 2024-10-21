--- 
title: "Putnu sugu izplatības modelēšana biodaudzveidības aizsardzībai: materiāli reproducējamībai"
author: "Andris Avotiņš"
date: "2024-10-21"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
# url: https://aavotins.github.io/PutnuSDMs_gramata/
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  Putnu sugu izplatības modelēšana biodaudzveidības aizsardzībai: materiāli reproducējamībai.
link-citations: yes
github-repo: rstudio/bookdown-demo
---

# Par šo materiālu

Šis materiāls ir izstrādāts LVAFA finansētā projekta "" () ietvaros. Tā mērķis ir demonstrēt un skaidrot darba gaitu un pieņemtos lēmumus, lai nodrošinātu tā atkārtojamību un reproducējamību.

Materiāls ir izstrādāts R, izmantojot {bookdown}. Saturā raksturotā datu apstrāde un analīze galvenokārt ir veikta R un viens no nozīmīgiem iemesliem šī materiāla tapšanai ir informācijas par darba atkārtošanu, izmantojot pārbaudītas komandu rindas, nodošana. Kā vēlamais blakusprodukts - veicināt zinātniskās prakses un praktiskās zinātnes atvērtību un reproducējamību.





## Kas nav šis materiāls?

Šis materiāls **nav**:

* *iepazīstināšana ar R vai citu programmēšanas valodu*. Gluži pretēji - lietderīgākais tas būs personām ar izpratni komandu rindu lietošanā. Tomēr informatīvs par izmantotajām pieejām tas būs jebkuram;

* *pamācība ģeoprocesēšanā*. Šajā materiāla ir apkopotas tās pieejas, kuras tā izstrādes brīdī autoru kolektīvas ir zināmas kā efektīvākās (apstrādei nepieciešamā laika, operatīvās atmiņas un cietā diska apjoma, izpildes garantiju un uzticamības ziņā), bet noteikti nav vienīgās;

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

Reizēm tekstā atsaukšos uz R pakotnēm, tās likšu figūriekavās, piemēram {pakotne}.

* *grafikām* - dažādām diagrammām, kas raksturo darba plūsmu vai datu īpašības, bet lielākoties, kartēm;

* *saitēm uz citiem resursiem*, jo sevišķi uz augstāka līmeņa produktiem un rezultātiem, kas radīti projekta ietvaros, bet arī ievades datiem, ja tie ir publiski pieejami. Rezultāti ir paredzēti izmantošanai praksē.




## Satura izklāsts (orientācijai)

Vispārīgā darba un informācijas plūsma projektā ir ilustrēta sekojošajā attēlā. Tā ir izmantota par pamatu šī materiāla dalījumam nodaļās (nosauktas un īsi raksturotas zemāk). Nodaļām var būt vairāku līmeņu apakšnodaļas, jo sevišķi attiecībā uz konkrētiem ekoģeogrāfiskajiem mainīgajiem un sugu modelēšanas rezultātiem.



1. Sugu saraksts un pamata apraksti

2. Ar modeļiem aptveramā telpa un standartizācijas faili

3. Ievades ģeodati

4. Ekoģeogrāfiskie mainīgie

5. Novērojumu atlase

6. Sugu izplatības (dzīvotņu piemērotības) modeļi

7. Vietu prioritizēšana aizsardzībai




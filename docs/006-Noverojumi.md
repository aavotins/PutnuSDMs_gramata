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

Šī darba laikā arī izslēdzu novērojumus, kuri apraksta raksturo neapdzīvotas 
ligzdas vai norāda neprecīzas koordinātes.


Ar šiem novērojumiem ir turpināma atlase modelēšanai.

## Novērojumu atlase {#Chapter6.1}

Novērojumu atlase sugu izplatības modelēšanai veikta vairākos soļos:

1. solis: tikai analizējamās sugas;

2. solis: novērojumi no 2017-01-01 līdz 2023-12-01, saglabāju tikai tos, kuri attiecas uz laika periodu, kas nepārsniedz 10 dienas;

3. solis: dublieru izslēgšana - gan no ik viena datu avota, gan datu avotu kopas;

4. solis: savienošana ar Corine LandCover klasēs acīmredzami nekorekto novērojumu izslēgšanai;

5. solis: novērojums veikts ar ligzdošanu saistāmā gada daļā;

6. solis: saistīšana ar [vides pārmaiņām](#Chapter3.3);

7. solis: papildkritērijs - attālums no apdzīvotajām vietām;

8. solis: augstākās ligzdošanas ticamības pakāpes, kurām novērojumu skaits un izvietojums pieļauj modelēšanu

### Solis 1: Analizējamās sugas {#Chapter6.1.1}

Vārdnīcas katrai datu kopai


### Solis 2: Datums un laiks {#Chapter6.1.2}

Kopš 2017. gada

Ne ilgāku periodu par 10 dienām


### Solis 3: Dublieri {#Chapter6.1.3}

Ik datubāzē un starp tām

### Solis 4: Novietojums {#Chapter6.1.4}

Saskaņā ar CLC, izslēdzot droši nepiemēroto vidi

### Solis 5: Sezonalitāte {#Chapter6.1.5}

Ligzdošanas sezona, izņemot pierādītajām ligzdošanām

### Solis 6: Vides pārmaiņas {#Chapter6.1.6}

Analīzes šūnā nevienā periodā kopš novērojuma ne vairāk par 10%

Ligzdošanas iecirknī ne vairāk par 10%

Netiek vērtēts no 2023. gada

### Solis 7: Papildkritēriji {#Chapter6.1.7}

Vismaz ACCGEN - attālums no apdzīvotām vietām


### Solis 8: Augstākās ligzdošanas ticamības pakāpes, kurām novērojumu skaits un izvietojums pieļauj modelēšanu {#Chapter6.1.8}

Ligzdošanas ticamības pakāpju pierēķināšana, lai izvēlētos uzticamākos, bet pietiekoša apjoma datus bez acīmredzamām telpiskajām problēmām

### Papildsolis: neatkarīgi testa dati {#Chapter6.1.9}

Šie ir rets izņēmums, bet tie ir eksistējoši

## Novērojumu atlases procesa rezultāti {#Chapter6.2}

Lēmumu pieņemšana par turpmāko modelēšanu un tai izmantojamajiem datiem

Stabiņu diagrammas un kartes sagatavošana ik sugai



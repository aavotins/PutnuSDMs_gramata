# Sugu saraksts un pamata apraksti  {#Chapter1}

Šajā nodaļā sniegts analīzei izvēlēto sugu saraksta pamatojums un demonstrēta informācijas apkopošanas gaita sugu bioloģijas un ekoloģijas aprakstiem, kas tālāk izmantoti modelēšanā.

Saskaņā ar projekta pieteikumu, uzdevums ir izstrādāt vismaz 70 slāņus ar dzīvotņu piemērotības analīzes rezultātiem. Sākotnēji analīzei izvēlēto sugu loks ir 116, lai samazinātu spriedzi ap ik sugas rezultāta uzticamību un pielietojamību mērķim.

## Analizējamo sugu izvēle {#Chapter1.1}

No 375 Latvijā jebkad konstatētajām putnu sugām [@PutniLV], 335 ir uzskatāmas par (šobrīd vai vismaz vienu desmitgadi kopš 1900. gada) ligzdotājām [@Avotins_etal_2024a:LfS_Conference]. Tomēr tas nebūt nenozīmē, ka visām par ligzdotājām uzskatāmajām putnu sugām ir pieejami dati (un projektam - resursi) modelēšanai. Tādēļ vaikta tālāka sugu atlase.

No visām ligzdojošo putnu sugām atlasītas jeb modelēšanai paredzētas:

1. Putnu Direktīvas (Eiropas Parlamenta un Padomes Direktīva 2009/147/EK ( 2009. gada 30. novembris ) par savvaļas putnu aizsardzību) 1. pielikumā iekļautās sugas;

2. Life for Species projektā [@LifeForSpecies] par aizsargājamām klasificētās;

3. Life for Species projektā [@LifeForSpecies] par apdraudētām klasificētās;

4. ES aizsargājamo biotopu rokasgrāmatā iekļautās sugas [@ESbiotopurokasgramata];

5. Bioloģiski vērtīgo zālāju indikatorsugas [@BVZmetodika];

6. Lauku putnu indeksā iekļautās sugas [@LPU2020];

7. Latvijas vai boreālā reģiona meža putnu indeksā iekļautās sugas [@LPU2020];

8. Sugas, kurām ir izstrādāti aizsardzības plāni, kuros iekļauta dzīvotņu piemērotības modelēšana [@PucuPlans], [@DzenuPlans];

Pēc primārā saraksta, kurš raksturo vispārēju nepieciešamību (vai iespējas) modelēšanai, sagatavošanas, tas papildināts ar izslēgšanas kritērijiem:

1. Sugas ekoloģiskā niša ir saistīta ar dzīvotnēm, kuru raksturošanai nepieciešami sevišķi specifiski ekoģeogrāfiskie mainīgie, kuru izstrādei ir sevišķi ierobežota ģeodatu pieejamība. Šeit uzsveram, ka šī projekta uzdevums nav aptvert visas putnu sugas, tas arī nav atrisināt valsts līmenī iztrūkstošu ģeoreferencētu informāciju par specifiskiem vides apstākļiem;

2. Ar ligzdošanu (sugai specifiskiem ligzdošanas ticamības kategorijas sliekšņiem) saistītu novērojumu indikatīvā pieejamība. Šai indikācijai izmantojām Life for Species [@LifeForSpecies] projektā veiktās datu tīrīšanas rezultātus, kas aptvēra laika periodu no 2012. līdz 2021. gadam, kurus agregējām 1 km Latvijas koordinātu sistēmas kvadrātos. Par minimālo indikatīvo novērojumu apjoma slieksmi pieņēmām 20 kvadrātus ar vismaz iespējamu ligzdošanu sugām, kuras vides datu pieejamības dēļ netika izslēgtas. Tik zems slieksnis izvēlēts, lai gadījumā, ja daļai sugu neizdotos sasniegt izmantošanas vērtu modeļa sniegumu, vēl joprojām būtu sasniegts projekta mērķis (70 slāņi).

Sākotnējais modelēšanai izvēlēto sugu saraksts (ar nomenklatūru un saīsinājumu kodiem) un iekļaušanas pamatojums ir sniegts sekojošajā tabulā \@ref(tab:SuguIzvele).

<div style="border: 0px;overflow-x: scroll; width:100%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:SuguIzvele)Sākotnējais sugu saraksts (sugas kods; nosaukums; atbilstība iekļaušanas kritērijiem un 1 km kvadrātu, kuros projekta Life for Species atlasē saglabājusies sugas klātbūtne, skaits)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Kods </th>
   <th style="text-align:left;"> Nosaukums </th>
   <th style="text-align:right;"> Putnu Direktīvas 1. pielikums </th>
   <th style="text-align:right;"> Aizsargājama suga </th>
   <th style="text-align:right;"> Apdraudēta suga </th>
   <th style="text-align:right;"> Biotopu rokasgrāmatas suga </th>
   <th style="text-align:right;"> BVZ indikatorsuga </th>
   <th style="text-align:right;"> Lauku putnu indekss </th>
   <th style="text-align:right;"> Meža putnu ikdekss </th>
   <th style="text-align:right;"> Aizsardzības plāns </th>
   <th style="text-align:right;"> Kvadrāti </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> COTCOT </td>
   <td style="text-align:left;"> paipala Coturnix coturnix </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 349 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PERPER </td>
   <td style="text-align:left;"> laukirbe Perdix perdix </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 612 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BONBON </td>
   <td style="text-align:left;"> mežirbe Bonasa bonasia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1917 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TETURO </td>
   <td style="text-align:left;"> mednis Tetrao urogallus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 487 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LYRTET </td>
   <td style="text-align:left;"> rubenis Lyrurus tetrix </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CYGCYG </td>
   <td style="text-align:left;"> ziemeļu gulbis Cygnus cygnus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1365 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANSANS </td>
   <td style="text-align:left;"> meža zoss Anser anser </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 222 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TADTAD </td>
   <td style="text-align:left;"> Sāmsalas dižpīle Tadorna tadorna </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 278 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AYTFER </td>
   <td style="text-align:left;"> brūnkaklis Aythya ferina </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 138 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AYTFUL </td>
   <td style="text-align:left;"> cekulpīle Aythya fuligula </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 212 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPAQUE </td>
   <td style="text-align:left;"> prīkšķe Spatula querquedula </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 174 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPACLY </td>
   <td style="text-align:left;"> platknābis Spatula clypeata </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 96 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MARSTR </td>
   <td style="text-align:left;"> pelēkā pīle Mareca strepera </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 152 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MARPEN </td>
   <td style="text-align:left;"> baltvēderis Mareca penelope </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TACRUF </td>
   <td style="text-align:left;"> mazais dūkuris Tachybaptus ruficollis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 125 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PODGRI </td>
   <td style="text-align:left;"> pelēkvaigu dūkuris Podiceps grisegena </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 179 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PODCRI </td>
   <td style="text-align:left;"> cekuldūkuris Podiceps cristatus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1155 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STRTUR </td>
   <td style="text-align:left;"> parastā ūbele Streptopelia turtur </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 607 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAPEUR </td>
   <td style="text-align:left;"> vakarlēpis Caprimulgus europaeus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1269 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RALAQU </td>
   <td style="text-align:left;"> dumbrcālis Rallus aquaticus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 261 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CRECRE </td>
   <td style="text-align:left;"> grieze Crex crex </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4270 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PORPOR </td>
   <td style="text-align:left;"> ormanītis Porzana porzana </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 165 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ZAPPAR </td>
   <td style="text-align:left;"> mazais ormanītis Zapornia parva </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 114 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FULATR </td>
   <td style="text-align:left;"> laucis Fulica atra </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 705 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRUGRU </td>
   <td style="text-align:left;"> dzērve Grus grus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 5115 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CICNIG </td>
   <td style="text-align:left;"> melnais stārķis Ciconia nigra </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 255 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CICCIC </td>
   <td style="text-align:left;"> baltais stārķis Ciconia ciconia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 10648 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOTSTE </td>
   <td style="text-align:left;"> lielais dumpis Botaurus stellaris </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 592 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IXOMIN </td>
   <td style="text-align:left;"> mazais dumpis Ixobrychus minutus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAEOST </td>
   <td style="text-align:left;"> jūrasžagata Haematopus ostralegus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 103 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLUAPR </td>
   <td style="text-align:left;"> dzeltenais tārtiņš Pluvialis apricaria </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 210 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CHAHIA </td>
   <td style="text-align:left;"> smilšu tārtiņš Charadrius hiaticula </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CHADUB </td>
   <td style="text-align:left;"> upes tārtiņš Charadrius dubius </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 604 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VANVAN </td>
   <td style="text-align:left;"> ķīvīte Vanellus vanellus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4284 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NUMPHA </td>
   <td style="text-align:left;"> lietuvainis Numenius phaeopus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NUMARQ </td>
   <td style="text-align:left;"> kuitala Numenius arquata </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 171 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LIMLIM </td>
   <td style="text-align:left;"> melnā puskuitala Limosa limosa </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GALMED </td>
   <td style="text-align:left;"> ķikuts Gallinago media </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GALGAL </td>
   <td style="text-align:left;"> mērkaziņa Gallinago gallinago </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRINEB </td>
   <td style="text-align:left;"> lielā tilbīte Tringa nebularia </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRITOT </td>
   <td style="text-align:left;"> pļavu tilbīte Tringa totanus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 172 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRIGLA </td>
   <td style="text-align:left;"> purva tilbīte Tringa glareola </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 188 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GLAPAS </td>
   <td style="text-align:left;"> apodziņš Glaucidium passerinum </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 889 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AEGFUN </td>
   <td style="text-align:left;"> bikšainais apogs Aegolius funereus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 129 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ASIOTU </td>
   <td style="text-align:left;"> ausainā pūce Asio otus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 486 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STRALU </td>
   <td style="text-align:left;"> meža pūce Strix aluco </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2669 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STRURA </td>
   <td style="text-align:left;"> urālpūce Strix uralensis </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 582 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BUBBUB </td>
   <td style="text-align:left;"> ūpis Bubo bubo </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PANHAL </td>
   <td style="text-align:left;"> zivjērglis Pandion haliaetus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 501 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PERAPI </td>
   <td style="text-align:left;"> ķīķis Pernis apivorus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 850 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CLAPOM </td>
   <td style="text-align:left;"> mazais ērglis Clanga pomarina </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1953 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CIRAER </td>
   <td style="text-align:left;"> niedru lija Circus aeruginosus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1950 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACCNIS </td>
   <td style="text-align:left;"> zvirbuļvanags Accipiter nisus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 792 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACCGEN </td>
   <td style="text-align:left;"> vistu vanags Accipiter gentilis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 679 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HALALB </td>
   <td style="text-align:left;"> jūras ērglis Haliaeetus albicilla </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 505 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MILMIL </td>
   <td style="text-align:left;"> sarkanā klija Milvus milvus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MILMIG </td>
   <td style="text-align:left;"> melnā klija Milvus migrans </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 125 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BUTBUT </td>
   <td style="text-align:left;"> peļu klijāns Buteo buteo </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 5323 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UPUEPO </td>
   <td style="text-align:left;"> pupuķis Upupa epops </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 853 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CORGAR </td>
   <td style="text-align:left;"> zaļā vārna Coracias garrulus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> JYNTOR </td>
   <td style="text-align:left;"> tītiņš Jynx torquilla </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1292 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PICCAN </td>
   <td style="text-align:left;"> pelēkā dzilna Picus canus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2038 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DRYMAR </td>
   <td style="text-align:left;"> melnā dzilna Dryocopus martius </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4234 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PICTRI </td>
   <td style="text-align:left;"> trīspirkstu dzenis Picoides tridactylus </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 233 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LEIMED </td>
   <td style="text-align:left;"> vidējais dzenis Leiopicus medius </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1853 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DRYMIN </td>
   <td style="text-align:left;"> mazais dzenis Dryobates minor </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1458 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DENLEU </td>
   <td style="text-align:left;"> baltmugurdzenis Dendrocopos leucotos </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1273 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DENMAJ </td>
   <td style="text-align:left;"> dižraibais dzenis Dendrocopos major </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7064 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FALTIN </td>
   <td style="text-align:left;"> lauku piekūns Falco tinnunculus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 325 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FALCOL </td>
   <td style="text-align:left;"> purva piekūns Falco columbarius </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORIORI </td>
   <td style="text-align:left;"> vālodze Oriolus oriolus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3320 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LANCOL </td>
   <td style="text-align:left;"> brūnā čakste Lanius collurio </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3623 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LANEXC </td>
   <td style="text-align:left;"> lielā čakste Lanius excubitor </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 492 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NUCCAR </td>
   <td style="text-align:left;"> riekstrozis Nucifraga caryocatactes </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 608 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PERATE </td>
   <td style="text-align:left;"> meža zīlīte Periparus ater </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2475 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LOPCRI </td>
   <td style="text-align:left;"> cekulzīlīte Lophophanes cristatus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3292 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> POEPAL </td>
   <td style="text-align:left;"> purva zīlīte Poecile palustris </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2465 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> POEMON </td>
   <td style="text-align:left;"> pelēkā zīlīte Poecile montanus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3278 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LULARB </td>
   <td style="text-align:left;"> sila cīrulis Lullula arborea </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2747 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ALAARV </td>
   <td style="text-align:left;"> lauku cīrulis Alauda arvensis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 7409 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IDUCAL </td>
   <td style="text-align:left;"> klusais ķauķis Iduna caligata </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACRRIS </td>
   <td style="text-align:left;"> purva ķauķis Acrocephalus palustris </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2842 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACRARU </td>
   <td style="text-align:left;"> niedru strazds Acrocephalus arundinaceus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1538 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LOCFLU </td>
   <td style="text-align:left;"> upes ķauķis Locustella fluviatilis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1659 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LOCNAE </td>
   <td style="text-align:left;"> kārklu ķauķis Locustella naevia </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1492 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HIRRUS </td>
   <td style="text-align:left;"> bezdelīga Hirundo rustica </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4224 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PHYSIB </td>
   <td style="text-align:left;"> svirlītis Phylloscopus sibilatrix </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 5918 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AEGCAU </td>
   <td style="text-align:left;"> garastīte Aegithalos caudatus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1414 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CURNIS </td>
   <td style="text-align:left;"> svītrainais ķauķis Curruca nisoria </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 385 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CURCOM </td>
   <td style="text-align:left;"> brūnspārnu ķauķis Curruca communis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 6415 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CERFAM </td>
   <td style="text-align:left;"> mizložņa Certhia familiaris </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3425 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SITEUR </td>
   <td style="text-align:left;"> dzilnītis Sitta europaea </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 5063 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STUVUL </td>
   <td style="text-align:left;"> mājas strazds Sturnus vulgaris </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 6633 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TURVIS </td>
   <td style="text-align:left;"> sila strazds Turdus viscivorus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3075 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TURILI </td>
   <td style="text-align:left;"> plukšķis Turdus iliacus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1115 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CYASVE </td>
   <td style="text-align:left;"> zilrīklīte Cyanecula svecica </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LUSLUS </td>
   <td style="text-align:left;"> lakstīgala Luscinia luscinia </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4529 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FICPAR </td>
   <td style="text-align:left;"> mazais mušķērājs Ficedula parva </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2415 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FICHYP </td>
   <td style="text-align:left;"> melnais mušķērājs Ficedula hypoleuca </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4072 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAXRUB </td>
   <td style="text-align:left;"> lukstu čakstīte Saxicola rubetra </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 5301 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> REGREG </td>
   <td style="text-align:left;"> zeltgalvītis Regulus regulus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4246 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> REGIGN </td>
   <td style="text-align:left;"> sārtgalvītis Regulus ignicapilla </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 523 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PASMON </td>
   <td style="text-align:left;"> lauku zvirbulis Passer montanus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3441 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANTPRA </td>
   <td style="text-align:left;"> pļavu čipste Anthus pratensis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2143 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANTCAM </td>
   <td style="text-align:left;"> stepes čipste Anthus campestris </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 162 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MOTFLA </td>
   <td style="text-align:left;"> dzeltenā cielava Motacilla flava </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1393 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MOTCIT </td>
   <td style="text-align:left;"> citroncielava Motacilla citreola </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 100 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COCCOC </td>
   <td style="text-align:left;"> dižknābis Coccothraustes coccothraustes </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2010 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CARERY </td>
   <td style="text-align:left;"> mazais svilpis Carpodacus erythrinus </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3949 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PYRPYR </td>
   <td style="text-align:left;"> svilpis Pyrrhula pyrrhula </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3323 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CHLCHL </td>
   <td style="text-align:left;"> zaļžubīte Chloris chloris </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4350 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LINCAN </td>
   <td style="text-align:left;"> kaņepītis Linaria cannabina </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 2007 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LOXCUR </td>
   <td style="text-align:left;"> egļu krustknābis Loxia curvirostra </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 640 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CARCAR </td>
   <td style="text-align:left;"> dadzītis Carduelis carduelis </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4212 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EMBHOR </td>
   <td style="text-align:left;"> dārza stērste Emberiza hortulana </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 117 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EMBCIT </td>
   <td style="text-align:left;"> dzeltenā stērste Emberiza citrinella </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 9517 </td>
  </tr>
</tbody>
</table></div>



## Pamata apraksti analīzei {#Chapter1.2}

Analīzes plānošanai - potenciālo vidi raksturojošo ekoģeogrāfisko mainīgo (EGV) sagatavošanai, to sugām specifisko telpisko mērogu identificēšanai un sugu saistīšanai ar vispārīgām ekosistēmas grupām gan EGV sākotnējai izvēlei, gan kompleksas biodaudzveidības aizsardzības telpiskajai plānošanai - sugas iedalītas principiālās tām raksturīgajās ekosistēmās un, balstoties literatūras analīzē, piešķirtas tām raksturīgās izmantotās ainavas telpas.

Kā principiālās ekosistēmas izvēlētas plašas grupas: meži, lauksaimniecības ainava (lauki), mitrāji un ūdeņi, tomēr daļai sugu raksturīga kāda šaura specifiskāka vide, tādēļ tām izdalīta atsevišķa kategorija - "cita". Mozaīkveida ainavu apdzīvojošām sugām un sugām ar kompleksu ekoloģisko nišu, piemēram, atšķirīgu ligzdošanas un barošanās ekosistēmu, vienlaikus piešķirtas vairākas grupas. Ekosistēmu grupu piešķiršanai izmantota vispārīgā literatūra  un projekta ornitologu (A. Avotiņa un A. Auniņa) ekspertīze.

Par raksturīgo izmantoto ainavas telpu visbiežāk uzskatāma ligzdošanas iecirkņa platība. Tomēr, atkarībā no sugas ligzdošanas ekoloģijas, var būt telpiski apjomīga atšķirība starp ligzdas aizsardzības zonu un barošanās iecirkni. Turklāt katras šīs teritorijas platība mainās līdz ar vides apstākļiem (dzīvotņu piemērotību). Visuzticamākā informācija būtu, izmantojot Latvijā veiktus telemetrijas pētījumus, tomēr sugu loks, kurām šādi dati ir pieejami ir ārkārtīgi ierobežots un tas ir gandrīz neeksistējošs publicētu datu veidā. Tādēļ pieņemts lēmums veikt literatūras analīzi (resursu ierobežotības un mērķa vispārības jeb zemās nepieciešamības pret augstu precizitāti dēļ, ne sistemātiska pārskata ik sugai veidā), kas ierobežota nosacījumiem (prioritārā secībā):

1. meklēt informāciju par ligzdošanas iecirkņa (*home range*) platību vismaz pieciem Eiropā (Latvijai iespējami līdzīgākos apstākļos) veiktiem telemetrijas pētījumiem;

2. paplašināt meklējumus ārpus Eiropas veiktiem telemetrijas pētījumiem, tos kombinējot ar no sastopamības blīvuma izrietošiem teritorijas lieluma aprēķiniem;

3. apkopot Latvijai telpiski tuvāko un ekoloģiski līdzīgāko vidējo ligzdošans blīvumu rādītājus, kas pārrēķināti vidējai ligzdošanas iecirkņa platībai.

Šī uzdevuma mērķis bija vispārīga sugu grupēšana izmantotās ainavas telpās un sagatavojamo EGV apjoma ierobežana, iegūtais rezultāts nepretendē uz sistemātiskā pārskata statusu. Kopējais aptverto informācijas avotu skaits ir 232 (vidēji sugai informācija no 5.86 (IQR: 4 - 7) avotiem, vidēji sugai ir 16.97 (IQR: 9 - 22) ieraksti), tomēr izmantojot apkopojošos darbus (piemēram, monogrāfijas un pārskata rakstus) nav mēģināts referencēt ik oriģinālo darbu - atsauce sniegta uz izmantoto pārskatu.

Darba gaitas vienkāršošanai, situācijās, kad sniegta informācija gan par centrālo tendenci, gan variabilitāti, izmantots tikai centrālās tendences mērs. Situācijās, kurās pieejama informācija tikai par robežlielumiem (piemēram, minimālais un maksimālais), aprēķināts ģeometriskais vidējais. Visi ligzdošanas iecirkņu raksturojumi izteikti hektāros un ik ierakstam aprēķināts rādiuss metros, pieņemot, ka ligzdošanas iecirknis ir aplis. Lai gan šis pieņēmums ir nenoliedzami aplams gandrīz jebkurā situācijā, iegūtais rezultāts ļauj vispārīgi plānot analīzes gaitu un grupēt sugas ligzdošanas iecirkņu grupās, tādā veidā limitējot sagatavojamo EGV skaitu.

Sugām raksturīgo ekosistēmu dalījums un izdalītās ligzdošanas iecirkņu grupas ir redzamas sekojošajā attēlā \@ref(fig:AinavTelpas). Visas sugas iedalītas kādā no trīs ligzdošanas iecirkņa rādiusa grupām pēc vērtības mediānā un trešajā kvartilē: līdz/ap 500 m, līdz/ap 1250 m, līdz/ap 3000 m. Katrai ligzdošanas iecirkņa platībai piešķirts plašāks ainavas telpas mērogs (EGV sagatavošanai un modelēšanai), tie attiecīgi ir: 1250 m, 3000 m, 10 000 m. Atsevišķos gadījumos - komunāli riestojošajām sugām - ligzdošanas iecirkņa rādiuss palielināts par vienu soli (un atbilstoši arī ainavas telpa) sugas vairošanās bioloģijas - nepieciešamības spēt uzturēt vairākus iecirkņus, kuru indivīdiem satikties uz riestu - dēļ. Līdzīgi arī sugām ar izteikti plašiem medību iecirkņiem, mērogi pieņemti par vienas grupas soli uz augšu. Gadījumos, kad telemetrijas rezultāti ierosināja atšķirīgu ligzdošanas iecirkņa rādiusa grupu nekā vidējā blīvuma pārrēķins, lēmums pieņemts, balstoties telemetrijas pētījumos.

<div class="figure">
<img src="./Atteli/ch001_AinavTelpas.png" alt="Sugu dalījums ekosistēmās un ainavas platībās (sugu kodi ar zvaigznīti, raksturo telemetrijas pētījumu rezultātus; telemetrijas pētījumu un citiem rezultātiem ir atšķirīgi simboli; sugu kodi kā 2.1. tabulā)" width="100%" />
<p class="caption">(\#fig:AinavTelpas)Sugu dalījums ekosistēmās un ainavas platībās (sugu kodi ar zvaigznīti, raksturo telemetrijas pētījumu rezultātus; telemetrijas pētījumu un citiem rezultātiem ir atšķirīgi simboli; sugu kodi kā 2.1. tabulā)</p>
</div>

<br>




## Pamata apraksti novērojumu atlasei {#Chapter1.3}

Vispārīgi, tomēr strukturēti, apraksti sagatavoti arī modelēšanā izmantojamo novērojumu atlasei. Šie apraksti ietver divas daļas: sugai nepiemērotā vide (Corine Land Cover klase, CLC) un ligzdošanas sezonas robežas. Novērojumu atlases procedūra detalizēti izklāstīta nodaļā [Novērojumu atlase](#Chapter6), sugām specifiskie kritēriji sniegti [šajā tabulā](./Papilddati/SuguApraksti_NoverojumuAtlasei.xlsx), zemāk raksturota to izstrādes gaita.

### Nepiemērota vide {#Chapter1.3.1}

Tā kā ievērojama daļa modelēšanai potenciāli izmantojamo novērojumu ir sabiedrības zinātnes ceļā iegūti, tiem ir sagaidāmas ievērojamas novietojuma telpā neprecizitātes. No tām nav pasargātas arī profesionāļu ievāktās ziņas, piemēram, mērierīcas kļūdas dēļ. Ņemot vērā datu apjomu (skatīt, piemēram, https://dabasdati.lv/lv/article/dabasdatilv-zinojumu-apkopojums-2024-gada-aprilis-junijs/2024/), nav iespējams apskatīt un izvērtēt novērojuma lokācijas kļūdu katram vienam novērojumam. Tomēr pat idealizējot situācijām, kad tas būtu iespējams, ir nepieciešami skaidri kritēriji nosacījumiem, kad lokācija nav uzskatāma par drošu. Tā kā vide ir heterogēna, loģiski ir novērojumus pārbaudīt attiecībā pret zemes seguma vai zemes lietojuma (LULC) veidiem. Tomēr, lai cik intuitīvi pareizi tas nešķistu, nav jēgas tos vērtēt attiecībā pret piemērotajām LULC klasēm, jo piemērotība ir gradients un bez papildu analīzēm, kuru veikšana ir šī projekta uzdevums, nav iespējams pietiekoši uzticami nodalīt dažādas šī piemērotības gradienta daļas. Tomēr gandrīz jebkurai sugai ir iespējams definēt vidi (LULC klasi), kas nekādā gadījumā nav tieši saistāma ar ligzdošanu, jo sevišķi, ja telpiski šī klase ir tik plaša, lai daudzkārt pārsniegtu vispārīgo labas veiktspējas mērierīces precizitāti (zem 10 m labos apstākļos). Šādu iespēju nodrošina, piemēram, Corine Land Cover dati, kuru minimālā kartēšanas izšķirtspēja ir plankums ar laukumu vismaz 25 ha un ne šaurāks par 100 m (https://land.copernicus.eu/en/products/corine-land-cover). Lai gan šobrīd aktuālākā CLC versija raksturo 2018. gadu, bet modelēšanā aptvertais laika periods ir līdz 2023. gadam (ieskaitot), tomēr tā nav uzskatāma par problēmu, jo *plašas* (no 25 ha) pārmaiņas starp diametrāli atšķirīgām klasēm (no piemērotas vai suboptimās uz noteikti nepierētoru) nav sagaidāmas par biežām, bet vēl vairāk - datu atlasē vides pārmaiņas tik iekļautas kā atsevišķs solis. Tā kā šajā uzdevumā svarīgas ir plašas LULC kategorijas, izmantots CLC pirmā līmeņa dalījums (pirmais cipars no trīsciparu LULC klases koda). Tātad, novērojumi attiecināti pret CLC kategorijām: mākslīgās virsmas (CLC 1; pazīme "Maksligie"), izņemot pilsētu zaļās zonas, kas pievienotas kokiem klātām platībām (CLC 141 -> CLC 3); lauksaimniecības zemes, dabiskie zālāji, virsāji, kāpas un smiltāji (CLC 2, CLC 321, CLC 322, CLC 331; pazīme "Atvertie"); meži un pus-dabiskās platības, kurām pievienotas pilsētu zaļās zonas un izslēgtas klases dabiskie zālāji, virsāji un kāpas un smiltāji (CLC 3 un CLC 141, bet CLC 321 -> CLC 2, CLC 322 -> CLC 2, CLC 331 -> CLC 2; pazīme "Koki"); mitrāji (CLC 4; pazīme "Mitraji"); ūdeņi (CLC 5; pazīme "Udeni").

Vidē, kurā ar ligzdošanu saistīta sugas sastopamība ir sevišķi nesagaidāma, atbilstošajā pazīmē ir ievietota vērtība "-1". Šo vērtību piešķiršanas gaitā domāts arī par plankumu izmēriem - ja sugai ir neliels ligzdošanas iecirknis (Fig. \@ref(fig:AinavTelpas)), kura platība var būt mazāka par CLC kartēšanas vienību, var nebūt atzīmju nevienā pazīmē. Līdzīgi, atzīmes va rnebūt situācijās, kad sugai ir raksturīgi dažādi robežbiotopi, piemēram, suga neligzdo ūdeņos, bet apdzīvo to visdažādākās to malas - CLC kartēšanas robežkļūdas
dēļ, nav pamata veikt atzīmi nevienā no pazīmēm.

### Ligzdošanas sezona {#Chapter1.3.2}

Ligzdošanas sezonas raksturošanai izmantota detalizētākā pieejamā informācija no Eiropas [@KrampisVol1], [@KrampisVol2], [@KrampisVol3], [@KrampisVol4], [@KrampisVol5], [@KrampisVol6], [@KrampisVol7], [@KrampisVol8], [@KrampisVol9]. Lai gan šī informācija ir uzskatāma par vismaz pusgadsmitu senu un gandrīz nekad ne Latvijā iegūtu, tā tomēr spēj raksturot laiku, kad sugām principā ir sagaidāmi ar ligzdošanu saistāmi novērojumi. Ievērojama daļa aprakstu nāko no Eiropas reģioniem ar okeāniskāku klimatu vai vairāk uz dienvidiem, kas saistībā ar klimata pārmaiņām vairāk asociējas ar situāciju Latvijā šobrīd (salīdznot ar laiku pirms vairāk nekā pusgadsimta), tomēr plaši izplatītām sugām ar lielu informācijas apjomu, šie dati var būt iegūti arī Ziemeļāfrikā kā aiz Ziemeļu polārā loka. Tādēļ priekšroka dota (sekojošajā secībā) datiem no Centrāleiropas (1); platlapju  un jauktu koku mežu reģiona (2); boreālās zonas (3); vai kopumā sugu raksturojošie neatkarīgi no reģiona. Ligzdošanas sezonas sākums noteikts pēc agrākā minētā olu dēšanas sākuma, ligzdošanas sezonas beigas rēķinātas, ņemot vērā tekstā norādīto ligzdošanas laiku (vēlāko ligzdošans uzsākšanu), olu inkubācijas ilgumu, laiku starp izdētām olām, inkubācijas uzsākšanu attiecībā pret dējuma pilnību, perēšanas ilgumu, mazuļu ligzdā pavadīto laiku, laiku līdz lidspējai, atkārtotos dējumus u. tml.

## Pamata apraksti starpsugu svarošanai {#Chapter1.4}

Veicot vietu prioritizēšanu sugu aizsardzībai (nodaļa [Vietu prioritizēšana aizsardzībai](#Chapter9)) ik sugai individuāli, *a priori* nav nepieciešama nekāda informācija papildus dzīvotņu piemērotības slāņiem. Tomēr, plānojot dabas vai biodaudaudzveidības aizsardzību plašākā kontekstā, ņemot vērā dažādos telpas ierobežojumus un telpiskās pārklāšanās un atšķirības starp sugu dzīvotnēm kā arī faktu, ka dāžādām sugām ir atšķirīga nozīme dabas aizsardzībā, ir nepieciešams veidot kompleksāku pieeju. Pieejas pamatā ir atšķirīgu nozīmes svaru piešķiršana ik sugai projicētajiem dzīvotņu piemērotības slāņiem. Šos svaru var iegūt dažādi, tomēr labāk to darīt ir izmantojot iespējami salīdzināmas kvantitātes, kurās apkopota gan sugas bioloģija un ekoloģija, gan dažādi politiskie vai juridiskie un sociālie apsvērumi.

Sociālos apsvērumus ir labi risināt, piemēram, ar ekosistēmu pakalpojumu pieeju, ko visērtāk iestrādāt vietu hierarhiskā prioritizācijā kā atsevišķu latento faktoru, vai pielietot prioritizācijas rezultātu komunikācijā. Šajā materiālā tie tiešā viedā nav iestrādāti.

Ar politiskajiem un juridiskajiem apsvērumiem var saprast, piemēram, likumdošanu - ar sugām var būt saistīti dažādi apsaimniekošanas ierobežojumi vai būt regulēta pati apsaimniekošana. Tomēr nereti šie dokumenti ir novecojuši, salīdzinot ar populāciju ekoloģijas atziņām, piemēram, relatīvi neilgā laikā (pat mazāk kā desmitgadē), sugu populācijas no stabilām vai pieaugošām var kļūst par sarūkošām un pat līdz tādam līmenim, ka kļūst apdraudētas, bet normatīvie akti tam nespēj izsekot. Neiedziļinoties jautājumu par nepieciešamību ik gadu pārskatīt nacionālos un starptautiskos tiesību aktus, šo aspektu tiešā veidā (citādi kā sugu loka izvēlē) sugu svarošanā neiekļāvām. Tā vietā izmantojām kvantitatīvu sugu bioloģijas un ekoloģijas informāciju, kas varētu būt pamatā juridiskajiem statusiem un to atšķirībām.

Ir skaidrs, ka mažakas populācijas ir vairāk apdraudētas un tām var būt nepieciešama stingrāka aizsardzība. Tāpat arī ir skaidrs, ka par sugām, kuru populācijas ir proporcionāli vairāk koncentrētas Lativjā, ir augstāka nacionālā atbildība. Kā arī, stingrāka aizsardzība ir nepieciešama saŗukošām populāicjām un sugām ar retāku vairošanos un zemāku mūža reproduktīvo sasniegumu. Šī ir sugu pamata bioloģijas un ekoloģijas informācija, kas ir iegūstama ar literatūras analīzes palīdzību (skaidrota sekojošajās apakšnodaļās) un izmantojama kā dāla no nepieciešamajiem datiem starpsugu svarošanai vietu prioritizēšanai. Sagatavotie apraksti ir apskatāmi [šajā tabulā](./Papilddati/SuguApraksti_SvarosanaiEkologija.xlsx), zemāk skaidrota to izstrādes gaita un izmantotie informācijas avoti.

### Populācijas lielums un pārmaiņas {#Chapter1.4.1}

Dati par putnu sugu populāciju lielumiem un to pārmaiņām Eiropas Savienībā un tās dalībvalstīs ir pieejami un regulāri atjaunoti Putnu Direktīvas (Eiropas Parlamenta un Padomes Direktīva 2009/147/EK ( 2009. gada 30. novembris ) par savvaļas putnu aizsardzību) 12. panta ziņojumu ietvaros. Šajā pārskatā izmantoti 2012.-2018. gada pārskata perioda rezultāti (sugu kopsavilkumi par katru dalībvalsti: https://nature-art12.eionet.europa.eu/article12/report?period=3&country= ; sugu kopsavilkumi Eiropā kopumā: https://nature-art12.eionet.europa.eu/article12/summary?period=3&subject=&reported_name=). Apkopojumā ir sekojoši svarošanai izmantojamie lauki:

- `Populacija_LV`, kurā raksturots sugas Latvijas populācijas lielums. Sugām, kurām ziņoti intervāli, aprēķināts ģeometriskais vidējais, pārējos gadījumos, izmantots ziņojumā sniegtais putnka vērtējums;

- `Populacija_Eiropa`, kurā raksturots sugas Eiropas populāicjas lielums. Tas aprēķināts kā ģeometriskais vidējais no minimālā un maksimālā rādītāja;

- `PopProp_LV`, kurā raksturtos Latvijā ligzdojošās populācijas īpatsvars (`Populacija_LV`) no Eiropas populāicjas (`Populacija_Eiropa`);

- `Parmainas_proc`, kurā norādīts populācijas pārmaiņu apjoms (izteikts procentos). Kad iespējams, izmantots īstermiņa pārmaiņu punkta vērtējums Latvijā; kad tas nebija pieejams, tas aprēķināts no intervāla robežām. Ja nebija pieejams īstermiņa pārmaiņu vērtējums, izmantots iltermiņa vērtētjums ar to pašu pieeju. Vienai sugai (kuitalai) nebija pieejami Latvijas populācijas pārmaiņu vērtējumi, tādēļ izmantots Igaunijas ziņotais;

- `Parmainu_periods`, kurā raksturots izmantotā populācijas pārmaiņu apjoma (`Parmainas_proc`) aprēķinu periods;

- `Parmainu_gadi`, kurā raksturots pārmaiņu ilgums, kas nepieciešams multiplikatīvā pārmaiņu rādītāja aprēķināšanai;

- `Valsts`, kurā raksturota valsts, kuras dati populācijas pārmaiņu raksturošanai;

- `Parmainas_mult`, kurā ievietots aprēķinātais eksponenciālo populāicja spārmaiņu raksturojums. Aprēķiniem izmantota formula $(\frac{100+\Delta}{100})^\frac{1}{T},$ kur $\Delta$ ir populācijas pārmaiņu apjoms un $T$ ir pārmaiņu ilgums gados.

### Mūža reproduktīvais ieguldījums {#Chapter1.4.2}

Pilnvērtīgam mūža reproduktīvā ieguldījuma aprēķinam būtu nepieciešama vismaz informācija  par individiem raksturīgo reproduktīvā mūža ilgumu, izdēto olu skaitu, izšķīlušos un izvesto mazuļu skaitu, varbūtību tiem sasniegt ligzdošanas uzsākšanas vecumu un varbūtību ligzdot ik gadu turpmāk. Diemžēl visa šī informācija nav pieejama par katru no sugām, tādēļ izvēlēta apkopojoša pieeja, kur izmantojot vispārīgo informāicju un monitoringu rezultātus, apkopots minimālais informācijas apjoms ik ligzdošanas iecirkņa (kuru aizsardzības plānošanai šis tiek darīts) atšķirību starp sugām indikāciju raksturošanai. Zemāk skaidrota apkopotā informācija (datu tabulas lauki):

- `Paaudzes_garums`, kurā norādīts sugai raksturīgais dzīves ilgums (dzīves gados). Informāicja iegūta no *BirdLife International* *European Red List of Birds* (http://datazone.birdlife.org/info/euroredlist2021) [skatīts: 2023-10-08];

- `Pirmas_ligzdosanas_vecums`, kurā raksturots pirmās ligzdošanass vecums (kalendārais gads). Informācija apkopota no [@KrampisVol1], [@KrampisVol2], [@KrampisVol3], [@KrampisVol4], [@KrampisVol5], [@KrampisVol6], [@KrampisVol7], [@KrampisVol8], [@KrampisVol9]. Atsevišķos gadījumos šī informācija izmantotajos avotos nebija pieejama, tad tā pielīdzināta no ekoloģiski un pēc dzīves ilguma līdzīgajām sugām, kas skaidrots saistītajā laukā `Vecuma_piezimes`;

- `Vecuma_piezimes`, kurā skaidroti apsvērumi pieņemtajam lirmās ligzdošanas vecumam, kad tas nav norādīts izmantotajos literatūras avotos. Saistīts ar lauku `Pirmas_ligzdosanas_vecums`;

- `Olu_skaits`, kurā norādīts raksturīgais vidējais izdēto olu skaits. Visbiežāk informācija apkopota no [@KrampisVol1], [@KrampisVol2], [@KrampisVol3], [@KrampisVol4], [@KrampisVol5], [@KrampisVol6], [@KrampisVol7], [@KrampisVol8], [@KrampisVol9]. Atsevišķos gadījumos izmantoti citi avoti, kas individuāli norādīti sekojošajā laukā (`Avots`), šie avoti ir: [@NumResp_2023], [@SomuPlesi], [@Lipsis2011].

- `Avots`, kurā norādīts olu skaita informācijas avots, saistībā ar lauka `Olu_skaits` skaidrojumu;

- `Dejumu_skaits`, kurā norādīts sugai raksturīgais dējumu skaits (sekojot prioritātēm, kas aprakstītas nodaļā [Ligzdošanas sezona](#Chapter1.3.2)), neieskaitot aizvietojošos dējumus.


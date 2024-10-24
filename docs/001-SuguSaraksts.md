# Sugu saraksts un pamata apraksti  {#Chapter1}

Šajā nodaļā sniegts analīzei izvēlēto sugu saraksta pamatojums un demonstrēta informācijas apkopošanas gaita sugu bioloģijas un ekoloģijas aprakstiem, kas tālāk izmantoti modelēšanā.

Saskaņā ar projekta pieteikumu, uzdevums ir izstrādāt vismaz 70 slāņus ar dzīvotņu piemērotības analīzes rezultātiem. Sākotnēji analīzei izvēlēto sugu loks ir 116, lai samazinātu spriedzi ap ik sugas rezultāta uzticamību un pielietojamību mērķim.

## Analizējamo sugu izvēle

No 375 Latvijā jebkad konstatētajām putnu sugām [@PutniLV], 335 ir uzskatāmas par (šobrīd vai vismaz vienu desmitgadi kopš 1900. gada) ligzdotājām [@Avotins_etal_2024a:LfS_Conference]. Tomēr tas nebūt nenozīmē, ka visām par ligzdotājām uzskatāmajām putnu sugām ir pieejami dati (un projektam - resursi) modelēšanai. Tādēļ vaikta tālāka sugu atlase.

No visām ligzdojošo putnu sugām atlasītas jeb modelēšanai paredzētas:

1. Putnu Direktīvas 1. pielikumā iekļautās sugas;

2. Latvijā šobrīd aizsargājamās vai Life for Species projektā [@LifeForSpecies] par aizsargākajām klasificētās;

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


Table: (\#tab:SuguIzvele)Sākotnējais sugu saraksts (BirdLife International 2023. gada nomenklatūras saraksta numurs; sugas kods; atbilstība iekļaušanas kritērijiem un 1 km kvadrātu, kuros projektā Life for Species atlasē saglabājusies sugas klātbūtne, skaits)

| Numurs|Kods   |Nosaukums                                | Putnu Direktīvas 1. pielikums| Aizsargājama suga| Apdraudēta suga| Biotopu rokasgrāmatas suga| BVZ indikatorsuga| Lauku putnu indekss| Meža putnu ikdekss| Aizsardzības plāns| Kvadrāti|
|------:|:------|:----------------------------------------|-----------------------------:|-----------------:|---------------:|--------------------------:|-----------------:|-------------------:|------------------:|------------------:|--------:|
|      1|COTCOT |paipala Coturnix coturnix                |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      349|
|      2|PERPER |laukirbe Perdix perdix                   |                            NA|                 1|              NA|                         NA|                NA|                  NA|                 NA|                 NA|      612|
|      3|BONBON |mežirbe Bonasa bonasia                   |                             1|                 1|               1|                          1|                NA|                  NA|                  1|                 NA|     1917|
|      5|TETURO |mednis Tetrao urogallus                  |                             1|                 1|               1|                          1|                NA|                  NA|                 NA|                 NA|      487|
|      6|LYRTET |rubenis Lyrurus tetrix                   |                             1|                NA|               1|                         NA|                 1|                  NA|                 NA|                 NA|     1180|
|      9|CYGCYG |ziemeļu gulbis Cygnus cygnus             |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     1365|
|     15|ANSANS |meža zoss Anser anser                    |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      222|
|     32|TADTAD |Sāmsalas dižpīle Tadorna tadorna         |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      278|
|     35|AYTFER |brūnkaklis Aythya ferina                 |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      138|
|     37|AYTFUL |cekulpīle Aythya fuligula                |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      212|
|     39|SPAQUE |prīkšķe Spatula querquedula              |                            NA|                 1|               1|                         NA|                 1|                  NA|                 NA|                 NA|      174|
|     40|SPACLY |platknābis Spatula clypeata              |                            NA|                 1|               1|                         NA|                 1|                  NA|                 NA|                 NA|       96|
|     41|MARSTR |pelēkā pīle Mareca strepera              |                            NA|                 1|               1|                         NA|                 1|                  NA|                 NA|                 NA|      152|
|     42|MARPEN |baltvēderis Mareca penelope              |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       75|
|     46|TACRUF |mazais dūkuris Tachybaptus ruficollis    |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|      125|
|     47|PODGRI |pelēkvaigu dūkuris Podiceps grisegena    |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      179|
|     48|PODCRI |cekuldūkuris Podiceps cristatus          |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     1155|
|     54|STRTUR |parastā ūbele Streptopelia turtur        |                            NA|                 1|               1|                         NA|                NA|                   1|                 NA|                 NA|      607|
|     58|CAPEUR |vakarlēpis Caprimulgus europaeus         |                             1|                 1|              NA|                         NA|                NA|                  NA|                 NA|                 NA|     1269|
|     61|RALAQU |dumbrcālis Rallus aquaticus              |                            NA|                NA|              NA|                         NA|                 1|                  NA|                 NA|                 NA|      261|
|     62|CRECRE |grieze Crex crex                         |                             1|                 1|               1|                         NA|                 1|                   1|                 NA|                 NA|     4270|
|     63|PORPOR |ormanītis Porzana porzana                |                             1|                 1|              NA|                         NA|                 1|                  NA|                 NA|                 NA|      165|
|     64|ZAPPAR |mazais ormanītis Zapornia parva          |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      114|
|     67|FULATR |laucis Fulica atra                       |                            NA|                 1|              NA|                         NA|                NA|                  NA|                 NA|                 NA|      705|
|     68|GRUGRU |dzērve Grus grus                         |                             1|                 1|              NA|                         NA|                NA|                  NA|                 NA|                 NA|     5115|
|     78|CICNIG |melnais stārķis Ciconia nigra            |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      255|
|     79|CICCIC |baltais stārķis Ciconia ciconia          |                             1|                 1|              NA|                         NA|                 1|                   1|                 NA|                 NA|    10648|
|     82|BOTSTE |lielais dumpis Botaurus stellaris        |                             1|                 1|               1|                          1|                NA|                  NA|                 NA|                 NA|      592|
|     83|IXOMIN |mazais dumpis Ixobrychus minutus         |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       24|
|     95|HAEOST |jūrasžagata Haematopus ostralegus        |                            NA|                 1|               1|                          1|                 1|                  NA|                 NA|                 NA|      103|
|     99|PLUAPR |dzeltenais tārtiņš Pluvialis apricaria   |                             1|                 1|               1|                         NA|                 1|                  NA|                 NA|                 NA|      210|
|    102|CHAHIA |smilšu tārtiņš Charadrius hiaticula      |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       59|
|    103|CHADUB |upes tārtiņš Charadrius dubius           |                            NA|                NA|               1|                          1|                NA|                  NA|                 NA|                 NA|      604|
|    106|VANVAN |ķīvīte Vanellus vanellus                 |                            NA|                 1|               1|                          1|                 1|                   1|                 NA|                 NA|     4284|
|    107|NUMPHA |lietuvainis Numenius phaeopus            |                            NA|                 1|               1|                          1|                NA|                  NA|                 NA|                 NA|       44|
|    108|NUMARQ |kuitala Numenius arquata                 |                            NA|                 1|               1|                          1|                 1|                  NA|                 NA|                 NA|      171|
|    110|LIMLIM |melnā puskuitala Limosa limosa           |                            NA|                 1|               1|                          1|                 1|                  NA|                 NA|                 NA|       43|
|    124|GALMED |ķikuts Gallinago media                   |                             1|                 1|               1|                         NA|                 1|                  NA|                 NA|                 NA|       43|
|    125|GALGAL |mērkaziņa Gallinago gallinago            |                            NA|                NA|              NA|                          1|                 1|                  NA|                 NA|                 NA|     2000|
|    133|TRINEB |lielā tilbīte Tringa nebularia           |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       25|
|    134|TRITOT |pļavu tilbīte Tringa totanus             |                            NA|                 1|               1|                         NA|                 1|                  NA|                 NA|                 NA|      172|
|    135|TRIGLA |purva tilbīte Tringa glareola            |                             1|                 1|               1|                          1|                NA|                  NA|                 NA|                 NA|      188|
|    174|GLAPAS |apodziņš Glaucidium passerinum           |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                  1|      889|
|    176|AEGFUN |bikšainais apogs Aegolius funereus       |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                  1|      129|
|    178|ASIOTU |ausainā pūce Asio otus                   |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                  1|      486|
|    180|STRALU |meža pūce Strix aluco                    |                            NA|                NA|              NA|                         NA|                NA|                  NA|                 NA|                  1|     2669|
|    181|STRURA |urālpūce Strix uralensis                 |                             1|                 1|              NA|                         NA|                NA|                  NA|                 NA|                  1|      582|
|    184|BUBBUB |ūpis Bubo bubo                           |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                  1|       33|
|    185|PANHAL |zivjērglis Pandion haliaetus             |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      501|
|    187|PERAPI |ķīķis Pernis apivorus                    |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      850|
|    191|CLAPOM |mazais ērglis Clanga pomarina            |                             1|                NA|              NA|                         NA|                 1|                  NA|                 NA|                 NA|     1953|
|    197|CIRAER |niedru lija Circus aeruginosus           |                             1|                 1|               1|                          1|                NA|                  NA|                 NA|                 NA|     1950|
|    201|ACCNIS |zvirbuļvanags Accipiter nisus            |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|      792|
|    202|ACCGEN |vistu vanags Accipiter gentilis          |                            NA|                 1|               1|                         NA|                NA|                  NA|                  1|                 NA|      679|
|    203|HALALB |jūras ērglis Haliaeetus albicilla        |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      505|
|    204|MILMIL |sarkanā klija Milvus milvus              |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       75|
|    205|MILMIG |melnā klija Milvus migrans               |                             1|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|      125|
|    207|BUTBUT |peļu klijāns Buteo buteo                 |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     5323|
|    208|UPUEPO |pupuķis Upupa epops                      |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|      853|
|    210|CORGAR |zaļā vārna Coracias garrulus             |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       66|
|    212|JYNTOR |tītiņš Jynx torquilla                    |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     1292|
|    213|PICCAN |pelēkā dzilna Picus canus                |                             1|                 1|              NA|                         NA|                NA|                  NA|                  1|                  1|     2038|
|    215|DRYMAR |melnā dzilna Dryocopus martius           |                             1|                 1|              NA|                          1|                NA|                  NA|                  1|                  1|     4234|
|    216|PICTRI |trīspirkstu dzenis Picoides tridactylus  |                             1|                 1|               1|                          1|                NA|                  NA|                  1|                  1|      233|
|    217|LEIMED |vidējais dzenis Leiopicus medius         |                             1|                 1|              NA|                         NA|                NA|                  NA|                  1|                  1|     1853|
|    218|DRYMIN |mazais dzenis Dryobates minor            |                            NA|                 1|               1|                         NA|                NA|                  NA|                  1|                  1|     1458|
|    219|DENLEU |baltmugurdzenis Dendrocopos leucotos     |                             1|                 1|              NA|                          1|                NA|                  NA|                  1|                  1|     1273|
|    220|DENMAJ |dižraibais dzenis Dendrocopos major      |                            NA|                NA|              NA|                         NA|                NA|                  NA|                 NA|                  1|     7064|
|    221|FALTIN |lauku piekūns Falco tinnunculus          |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      325|
|    223|FALCOL |purva piekūns Falco columbarius          |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       56|
|    228|ORIORI |vālodze Oriolus oriolus                  |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|     3320|
|    229|LANCOL |brūnā čakste Lanius collurio             |                             1|                 1|               1|                         NA|                 1|                   1|                 NA|                 NA|     3623|
|    233|LANEXC |lielā čakste Lanius excubitor            |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      492|
|    237|NUCCAR |riekstrozis Nucifraga caryocatactes      |                            NA|                 1|               1|                         NA|                NA|                  NA|                  1|                 NA|      608|
|    242|PERATE |meža zīlīte Periparus ater               |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     2475|
|    243|LOPCRI |cekulzīlīte Lophophanes cristatus        |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     3292|
|    244|POEPAL |purva zīlīte Poecile palustris           |                            NA|                 1|               1|                         NA|                NA|                  NA|                  1|                 NA|     2465|
|    245|POEMON |pelēkā zīlīte Poecile montanus           |                            NA|                 1|               1|                         NA|                NA|                  NA|                  1|                 NA|     3278|
|    252|LULARB |sila cīrulis Lullula arborea             |                             1|                 1|              NA|                          1|                NA|                  NA|                 NA|                 NA|     2747|
|    253|ALAARV |lauku cīrulis Alauda arvensis            |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     7409|
|    256|IDUCAL |klusais ķauķis Iduna caligata            |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|       85|
|    261|ACRRIS |purva ķauķis Acrocephalus palustris      |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     2842|
|    264|ACRARU |niedru strazds Acrocephalus arundinaceus |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|     1538|
|    268|LOCFLU |upes ķauķis Locustella fluviatilis       |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     1659|
|    269|LOCNAE |kārklu ķauķis Locustella naevia          |                            NA|                 1|               1|                         NA|                NA|                   1|                 NA|                 NA|     1492|
|    272|HIRRUS |bezdelīga Hirundo rustica                |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     4224|
|    274|PHYSIB |svirlītis Phylloscopus sibilatrix        |                            NA|                NA|               1|                         NA|                NA|                  NA|                  1|                 NA|     5918|
|    284|AEGCAU |garastīte Aegithalos caudatus            |                            NA|                NA|               1|                         NA|                NA|                  NA|                  1|                 NA|     1414|
|    288|CURNIS |svītrainais ķauķis Curruca nisoria       |                             1|                 1|              NA|                         NA|                NA|                  NA|                 NA|                 NA|      385|
|    290|CURCOM |brūnspārnu ķauķis Curruca communis       |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     6415|
|    292|CERFAM |mizložņa Certhia familiaris              |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     3425|
|    293|SITEUR |dzilnītis Sitta europaea                 |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|     5063|
|    296|STUVUL |mājas strazds Sturnus vulgaris           |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     6633|
|    299|TURVIS |sila strazds Turdus viscivorus           |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     3075|
|    301|TURILI |plukšķis Turdus iliacus                  |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     1115|
|    308|CYASVE |zilrīklīte Cyanecula svecica             |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|       77|
|    309|LUSLUS |lakstīgala Luscinia luscinia             |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|     4529|
|    313|FICPAR |mazais mušķērājs Ficedula parva          |                             1|                 1|               1|                         NA|                NA|                  NA|                  1|                 NA|     2415|
|    314|FICHYP |melnais mušķērājs Ficedula hypoleuca     |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     4072|
|    318|SAXRUB |lukstu čakstīte Saxicola rubetra         |                            NA|                 1|               1|                         NA|                NA|                   1|                 NA|                 NA|     5301|
|    324|REGREG |zeltgalvītis Regulus regulus             |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     4246|
|    325|REGIGN |sārtgalvītis Regulus ignicapilla         |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|      523|
|    330|PASMON |lauku zvirbulis Passer montanus          |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     3441|
|    333|ANTPRA |pļavu čipste Anthus pratensis            |                            NA|                NA|              NA|                         NA|                 1|                   1|                 NA|                 NA|     2143|
|    337|ANTCAM |stepes čipste Anthus campestris          |                             1|                 1|               1|                          1|                 1|                  NA|                 NA|                 NA|      162|
|    338|MOTFLA |dzeltenā cielava Motacilla flava         |                            NA|                 1|               1|                         NA|                 1|                   1|                 NA|                 NA|     1393|
|    340|MOTCIT |citroncielava Motacilla citreola         |                            NA|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      100|
|    344|COCCOC |dižknābis Coccothraustes coccothraustes  |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     2010|
|    345|CARERY |mazais svilpis Carpodacus erythrinus     |                            NA|                 1|              NA|                         NA|                 1|                   1|                 NA|                 NA|     3949|
|    347|PYRPYR |svilpis Pyrrhula pyrrhula                |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|     3323|
|    348|CHLCHL |zaļžubīte Chloris chloris                |                            NA|                NA|               1|                         NA|                NA|                  NA|                 NA|                 NA|     4350|
|    350|LINCAN |kaņepītis Linaria cannabina              |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     2007|
|    353|LOXCUR |egļu krustknābis Loxia curvirostra       |                            NA|                NA|              NA|                         NA|                NA|                  NA|                  1|                 NA|      640|
|    355|CARCAR |dadzītis Carduelis carduelis             |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     4212|
|    362|EMBHOR |dārza stērste Emberiza hortulana         |                             1|                 1|               1|                         NA|                NA|                  NA|                 NA|                 NA|      117|
|    363|EMBCIT |dzeltenā stērste Emberiza citrinella     |                            NA|                NA|              NA|                         NA|                NA|                   1|                 NA|                 NA|     9517|



## Pamata apraksti analīzei

Ligzdošanas iecirkņa izmērs un ekosistēma


## Pamata apraksti novērojumu atlasei

Ligzdošanas sezona un zemes seguma un lietojuma veidi


## Pamata apraksti starpsugu svarošanai


### Populācijas lielums un pārmaiņas {-}


### Mūža reproduktīvais ieguldījums {-}




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
analīzes ietvarā. Analīzes gaita, parametrizācijas pieejas un pieņemtie lēmumi ar 
ieviešanas procedūru (komandu rindām) ir raksturoti šīs nodaļas [Modeļa parametrizācija, izvēle un izvērtēšanas apraksti](#Chapter7.2) 
apakšnodaļā. Šīs procedūras ietvaros, izvēlēts modelis, kurš vislabāk spēj raksturot 
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

VIF analīze un individuāla pārskatīšana vai netrūkst kaut kas sevišķi nozīmīgs

### Multikolinearitāte  {#Chapter7.1.1}

VIF$le$10

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




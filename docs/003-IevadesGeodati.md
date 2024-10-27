# Ievades ģeodati  {#Chapter3}

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## Ievades jēldati {#Chapter3.1}

a

### Meža Valsts reģistrs {#Chapter3.1.1}

b

### Lauku atbalsts dienesta lauku informācija {#Chapter3.1.2}

c

### LĢIA topogrāfiskā karte {#Chapter3.1.3}

d

### MKIS {#Chapter3.1.4}

e

### LVM atvērtie dati {#Chapter3.1.5}

f

### Corine Land Cover {#Chapter3.1.6}

g

### Sentinel-2 {#Chapter3.1.7}

h

### *Dynamic World* {#Chapter3.1.8}

i

### *Global Forest Watch* {#Chapter3.1.9}

j

### Palsar Tree cover {#Chapter3.1.10}

k

### ERA-5 Land {#Chapter3.1.11}

l

### Augsnes auglīgums {#Chapter3.1.12}

m

### Digitālie reljefa modeļi {#Chapter3.1.13}

n


## Ievades produkti {#Chapter3.2}

o

### Reljefs {#Chapter3.2.1}

p

### Klimats {#Chapter3.2.2}

r

### Satelītindeksi {#Chapter3.2.3}

s

### Augsne {#Chapter3.2.4}

t

### Ainava {#Chapter3.2.5}

u

### Ceļi {#Chapter3.2.6}

v

### Eiklīda distances {#Chapter3.2.7}

z

### Malas {#Chapter3.2.8}

aa

### Ūdeņi {#Chapter3.2.9}

ab

### Lauksaimniecībā izmantojamās zemes {#Chapter3.2.10}

ac

### Meži {#Chapter3.2.11}

ad

## Vides pārmaiņas {#Chapter3.3}

Vides pārmaiņas nepieciešamas novērojumu filtrēšanai. Daļēji tās būtu iegūstamas no [Meža Valsts reģistrs](#Chapter3.1.1) un [LAD lauku informācija](#Chapter3.1.2) datiem, tomēr projekta darba grupā nav pieejami ik gada raksturojumi (1) un šīs datubāzes neaptver visu valsts teritoriju (2), tādēļ nepieciešams neatkarīgs vērtējums. Tāda izstrādāšanai izmantojām [*Dynamic World* izpēte](#Chapter4) aprīļa līdz augusta ik gadam no 2017. līdz 2023. rezultātus un [*Global Forest Watch*](#Chapter3.1.9) datus, raksturojot pārmaiņu apjomus analīzes šūnā (nodaļa [100 m režģis Latvijā](#Chapter2.1)) un putnu ligzdošanas iecirkņu rādiusu grupu (\@ref(fig:AinavTelpas) att.) buferos ap analīzes šūnu centriem.


Saskaņā ar [*Dynamic World* izpēte](#Chapter4) rezultātiem, ir vērts izmantot šo resursu vides kopējo pārmaiņu analīzē kopš 2017. gada. Par kopējām pārmaiņām uzskatīta jebkura izmaiņa Dynamic World klasē, to salīdzinot ik 10 m pikselim aprīļa-augusta sezonā starp katriem diviem secīgiem gadiem. Pārmaiņu apjoms raksturots kā platības īpatsvars 100 m šūnā vai putnu ligzdošanas iecirkņu rādiusu grupu buferos ap šīs šūnas centru. Tā kā pārmaiņas analizētas vienos un tajos pašos rastros, izmantojot dažādus laukumveida objektus, kurus nepieciešams apvienot vienā failā, katras ģeometrijas raksturojums iestrādāts lauku nosaukumos.

Kopumā līdzīga procedūra veikta koku vainagu seguma izzušanas apjoma (īpatsvara no telpas kopumā) raksturošanai. Tomēr šī informācija ir iestrādāta vienā rastra slānī, notikuma gadu norādot kā pikseļa vērtību. Tas ikgadējā samazinājuma apjoma aprēķināšanu apgrūtina, tomēr nepadara par neiespējamu (skatīt komandu rindas zemāk, specifiski - funkciju `darbiba`). Līdz ar ik gadu zudušā koku vainagu seguma īpatsvara no analīzes telpas platības iegūšanu, tā pievienota analizētajai ģeometrijai kā atsevišķs lauks katram notikuma gadam. Tāpat kā iepriekš - lauku nosaukumi harmonizēti, tajos iestrādājot analīzes telpas raksturojumu, un rezultāti pievienoti 100 m režģa atbilstošajām šūnām.



```r
# libs
if(!require(terra)) {install.packages("terra"); require(terra)}
if(!require(sf)) {install.packages("sf"); require(sf)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(arrow)) {install.packages("arrow"); require(arrow)}
if(!require(sfarrow)) {install.packages("sfarrow"); require(sfarrow)}
if(!require(exactextractr)){install.packages("exactextractr");require(exactextractr)}
if(!require(foreach)) {install.packages("foreach"); require(foreach)}
if(!require(doParallel)) {install.packages("doParallel"); require(doParallel)}


# režģis un buferi
lapas_tikls=data.frame(fails_c=list.files("./lapas/"))
lapas_tikls$cels_grid=paste0("./lapas/",lapas_tikls$fails_c)
lapas_tikls$lapa=substr(lapas_tikls$fails,10,13)
lapas_radiusi=data.frame(fails_r=list.files("./lapas/"))
lapas_radiusi$cels_radiuss=paste0("./lapas/",lapas_radiusi$fails_r)
lapas_radiusi=separate(lapas_radiusi,fails_r,
                       into=c("sakums","veids","lapa","beigas"),remove = FALSE)

lapas_r500=lapas_radiusi %>% 
  filter(veids=="r500") %>% 
  mutate(fails_r500=fails_r,
         cels_r500=cels_radiuss) %>% 
  dplyr::select(-sakums,-beigas,-fails_r,-cels_radiuss,-veids)

lapas_r1250=lapas_radiusi %>% 
  filter(veids=="r1250") %>% 
  mutate(fails_r1250=fails_r,
         cels_r1250=cels_radiuss) %>% 
  dplyr::select(-sakums,-beigas,-fails_r,-cels_radiuss,-veids)

lapas_r3000=lapas_radiusi %>% 
  filter(veids=="r3000") %>% 
  mutate(fails_r3000=fails_r,
         cels_r3000=cels_radiuss) %>% 
  dplyr::select(-sakums,-beigas,-fails_r,-cels_radiuss,-veids)

lapas=lapas_tikls %>% 
  left_join(lapas_r500) %>% 
  left_join(lapas_r1250) %>% 
  left_join(lapas_r3000)

# vides rastri
tcl=rast("./TreeCoverLossYear.tif")
tcl2=ifel(tcl<17,NA,tcl) # Zudumi tikai kopš 2017. gada
writeRaster(tcl2,"./KokuVainagiem.tif")

dw17=rast("./DW_2017_apraug.tif") 
dw18=rast("./DW_2018_apraug.tif")
dw19=rast("./DW_2019_apraug.tif")
dw20=rast("./DW_2020_apraug.tif")
dw21=rast("./DW_2021_apraug.tif")
dw22=rast("./DW_2022_apraug.tif")
dw23=rast("./DW_2023_apraug.tif")

chDWa=ifel(dw17==dw18,0,1) # Pārmaiņas no 2017. uz 2018. gadu
writeRaster(chDWa,"./chDWa.tif")
chDWb=ifel(dw18==dw19,0,1) # Pārmaiņas no 2018. uz 2019. gadu
writeRaster(chDWb,"./chDWb.tif")
chDWc=ifel(dw19==dw20,0,1) # Pārmaiņas no 2019. uz 2020. gadu
writeRaster(chDWc,"./chDWc.tif")
chDWd=ifel(dw20==dw21,0,1) # Pārmaiņas no 2020. uz 2021. gadu
writeRaster(chDWd,"./chDWd.tif")
chDWe=ifel(dw21==dw22,0,1) # Pārmaiņas no 2021. uz 2022. gadu
writeRaster(chDWe,"./chDWe.tif")
chDWf=ifel(dw22==dw23,0,1) # Pārmaiņas no 2022. uz 2023. gadu
writeRaster(chDWf,"./chDWf.tif")
plot(chDWf)

# pārmaiņu analīze
soli=levels(factor(lapas$lapa))

cl <- makeCluster(12) # jānorāda izmantojamo kodolu (fizisko) skaits
registerDoParallel(cl)

foreach(i = 1:length(soli)) %dopar% {
  library(terra)
  library(sf)
  library(tidyverse)
  library(arrow)
  library(sfarrow)
  library(exactextractr)
  
  # funkcija platībaīpatsvarā kurā noticis koku vainagu seguma zudums
  # noteikšanai katrā gadā (2017-2023)
  darbiba <- function(raster, vector) {
    exact_extract(raster, vector, function(value, coverage_fraction) {
      data.frame(value = value,
                 frac = coverage_fraction/sum(coverage_fraction,na.rm = TRUE)) %>%
        arrange(value) %>% 
        group_by(value) %>%
        summarize(freq = sum(frac, na.rm = TRUE), .groups = 'drop') %>%
        pivot_wider(names_from = 'value',
                    names_prefix = 'freq_',
                    values_from = 'freq')
    }) %>%
      mutate(across(starts_with('freq'), ~replace_na(., 0)))
  }
  
  # darba lapas
  solis=soli[i]
  celi=lapas %>% filter(lapa==solis)
  
  # poligonu ielasīšana
  sunas=st_read_parquet(celi$cels_grid)
  sunas=sunas %>% dplyr::select(id,yes,tks50km,X,Y)
  r500=st_read_parquet(celi$cels_r500)
  r500=r500 %>% dplyr::select(id,yes,tks50km,X,Y)
  r1250=st_read_parquet(celi$cels_r1250)
  r1250=r1250 %>% dplyr::select(id,yes,tks50km,X,Y)
  r3000=st_read_parquet(celi$cels_r3000)
  r3000=r3000 %>% dplyr::select(id,yes,tks50km,X,Y)
  
  # konkrētās darba lapas robežas
  telpa=st_as_sfc(st_bbox(r3000))
  telpa2=st_buffer(telpa,dist=1000)
  
  # koku vainagu seguma pārmaiņas
  tcl2=rast("./KokuVainagiem.tif")
  tcl_telpa=crop(tcl2,telpa2)
  
  loss_cell=darbiba(tcl_telpa, sunas)
  sunas=cbind(sunas,loss_cell)
  loss_r500=darbiba(tcl_telpa, r500)
  r500=cbind(r500,loss_r500)
  loss_r1250=darbiba(tcl_telpa, r1250)
  r1250=cbind(r1250,loss_r1250)
  loss_r3000=darbiba(tcl_telpa, r3000)
  r3000=cbind(r3000,loss_r3000)
  
  # Vides pārmaiņas Dynamic World datos
  chDWa=rast("./chDWa.tif")
  chDWb=rast("./chDWb.tif")
  chDWc=rast("./chDWc.tif")
  chDWd=rast("./chDWd.tif")
  chDWe=rast("./chDWe.tif")
  chDWf=rast("./chDWf.tif")
  
  names(chDWa)="DWchange_1718"
  names(chDWb)="DWchange_1819"
  names(chDWc)="DWchange_1920"
  names(chDWd)="DWchange_2021"
  names(chDWe)="DWchange_2122"
  names(chDWf)="DWchange_2223"
  
  mazs_chDWa=crop(chDWa,telpa2)
  mazs_chDWb=crop(chDWb,telpa2)
  mazs_chDWc=crop(chDWc,telpa2)
  mazs_chDWd=crop(chDWd,telpa2)
  mazs_chDWe=crop(chDWe,telpa2)
  mazs_chDWf=crop(chDWf,telpa2)
  
  mazas_DW=raster::stack(c(mazs_chDWa,mazs_chDWb,mazs_chDWc,
                           mazs_chDWd,mazs_chDWe,mazs_chDWf))
  
  sunam=exact_extract(mazas_DW,sunas,"mean")
  r500am=exact_extract(mazas_DW,r500,"mean")
  r1250am=exact_extract(mazas_DW,r1250,"mean")
  r3000am=exact_extract(mazas_DW,r3000,"mean")
  
  # iegūto rezultātu apvienošana
  sunas=cbind(sunas,sunam)
  r500=cbind(r500,r500am)
  r1250=cbind(r1250,r1250am)
  r3000=cbind(r3000,r3000am)
  
  # rezultējošo failu saglabāšana
  st_write_parquet(sunas,celi$cels_grid)
  st_write_parquet(r500,celi$cels_r500)
  st_write_parquet(r1250,celi$cels_r1250)
  st_write_parquet(r3000,celi$cels_r3000)
}
stopCluster(cl)

# darba lapu apvienošana
pirmas_sunas=sfarrow::st_read_parquet(lapas$cels_grid[lapas$lapa==soli[1]])
pirmas_r500=sfarrow::st_read_parquet(lapas$cels_r500[lapas$lapa==soli[1]])
pirmas_r1250=sfarrow::st_read_parquet(lapas$cels_r1250[lapas$lapa==soli[1]])
pirmas_r3000=sfarrow::st_read_parquet(lapas$cels_r3000[lapas$lapa==soli[1]])

dati_c=pirmas_sunas
dati_r500=pirmas_r500
dati_r1250=pirmas_r1250
dati_r3000=pirmas_r3000

for(i in 2:length(soli)){
  solis=soli[i]
  nakosas_sunas=sfarrow::st_read_parquet(lapas$cels_grid[lapas$lapa==solis])
  nakosas_r500=sfarrow::st_read_parquet(lapas$cels_r500[lapas$lapa==solis])
  nakosas_r1250=sfarrow::st_read_parquet(lapas$cels_r1250[lapas$lapa==solis])
  nakosas_r3000=sfarrow::st_read_parquet(lapas$cels_r3000[lapas$lapa==solis])
  
  dati_c=bind_rows(dati_c,nakosas_sunas)
  dati_r500=bind_rows(dati_r500,nakosas_sunas)
  dati_r1250=bind_rows(dati_r1250,nakosas_sunas)
  dati_r3000=bind_rows(dati_r3000,nakosas_sunas)
}

# apvienoto lapu saglabāšana
st_write_parquet(dati_c,"./VidesParmainas_suna.parquet")
st_write_parquet(dati_r500,"./VidesParmainas_r500.parquet")
st_write_parquet(dati_r1250,"./VidesParmainas_r1250.parquet")
st_write_parquet(dati_r3000,"./VidesParmainas_r3000.parquet")

# lauku nosaukumu harmonizēšana
dati_c2=dati_c %>% 
  mutate(cell_TCLNaN=freq_NaN,
         cell_TCL17=freq_17,
         cell_TCL18=freq_18,
         cell_TCL19=freq_19,
         cell_TCL20=freq_20,
         cell_TCL21=freq_21,
         cell_TCL22=freq_22,
         cell_TCL23=freq_23,
         cell_DWchange1718=mean.DWchange_1718,
         cell_DWchange1819=mean.DWchange_1819,
         cell_DWchange1920=mean.DWchange_1920,
         cell_DWchange2021=mean.DWchange_2021,
         cell_DWchange2122=mean.DWchange_2122,
         cell_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,yes,tks50km,X,Y,
                cell_TCLNaN,cell_TCL17,cell_TCL18,cell_TCL19,cell_TCL20,
                cell_TCL21,cell_TCL22,cell_TCL23,
                cell_DWchange1718,cell_DWchange1819,cell_DWchange1920,
                cell_DWchange2021,cell_DWchange2122,cell_DWchange2223)

dati_r500a=data.frame(dati_r500) %>% 
  mutate(r500_TCLNaN=freq_NaN,
         r500_TCL17=freq_17,
         r500_TCL18=freq_18,
         r500_TCL19=freq_19,
         r500_TCL20=freq_20,
         r500_TCL21=freq_21,
         r500_TCL22=freq_22,
         r500_TCL23=freq_23,
         r500_DWchange1718=mean.DWchange_1718,
         r500_DWchange1819=mean.DWchange_1819,
         r500_DWchange1920=mean.DWchange_1920,
         r500_DWchange2021=mean.DWchange_2021,
         r500_DWchange2122=mean.DWchange_2122,
         r500_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,
                r500_TCLNaN,r500_TCL17,r500_TCL18,r500_TCL19,r500_TCL20,
                r500_TCL21,r500_TCL22,r500_TCL23,
                r500_DWchange1718,r500_DWchange1819,r500_DWchange1920,
                r500_DWchange2021,r500_DWchange2122,r500_DWchange2223)

dati_r1250a=data.frame(dati_r1250) %>% 
  mutate(r1250_TCLNaN=freq_NaN,
         r1250_TCL17=freq_17,
         r1250_TCL18=freq_18,
         r1250_TCL19=freq_19,
         r1250_TCL20=freq_20,
         r1250_TCL21=freq_21,
         r1250_TCL22=freq_22,
         r1250_TCL23=freq_23,
         r1250_DWchange1718=mean.DWchange_1718,
         r1250_DWchange1819=mean.DWchange_1819,
         r1250_DWchange1920=mean.DWchange_1920,
         r1250_DWchange2021=mean.DWchange_2021,
         r1250_DWchange2122=mean.DWchange_2122,
         r1250_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,
                r1250_TCLNaN,r1250_TCL17,r1250_TCL18,r1250_TCL19,r1250_TCL20,
                r1250_TCL21,r1250_TCL22,r1250_TCL23,
                r1250_DWchange1718,r1250_DWchange1819,r1250_DWchange1920,
                r1250_DWchange2021,r1250_DWchange2122,r1250_DWchange2223)


dati_r3000a=data.frame(dati_r3000) %>% 
  mutate(r3000_TCLNaN=freq_NaN,
         r3000_TCL17=freq_17,
         r3000_TCL18=freq_18,
         r3000_TCL19=freq_19,
         r3000_TCL20=freq_20,
         r3000_TCL21=freq_21,
         r3000_TCL22=freq_22,
         r3000_TCL23=freq_23,
         r3000_DWchange1718=mean.DWchange_1718,
         r3000_DWchange1819=mean.DWchange_1819,
         r3000_DWchange1920=mean.DWchange_1920,
         r3000_DWchange2021=mean.DWchange_2021,
         r3000_DWchange2122=mean.DWchange_2122,
         r3000_DWchange2223=mean.DWchange_2223) %>% 
  dplyr::select(id,
                r3000_TCLNaN,r3000_TCL17,r3000_TCL18,r3000_TCL19,r3000_TCL20,
                r3000_TCL21,r3000_TCL22,r3000_TCL23,
                r3000_DWchange1718,r3000_DWchange1819,r3000_DWchange1920,
                r3000_DWchange2021,r3000_DWchange2122,r3000_DWchange2223)

# visu rādiusu pievienošana režģim
vides_parmainas=dati_c2 %>% 
  left_join(dati_r500a,by=c("id")) %>% 
  left_join(dati_r1250a,by=c("id")) %>% 
  left_join(dati_r3000a,by=c("id"))

# rezultāta saglabāšana
st_write_parquet(vides_parmainas,"./VidesParmainas_visas.parquet")
```

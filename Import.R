## Teszt beolvasás
teszt <- read.csv("Met_allomas_Fertodkontrol/202606/25.CSV", head = FALSE)
## Felfedezés
names(teszt)
str(teszt)
csatorna_lista <- split(teszt, teszt[[3]])
str(csatorna_lista)
csatorna_nevek <- paste0("C", names(csatorna_lista))
library(xts)
for(aktual_csatorna in 1:length(csatorna_nevek)){
    assign(csatorna_nevek[aktual_csatorna], xts(csatorna_lista[[aktual_csatorna]][,4],
                                                as.POSIXct(csatorna_lista[[aktual_csatorna]][,1])
                                                ))
}
## Collect all files
allfilenames <- paste("202606", dir("Met_allomas_Fertodkontrol/202606/"), sep = "/")
allfilenames <- c(allfilenames, paste("202607", dir("Met_allomas_Fertodkontrol/202607/"), sep = "/"))
allfilenames <- paste("Met_allomas_Fertodkontrol", allfilenames, sep = "/")

## Import and convert all
for(aktual_filename in allfilenames){
    teszt <- read.csv(aktual_filename, head = FALSE)
    csatorna_lista <- split(teszt, teszt[[3]])
    csatorna_nevek <- paste0("C", names(csatorna_lista))
    for(aktual_csatorna in 1:length(csatorna_nevek)){
        assign(csatorna_nevek[aktual_csatorna],
               c(get(csatorna_nevek[aktual_csatorna]),
                 xts(csatorna_lista[[aktual_csatorna]][,4],
                     as.POSIXct(csatorna_lista[[aktual_csatorna]][,1])
                     )))
    }
}

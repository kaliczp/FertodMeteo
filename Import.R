## Teszt beolvasás
FertodDataLocation <- "fertod827/kontrol"
teszt <- read.csv(paste(FertodDataLocation, "202606/25.CSV", sep = "/"), head = FALSE)
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
aktual_dirname <- paste(FertodDataLocation, "202606/", sep = "/")
allfilenames <- paste("202606", dir(aktual_dirname), sep = "/")
allfilenames <- allfilenames[-1] # Az első állomány levágása a fenti teszt miatt!
aktual_dirname <- paste(FertodDataLocation, "202607/", sep = "/")
allfilenames <- c(allfilenames, paste("202607", dir(aktual_dirname), sep = "/"))
aktual_dirname <- paste(FertodDataLocation, "202608/", sep = "/")
allfilenames <- c(allfilenames, paste("202608", dir(aktual_dirname), sep = "/"))
allfilenames <- paste(FertodDataLocation, allfilenames, sep = "/")

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

## Teszt beolvasás
dir("Met_allomas_Fertodkontrol/202606/")
teszt <- read.csv("Met_allomas_Fertodkontrol/202606/25.CSV", head = FALSE)
## Felfedezés
names(teszt)
str(teszt)
csatorna_lista <- split(teszt, teszt[[3]])
str(csatorna_lista)

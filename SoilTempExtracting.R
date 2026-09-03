C14darab <- C14['2026-08-27']
C14darab_1 <- C14darab[seq(1, nrow(C14darab), by = 3)]
C14darab_2 <- C14darab[seq(2, nrow(C14darab), by = 3)]
C14darab_3 <- C14darab[seq(3, nrow(C14darab), by = 3)]
plot.zoo(C14darab_1, ylim = c(100,300))
lines(as.zoo(C14darab_2))
lines(as.zoo(C14darab_3))

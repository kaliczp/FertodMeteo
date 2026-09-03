## Ha mindig hármat mér
C14darab <- C14['2026-08-27']
C14darab_1 <- C14darab[seq(1, nrow(C14darab), by = 3)]
C14darab_2 <- C14darab[seq(2, nrow(C14darab), by = 3)]
C14darab_3 <- C14darab[seq(3, nrow(C14darab), by = 3)]
plot.zoo(C14darab_1, ylim = c(100,300))
lines(as.zoo(C14darab_2))
lines(as.zoo(C14darab_3))

## Kihagyott elemekre is működik
sensor_nr <- ave(seq_along(index(C14)),index(C14), FUN = seq_along)
C14_1 <- C14[sensor_nr == 1]
C14_2 <- C14[sensor_nr == 2]
C14_3 <- C14[sensor_nr == 3]

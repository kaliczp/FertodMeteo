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

### Split sensors
split_sensors <- function(sensor) {

    ## Az időbélyegek
    tt <- index(sensor)

    ## Hány mérés tartozik az egyes időpontokhoz?
    n <- ave(seq_along(tt), tt, FUN = length)

    ## Az adott időbélyegen belüli sorszám
    pos <- ave(seq_along(tt), tt, FUN = seq_along)

    ## Problémás időpontok:
    ## nem 3 és nem 4 mérés tartozik hozzá

    bad_times <- unique(tt[n != 3 & n != 4])

    ## A 4 mérésből álló csoportokban a 2. mérés
    ## a duplikált első csatorna -> ezt eldobjuk
    keep <- !(n == 4 & pos == 2)

    sensor_clean <- sensor[keep]

    ## Újra meghatározzuk a pozíciót a megtisztított adatokon
    tt_clean <- index(sensor_clean)

    pos_clean <- ave(
        seq_along(tt_clean),
        tt_clean,
        FUN = seq_along
    )

    ## A három szenzor
    sensor1 <- sensor_clean[pos_clean == 1]
    sensor2 <- sensor_clean[pos_clean == 2]
    sensor3 <- sensor_clean[pos_clean == 3]

    ## Eredmény visszaadása
    list(
        sensor1 = sensor1,
        sensor2 = sensor2,
        sensor3 = sensor3,
        bad_times = bad_times
    )
}

# Probabilitas & Statistika — Minggu ke-5

koin <- c("A","G")
ruang_sampel <- expand.grid(
  Koin1 = koin,
  Koin2 = koin,
  Koin3 = koin
)
ruang_sampel

dadu <- c(1,2,3,4,5,6)
lempar_dadu <- expand.grid(
  dadu1 = dadu,
  dadu2 = dadu
)
lempar_dadu
lempar_dadu$jumlah <- lempar_dadu$dadu1 + lempar_dadu$dadu2
lempar_dadu

kurang_dari_8 <- subset(lempar_dadu, lempar_dadu$jumlah < 8)
kurang_dari_8
nrow(lempar_dadu)
nrow(kurang_dari_8)
ks  <- nrow(lempar_dadu)
sa  <- nrow(kurang_dari_8)
p_a <- round(sa/ks, 2)*100
p_a

genap <- subset(lempar_dadu, lempar_dadu$jumlah %% 2 == 0)
genap
nrow(genap)

ganjil <- subset(lempar_dadu, lempar_dadu$jumlah %% 2 == 1)
ganjil
nrow(ganjil)


### LATIHAN 1. PIN ###
# Pin terdiri dari 3 digit; digit pertama tidak boleh 0 (1–5),
# digit kedua dan ketiga boleh 0–5. Total ruang sampel = 5 x 6 x 6 = 180.

pin <- c(0,1,2,3,4,5)
ruang_sampel <- expand.grid(
  Pin1 = subset(pin, pin > 0),
  Pin2 = pin,
  Pin3 = pin
)
ruang_sampel

kejadian5 <- subset(ruang_sampel, ruang_sampel$Pin1 == 5|ruang_sampel$Pin2 == 5|ruang_sampel$Pin3 == 5)
kejadian5
k5 <- nrow(kejadian5)
rs <- nrow(ruang_sampel)
p5 <- round(k5/rs, 2)*100
p5

kejadian_beda <- subset(ruang_sampel, (Pin1 != Pin2 & Pin2 != Pin3 & Pin3 != Pin1))
kejadian_beda
nrow(kejadian_beda)
kb <- nrow(kejadian_beda)
pU <- round(kb/rs, 2)*100
pU


### LATIHAN 2. ROUTER ###
# 4 router, setiap router berstatus S (Sukses) atau F (Gagal).

router <- c("S","F")
sampel_router <- expand.grid(
  Router1 = router,
  Router2 = router,
  Router3 = router,
  Router4 = router
)
sampel_router

# Ruang sampel bersyarat: maksimal 1 router gagal
sampel_router1 <- subset(sampel_router, (Router1=="F") + (Router2=="F") + (Router3=="F") + (Router4=="F") <= 1)
sampel_router1
nrow(sampel_router1)

# Kejadian: tidak ada router yang gagal (semua S)
tidak_ada_gagal <- subset(sampel_router, (Router1=="S") & (Router2=="S") & (Router3=="S") & (Router4=="S"))
tidak_ada_gagal

# Peluang bersyarat: P(semua S | maks 1 gagal)
# Pembagi = ruang sampel bersyarat (sampel_router1), bukan ruang sampel penuh
peluang <- nrow(tidak_ada_gagal) / nrow(sampel_router1)
peluang

# Verifikasi: menggunakan nama kolom cek1–cek4

hasil <- c("S", "F")
ruang_sampel <- expand.grid(
  cek1 = hasil,
  cek2 = hasil,
  cek3 = hasil,
  cek4 = hasil
)
ruang_sampel

jumlah_F <- (ruang_sampel$cek1 == "F") +
  (ruang_sampel$cek2 == "F") +
  (ruang_sampel$cek3 == "F") +
  (ruang_sampel$cek4 == "F")

ruang_sampel_bersyarat <- ruang_sampel[jumlah_F <= 1, ]
ruang_sampel_bersyarat
nrow(ruang_sampel_bersyarat)

total <- nrow(ruang_sampel)

tidak_ada_gagal <- ruang_sampel[
  ruang_sampel$cek1 == "S" &
    ruang_sampel$cek2 == "S" &
    ruang_sampel$cek3 == "S" &
    ruang_sampel$cek4 == "S",
]

# Peluang murni dari ruang sampel penuh: P(semua S) = 1/16
peluang <- nrow(tidak_ada_gagal) / total
peluang

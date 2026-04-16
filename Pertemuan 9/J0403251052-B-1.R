koin <- c("A", "G")
ruang_sample <- expand.grid(
  koin1 = koin,
  koin2 = koin,
  koin3 = koin
)
ruang_sample

dadu <- c(1,2,3,4,5,6)

ruang_sample_dadu <- expand.grid(
  dadu1 = dadu,
  dadu2 = dadu
)

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}
ruang_sample_dadu

# Tambah kolom jumlah
ruang_sample_dadu$Jml_mata_dadu <- 
  ruang_sample_dadu$dadu1 + ruang_sample_dadu$dadu2

# Kejadian jumlah genap
kejadian_genap <- subset(
  ruang_sample_dadu,
  Jml_mata_dadu %% 2 == 0
)

# Probabilitas
nrow(kejadian_genap) / nrow(ruang_sample_dadu)

#Generate di R
digit <- 0:5
ruang_sample <- expand.grid(
  d1=digit,
  d2=digit,
  d3=digit
)

ruang_sample <- subset(ruang_sample, d1 !=0)
nrow(ruang_sample)

#Mengandung minimal satu angka 5
kejadian_5 <- subset(
  ruang_sample,
  d1 == 5 | d2 == 5 | d3 == 5
)

prob_5 <- nrow(kejadian_5) / nrow(ruang_sample)
prob_5

#Semua digit berbeda
kejadian_unik <- subset(
  ruang_sample,
  d1 != d2 & d1 != d3 & d2 != d3
)

prob_unik <- nrow(kejadian_unik) / nrow(ruang_sample)
prob_unik


#KASUS 2: Router (Sukses & Gagal)
#Generate di R
status <- c("S", "F")

ruang_sample <- expand.grid(
  p1 = status,
  p2 = status,
  p3 = status,
  p4 = status
)

nrow(ruang_sample)

#Ruang Sampel Bersyarat (maksimal 1 gagal)
ruang_sample$jumlah_F <- rowSums(ruang_sample == "F")

ruang_sample_valid <- subset(
  ruang_sample,
  jumlah_F <= 1
)

nrow(ruang_sample_valid)

#Probabilitas tidak ada kegagalan
kejadian_sukses <- subset(
  ruang_sample_valid,
  jumlah_F == 0
)

prob <- nrow(kejadian_sukses) / nrow(ruang_sample_valid)
prob
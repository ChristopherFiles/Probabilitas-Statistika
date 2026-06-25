library(dplyr)

# Simulasi lempar koin 100 kali
set.seed(123)
lempar <- sample(c("H", "T"), size = 100, replace = TRUE)
table(lempar) / 100   # frekuensi relatif

# Simulasi lempar 2 dadu 1000 kali
dadu <- sample(1:6, size = 2000, replace = TRUE)   # 2 dadu x 1000
mat <- matrix(dadu, ncol = 2, byrow = TRUE)
jumlah <- rowSums(mat)

table(jumlah) / 1000

# Visualisasi sederhana
barplot(
  table(jumlah) / 1000,
  main = "Distribusi Jumlah 2 Dadu"
)

# Membuat ruang sampel S
S <- 1:6
print(S)

# Menghitung ukuran ruang sampel n(S)
n_S <- length(S)

# Ruang sampel dua kali lempar koin
koin <- c("Angka", "Gambar")
S_koin <- expand.grid(
  Lemparan1 = koin,
  Lemparan2 = koin
)
print(S_koin)

# Kejadian A: bilangan genap
A <- S[S %% 2 == 0]
print(A)   # Hasil: 2, 4, 6

# Menghitung ukuran kejadian n(A)
n_A <- length(A)

# Membuat ruang sampel dua dadu
dadu1 <- 1:6
dadu2 <- 1:6

S <- expand.grid(
  Dadu1 = dadu1,
  Dadu2 = dadu2
)

# Melihat 6 baris pertama
head(S)

# Menghitung total titik sampel n(S)
nrow(S)

# Menambahkan kolom jumlah
S$Jumlah <- S$Dadu1 + S$Dadu2
print(S)

# Mencari anggota kejadian A
A <- subset(S, Jumlah == 7)
print(A)

# Menghitung peluang P(A)
peluang_A <- nrow(A) / nrow(S)

cat(
  "Peluang jumlah mata dadu 7 adalah:",
  peluang_A,
  "atau",
  round(peluang_A, 4)
)

# 1. Menentukan ruang sampel baru (Dadu1 = 4)
S_syarat <- subset(S, Dadu1 == 4)

# 2. Menentukan kejadian Jumlah = 10
kejadian_target <- subset(S_syarat, Jumlah == 10)

# 3. Menghitung peluang bersyarat
peluang_bersyarat <- nrow(kejadian_target) / nrow(S_syarat)

cat(
  "P(Sum = 10 | Dadu1 = 4) adalah:",
  peluang_bersyarat
)

# Memuat data mtcars
data(mtcars)
names(mtcars)

# 1. Menentukan ruang sampel
n_S <- nrow(mtcars)

# 2. Kejadian A: mobil manual
# am: 0 = otomatis, 1 = manual
kejadian_A <- subset(mtcars, am == 1)
n_A <- nrow(kejadian_A)

# 3. Menghitung peluang
P_A <- n_A / n_S

cat(
  "Peluang mendapatkan mobil manual adalah:",
  round(P_A, 4)
)

# Langkah 1: Ruang sampel baru (mobil 6 silinder)
S_baru <- subset(mtcars, cyl == 6)
n_S_baru <- nrow(S_baru)

# Langkah 2: Mobil manual pada 6 silinder
A_irisan_B <- subset(S_baru, am == 1)
n_irisan <- nrow(A_irisan_B)

# Langkah 3: Peluang bersyarat
P_A_given_B <- n_irisan / n_S_baru

cat(
  "P(Manual | 6 Cyl) adalah:",
  round(P_A_given_B, 4)
)

# Menetapkan seed untuk reproduksibilitas
set.seed(5)

# Mengambil 4 sampel acak dengan pengembalian
sample(1:5, 4, replace = TRUE)
# Output: 2 3 1 3

# Menetapkan seed untuk reproduksibilitas
set.seed(5)

# Mengambil 4 sampel acak dengan pengembalian
sample(1:5, 4, replace = TRUE)
# Output: 2 3 1 3

# Kejadian Dadu1 = 6
kejadian_enam <- subset(S, Dadu1 == 6)

# Kejadian jumlah mata dadu > 10
kejadian_besar <- subset(S, Jumlah > 10)

# Membuat vektor nilai
nilai <- c(2, 5, 8, 4, 9, 1, 7, 3, 10, 6)

# Mengambil nilai yang lulus
lulus <- subset(nilai, nilai >= 6)
print(lulus)

# Contoh membuat ruang sampel dua dadu
S <- expand.grid(
  Dadu1 = 1:6,
  Dadu2 = 1:6
) %>%
  mutate(Jumlah = Dadu1 + Dadu2)

# Menggunakan subset()
kejadian_enam <- subset(S, Dadu1 == 6)

# Menggunakan dplyr
kejadian_enam <- S %>%
  filter(Dadu1 == 6)

# Dengan subset()
kejadian_besar <- subset(S, Jumlah > 10)

# Dengan dplyr
kejadian_besar <- S %>%
  filter(Jumlah > 10) %>%
  select(Dadu1, Dadu2)

# Setara dengan kode di atas
subset(
  S,
  Jumlah > 10,
  select = c(Dadu1, Dadu2)
)
# ======================================================
# MEMBERSIHKAN ENVIRONMENT
# ======================================================

# Menghapus semua objek di workspace
rm(list = ls())


# ======================================================
# OPERASI ARITMATIKA DASAR
# ======================================================

# Perkalian langsung
67 * 200

# Menyimpan hasil perhitungan ke variabel
hitung <- 67 * 200
hitung


# ======================================================
# TIPE DATA DASAR
# ======================================================

# Bilangan bulat
x <- 5
class(x)      # Menampilkan class objek
typeof(x)     # Menampilkan tipe data internal

# Bilangan desimal
y <- 5.25
class(y)
typeof(y)

# Bilangan integer eksplisit
z <- 8L
typeof(z)

# Operasi logika
t <- 123
t < 64        # Membandingkan nilai (TRUE/FALSE)


# ======================================================
# VEKTOR KARAKTER & NUMERIK
# ======================================================

# Vektor karakter
countries <- c("konoha", "singapura")

# Vektor numerik
nilaiUjian <- c(45, 70, 35, 70, 80)

countries
class(countries)
typeof(countries)

# Panjang vektor
length(countries)

# Jumlah karakter tiap elemen
nchar(countries)

# Menggabungkan teks
paste(countries, collapse = " -- ")


# ======================================================
# VEKTOR NUMERIK DENGAN NAMA
# ======================================================

dataPenduduk <- c(456, 758, 1278, 230, 125, 55)

# Memberi nama pada elemen vektor
names(dataPenduduk) <- c(
  "Jateng", "Jatim", "DKI Jakarta",
  "Banten", "Sumut", "Papua Barat"
)

dataPenduduk

# Mengakses elemen tertentu
dataPenduduk[3]
dataPenduduk[c(1, 3)]

# Nilai maksimum & indeksnya
max(dataPenduduk)
which.max(dataPenduduk)


# ======================================================
# OPERASI SUBSETTING VEKTOR
# ======================================================

x <- c(10, 20, 30, 40, 50)

x[1]                 # Elemen pertama
x[c(1, 3, 5)]        # Elemen tertentu
x[-1]                # Menghapus elemen pertama
x[-c(2, 4)]          # Menghapus elemen ke-2 dan ke-4
x[x > 25]            # Seleksi dengan kondisi
x > 25               # Hasil logika
x[2:4]               # Rentang indeks

# Vektor bernama
nilai <- c(Ferdi = 80, Tiara = 90, Fufufafa = 85)
nilai
nilai["Tiara"]

# Indeks nilai lebih dari 25
which(x > 25)


# ======================================================
# MODIFIKASI VEKTOR
# ======================================================

d1 <- c(55, 78, 90, 85, 90)
d1

# Menghapus elemen ke-3
d1 <- d1[-3]
d1

# Menambahkan elemen baru
d1 <- c(d1, 25)
d1

# Mencari indeks nilai tertentu
which(d1 == 90)


# ======================================================
# MEMBUAT VEKTOR DATA (STUDI KASUS)
# ======================================================

ID_site <- c("A1.01", "A1.02", "B1.01", "B1.02")
Soil_PH <- c(5.6, 7.3, 4.1, 6.0)
num_species <- c(17, 23, 15, 7)
Treatment <- c("Fert", "Fert", "No_Fert", "No_Fert")

ID_site
Soil_PH
Treatment


# ======================================================
# MEMBUAT DATA FRAME
# ======================================================

tbl_pengamatan <- data.frame(
  ID_site,
  Soil_PH,
  num_species,
  Treatment
)

tbl_pengamatan


# ======================================================
# STRUKTUR & SUBSETTING DATA FRAME
# ======================================================

# Struktur data frame
str(tbl_pengamatan)

# Mengambil baris ke-2 dan ke-3
tbl_pengamatan_baris <- tbl_pengamatan[c(2, 3), ]
tbl_pengamatan_baris

# Mengambil kolom numerik
tbl_pengamatan_numerik <- tbl_pengamatan[, c(2, 3)]
tbl_pengamatan_numerik

# Ringkasan statistik
summary(tbl_pengamatan)


# ======================================================
# DATASET BAWAAN: mtcars
# ======================================================

data("mtcars")

mtcars
dim(mtcars)          # Dimensi data
names(mtcars)        # Nama kolom
row.names(mtcars)    # Nama baris
head(mtcars, 1)      # Data teratas

# Mengambil kolom hp
mtcars$hp
v_hp <- mtcars$hp
v_hp

# Subset baris & kolom
analisa <- mtcars[2:5, 4:6]
analisa

# Rata-rata mpg
rataan_mpg <- round(mean(mtcars$mpg), 2)
rataan_mpg

# Mobil dengan mpg di atas rata-rata
mtcars[mtcars$mpg > rataan_mpg, ]


# ======================================================
# ANALISIS INCOME & POPULASI NEGARA BAGIAN AS
# ======================================================

# Memuat dataset bawaan
data(state)

# Mengecek tipe data
class(state.x77)

# Mengubah matrix menjadi data frame
state.x77 <- data.frame(state.x77)

# Melihat struktur data
head(state.x77)
names(state.x77)


# -------------------------------
# ANALISIS INCOME
# -------------------------------

income <- state.x77$Income

max_income <- max(income)
min_income <- min(income)

incomeMax <- which.max(income)
incomeMin <- which.min(income)

state_income_max <- row.names(state.x77)[incomeMax]
state_income_min <- row.names(state.x77)[incomeMin]

state_income_max
state_income_min

summary(income)


# -------------------------------
# ANALISIS POPULASI
# -------------------------------

population <- state.x77$Population

max_population <- max(population)
min_population <- min(population)

popMax <- which.max(population)
popMin <- which.min(population)

state_pop_max <- row.names(state.x77)[popMax]
state_pop_min <- row.names(state.x77)[popMin]

state_pop_max
state_pop_min

summary(population)
# 1. MANIPULASI KATEGORI (FAKTOR)
warna_list <- c("Red", "Green", "Blue", "Red", "Green", "Blue")
warna_faktor <- factor(warna_list, levels = c("Red", "Green", "Blue"), labels = c("R", "G", "B"))
print(warna_faktor)

# 2. DATA FRAME SEDERHANA
siswa <- data.frame(
  Nama = c("Andi", "Budi", "Citra"),
  Status = factor(c("Menikah", "Lajang", "Menikah"))
)
print(siswa)

# 3. STATISTIK PADA VEKTOR
jumlah_bug <- c(12, 5, 20, 8, 15)
modul <- c("Auth", "Payment", "Dashboard", "Report", "API")

# Mencari rata-rata dan filter data
rata_rata_bug <- mean(jumlah_bug)
print(rata_rata_bug)

# Mencari modul mana yang bug-nya di atas rata-rata
indeks_urgent <- which(jumlah_bug > rata_rata_bug)
modul_urgent <- modul[indeks_urgent]
print(modul_urgent)

# 4. MATRIKS NILAI
# Membuat matriks 7 baris dan 2 kolom
# pastikan nilaiTot sudah ada di environment-mu
# nilai_ujian <- matrix(nilaiTot, nrow = 7, ncol = 2)
# print(nilai_ujian)

# 5. MENGOLAH DATASET BAWAAN R
# Melihat data mobil
data(mtcars)
print(head(mtcars))

# Mencari mobil yang irit (mpg di atas rata-rata)
rata_mpg <- mean(mtcars$mpg)
mobil_irit <- mtcars[mtcars$mpg > rata_mpg, ]
print(mobil_irit)

# 6. ANALISIS DATA NEGARA BAGIAN
data(state)
data_negara <- data.frame(state.x77)

# Melihat pendapatan tertinggi
pendapatan <- data_negara$Income
maks_pendapatan <- max(pendapatan)
print(maks_pendapatan)

# Mencari negara bagian dengan pendapatan tertinggi
indeks_maks <- which.max(pendapatan)
nama_negara_terkaya <- row.names(data_negara)[indeks_maks]
print(nama_negara_terkaya)
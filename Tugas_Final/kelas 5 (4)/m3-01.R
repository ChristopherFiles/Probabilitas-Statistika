# 1. TIPE DATA & LOGIKA
x_int <- 5L            # Integer menggunakan akhiran L
y_num <- 6.345         # Numeric/Double
cat("Kelas x_int:", class(x_int), "| Tipe:", typeof(x_int), "\n")

# Pembandingan & Konversi Logical
t <- 123
print(t > 67)          # Menghasilkan TRUE
print(as.logical(2.5)) # Menghasilkan TRUE

# 2. MANIPULASI VEKTOR
countries <- c('Indonesia', 'China', 'Japan', 'South Korea', 'Singapore')
print(nchar(countries)) # Jumlah karakter tiap elemen
print(paste(countries, collapse=' -- '))

# Subsetting Vektor
x <- c(10, 20, 30, 40, 50)
print(x[c(1, 3, 5)])   # Ambil elemen ke-1, 3, 5
print(x[x > 25])       # Filter elemen > 25

# Menambah & Menghapus
d1 <- c(55, 78, 90, 85, 80)
d1 <- d1[-4]           # Hapus elemen ke-4
d1 <- c(d1, 25)        # Tambah elemen 25

# 3. MATRIKS (ERROR FIX: rbind)
a <- c(1, 2, 3)
b <- 5:7
matriks1 <- cbind(a, b) # Gabung kolom
matriks2 <- rbind(a, b) # PERBAIKAN: dari rbin menjadi rbind

# Dimensi & Panjang
print(dim(matriks1))    # Cek dimensi (nrow, ncol)
print(length(matriks1)) # Total elemen/sel

# Penamaan kolom matriks
m1 <- 1:9
m2 <- 23:31
m3 <- cbind(m2, m1)
colnames(m3) <- c("umur", "no_ID")
print(m3)

# 4. DATA FRAME
df_penelitian <- data.frame(
  id = 1:4,
  nama = c("Responden A", "Responden B", "Responden C", "Responden D"),
  skor = c(85, 92, 78, 88),
  status = c("Aktif", "Pasif", "Aktif", "Aktif")
)
print(summary(df_penelitian))
print(mean(df_penelitian$skor)) # Rata-rata skor

# 5. LIST
repo_rpl <- list(
  project_name = "Sistem Inventaris Kampus",
  version = 2.5,
  is_open_source = TRUE,
  tech_stack = c("R", "Shiny", "PostgreSQL"),
  sprint_duration_days = 14
)
print(repo_rpl$tech_stack) # Akses elemen list

# 6. FAKTOR
jenis_kelamin <- factor(c("Pria", "Wanita", "Pria", "Wanita", "Pria"))
status_nikah  <- factor(c("Menikah", "Lajang", "Menikah", "Lajang"), 
                        levels = c("Lajang", "Menikah"))

print(table(jenis_kelamin)) # Tabel frekuensi
print(nlevels(jenis_kelamin)) # Jumlah level
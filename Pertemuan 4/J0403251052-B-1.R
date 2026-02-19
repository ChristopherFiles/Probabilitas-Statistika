# ===============================
# RESET ENVIRONMENT
# ===============================
rm(list = ls())

# ===============================
# MEMBUAT DATA FRAME
# ===============================
data_mhs <- data.frame(
  nama = c("Omar", "Sael", "Abim", "Ramdhan", "Pardun"),
  jurusan = c("TPL", "MNI", "AKN", "TKR", "TKJ"),
  nilai = c(90, 85, 94, 80, 75)
)

print(data_mhs)

# ===============================
# FILTER DATA
# ===============================
hasil_filter <- data_mhs[data_mhs$nilai >= 80, ]
print(hasil_filter)

# ===============================
# MEMBUAT nilaiAkhir
# ===============================
nilaiAkhir <- data_mhs

nilaiAkhir$kategori_nilai <- ifelse(
  nilaiAkhir$nilai >= 85, "Sangat Baik",
  ifelse(nilaiAkhir$nilai >= 70, "Baik", "Kurang")
)

# ===============================
# MENAMPILKAN HASIL
# ===============================
print(nilaiAkhir)


# ===============================
# LOAD PACKAGE
# ===============================
library(dplyr)

# ===============================
# DATA AWAL
# ===============================
nilaiAkhir <- data.frame(
  nama = c("Andi", "Budi", "Citra", "Dewi", "Eka"),
  kategori_nilai = c(
    "Sangat Baik",
    "Kurang",
    "Sangat Baik",
    "Baik",
    "Kurang"
  )
)

# ===============================
# RENAME KOLOM
# ===============================
nilaiAkhir <- nilaiAkhir %>%
  rename(
    kategori = kategori_nilai
  )

# ===============================
# OUTPUT
# ===============================
nilaiAkhir

# ===============================
# LOAD PACKAGE
# ===============================
library(dplyr)

# ===============================
# GROUP BY + SUMMARY
# ===============================
iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(
    mean_sepal = mean(Sepal.Length),
    sd_sepal   = sd(Sepal.Length),
    n          = n()
  )

# ===============================
# OUTPUT
# ===============================
iris_summary


#Scatter Plot
data(mtcars)

plot(
  mtcars$wt,
  mtcars$mpg,
  main = "Hubungan Berat Mobil dan MPG",
  xlab = "Berat Mobil",
  ylab = "Miles per Gallon",
  pch = 19,
  col = "blue"
)

ggplot(data = mtcars, aes(x = wt, y = mpg))


# Memanggil library
library(ggplot2)

# Membuat grafik scatter + garis tren dengan tema
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth() +
  labs(
    title = "Hubungan Berat Mobil dan Efisiensi Bahan Bakar",
    x = "Berat Mobil (wt)",
    y = "Miles per Gallon (mpg)"
  ) +
  theme_minimal()



# ==================================
# MEMBUAT GRAFIK SCATTER IRIS
# ==================================
p <- ggplot(
  data = iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    color = Species
  )
) +
  geom_point() +
  labs(
    x = "Panjang Sepal (cm)",
    y = "Panjang Petal (cm)",
    color = "Jenis Bunga",
    title = "Hubungan Panjang Sepal dan Petal Bunga Iris"
  )

# ==================================
# MENAMPILKAN GRAFIK
# ==================================
p


# ==================================
# LOAD LIBRARY
# ==================================
library(ggplot2)
library(dplyr)

# ==================================
# AGREGASI DATA
# ==================================
iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(
    mean_sepal = mean(Sepal.Length)
  )

# ==================================
# BAR CHART DENGAN geom_bar
# ==================================
barplot <- ggplot(
  data = iris_summary,
  aes(x = Species, y = mean_sepal)
) +
  geom_bar(stat = "identity", fill = "rainbow") +
  labs(
    title = "Rata-rata Panjang Sepal per Spesies",
    x = "Spesies",
    y = "Rata-rata Sepal.Length"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

# ==================================
# TAMPILKAN GRAFIK
# ==================================
barplot


library(ggplot2)
library(dplyr)

iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(mean_sepal = mean(Sepal.Length))

ggplot(iris_summary, aes(x = Species, y = mean_sepal, fill = Species)) +
  geom_col() +
  scale_fill_brewer(palette = "Set1") +
  labs(
    title = "Rata-rata Panjang Sepal per Spesies",
    x = "Spesies",
    y = "Rata-rata Sepal.Length"
  )


# ======================================================
# PRAKTIKUM PROBABILITAS & STATISTIKA
# Analisis Statistik Deskriptif dan Visualisasi Data
# Data: Tinggi Badan
# ======================================================

# ------------------------------------------------------
# 1. MEMUAT LIBRARY
# ------------------------------------------------------
# dplyr digunakan untuk manipulasi dan analisis data
# ggplot2 digunakan untuk visualisasi data

library(dplyr)
library(ggplot2)

# ------------------------------------------------------
# 2. MEMBUAT DATA TINGGI BADAN
# ------------------------------------------------------
# Data berupa tinggi badan (dalam cm)

tinggi <- c(
  188.7, 169.4, 178.6, 181.3, 179, 173.9, 190.1, 174.1, 195.2, 174.4,
  188, 197.9, 161.1, 172.2, 173.7, 181.4, 172.2, 148.4, 150.6, 188.2,
  171.9, 157.2, 173.3, 187.1, 194, 170.7, 172.4, 157.4, 179.6, 168.6,
  179.6, 182, 185.4, 168.9, 180, 157.8, 167.2, 166.5, 150.9, 175.4,
  177.1, 171.4, 182.6, 167.7, 161.3, 179.3, 166.9, 189.4, 170.7,
  181.6, 178.2, 167.2, 190.8, 181.4, 175.9, 177.8, 181.8, 175.9,
  145.1, 177.8, 171.3, 176.9, 180.8, 189, 167.7, 188, 178.4, 185.4,
  184.2, 182.2, 164.6, 174.1, 181.2, 165.5, 169.6, 180.8, 182.7,
  179.6, 166.1, 164, 190.1, 177.6, 175.9, 173.8, 163.1, 181.1,
  172.8, 173.2, 184.3, 183.2, 188.9, 170.2, 181.5, 188.9, 163.9,
  166.4, 163.7, 160.4, 175.8, 181.5
)

# ------------------------------------------------------
# 3. MEMBUAT DATA FRAME (TIBBLE)
# ------------------------------------------------------
# Mengubah vektor menjadi data frame satu kolom

df_tinggi <- tibble(tinggi_badan = tinggi)

# Menampilkan struktur data
str(df_tinggi)

# ------------------------------------------------------
# 4. STATISTIK DESKRIPTIF
# ------------------------------------------------------
# Menghitung ukuran statistik dasar

statistik <- df_tinggi %>%
  summarise(
    jumlah_data = n(),                 # jumlah observasi
    minimum = min(tinggi_badan),       # nilai minimum
    maksimum = max(tinggi_badan),      # nilai maksimum
    rata_rata = mean(tinggi_badan),    # rata-rata
    median = median(tinggi_badan),     # median
    simpangan_baku = sd(tinggi_badan)  # standar deviasi
  )

# Menampilkan hasil statistik
statistik

# ------------------------------------------------------
# 5. VISUALISASI: HISTOGRAM
# ------------------------------------------------------
# Histogram untuk melihat sebaran data tinggi badan

ggplot(df_tinggi, aes(x = tinggi_badan)) +
  geom_histogram(
    binwidth = 5,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Distribusi Tinggi Badan",
    x = "Tinggi Badan (cm)",
    y = "Frekuensi"
  ) +
  theme_minimal()

# ------------------------------------------------------
# 6. VISUALISASI: BOXPLOT
# ------------------------------------------------------
# Boxplot untuk melihat median, IQR, dan outlier

ggplot(df_tinggi, aes(y = tinggi_badan)) +
  geom_boxplot(fill = "tomato") +
  labs(
    title = "Boxplot Tinggi Badan",
    y = "Tinggi Badan (cm)"
  ) +
  theme_minimal()

# ------------------------------------------------------
# 7. KLASIFIKASI TINGGI BADAN
# ------------------------------------------------------
# Mengelompokkan tinggi badan ke dalam kategori

df_kategori <- df_tinggi %>%
  mutate(
    kategori = case_when(
      tinggi_badan < 160 ~ "Pendek",
      tinggi_badan < 180 ~ "Sedang",
      TRUE ~ "Tinggi"
    )
  )

# ------------------------------------------------------
# 8. MENGHITUNG FREKUENSI SETIAP KATEGORI
# ------------------------------------------------------

df_kategori %>%
  count(kategori)


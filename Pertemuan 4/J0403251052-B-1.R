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



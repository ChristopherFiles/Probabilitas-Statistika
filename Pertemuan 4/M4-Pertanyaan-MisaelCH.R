rm(list = ls())

data(iris)

head(iris)

# ======================================================
# SOAL 1
# Berapa nilai rata-rata Sepal.Length untuk masing-masing species?
# ======================================================

library(dplyr)

iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(
    mean_sepal = mean(Sepal.Length)
  )

# Menampilkan hasil
iris_summary

# ======================================================
# JAWABAN SOAL 1 (BERDASARKAN OUTPUT)
# Setosa     : ± 5.01 cm
# Versicolor : ± 5.94 cm
# Virginica  : ± 6.59 cm
# ======================================================


# ======================================================
# SOAL 2
# Species mana yang memiliki rata-rata Sepal.Length paling panjang?
# ======================================================

# Mencari species dengan mean_sepal terbesar
species_terpanjang <- iris_summary %>%
  filter(mean_sepal == max(mean_sepal))

species_terpanjang

# ======================================================
# JAWABAN SOAL 2
# Species dengan rata-rata Sepal.Length paling panjang adalah:
# Virginica (± 6.59 cm)
# ======================================================


# ======================================================
# SOAL 3
# Apa fungsi stat = "identity" pada geom_bar()?
# ======================================================

library(ggplot2)

ggplot(iris_summary, aes(x = Species, y = mean_sepal)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Rata-rata Sepal Length per Species",
    x = "Species",
    y = "Rata-rata Sepal Length (cm)"
  )

# ======================================================
# JAWABAN SOAL 3
# stat = "identity" digunakan agar tinggi batang (bar)
# sesuai dengan nilai numerik yang sudah ada di data.
# Tanpa stat = "identity", geom_bar() akan menghitung
# frekuensi data, bukan menggunakan nilai mean_sepal.
# ======================================================


# ======================================================
# SOAL 4
# Jelaskan potongan kode berikut dengan implementasi:
#
# iris_summary <- iris %>%
#   group_by(Species) %>%
#   summarise(mean_sepal = mean(Sepal.Length))
# ======================================================

# IMPLEMENTASI ULANG + KOMENTAR

iris_summary <- iris %>%
  group_by(Species) %>%          # Mengelompokkan data berdasarkan Species
  summarise(
    mean_sepal = mean(Sepal.Length)  # Menghitung rata-rata Sepal.Length
  )

# Menampilkan hasil akhir ringkasan
iris_summary


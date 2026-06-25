# 1.Nilai rata-rata Sepal.Length masing-masing spesies
library(dplyr)
library(ggplot2)

iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(mean_sepal = mean(Sepal.Length))
iris_summary

#2. Spesies yang memiliki rata-rata Sepal.Length paling panjang
spesies_terpanjang <- iris_summary %>%
  arrange(desc(mean_sepal)) %>%
  slice(1)
spesies_terpanjang

ggplot(iris_summary,
       aes(x = Species, y = mean_sepal, fill = Species)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Rata-rata Panjang Sepal per Spesies",
    x = "Spesies",
    y = "Rata-rata Sepal.Length"
  ) +
  theme(plot.title = element_text(hjust = 0.5))

#3. Fungsi stat="identity" pada geom_bar()
#Parameter stat="identity" digunakan supaya tinggi batang pada grafik mengikuti nilai numerik yang sudah kita siapkan (misalnya nilai rata-rata). Jika tidak ditambahkan, geom_bar() secara bawaan akan menghitung jumlah data pada tiap kategori, bukan memakai nilai yang kita masukkan.

#4 
#Kode tersebut berfungsi untuk mengelompokkan data iris berdasarkan Species, lalu menghitung rata-rata Sepal.Length pada setiap spesies. Hasil perhitungan tersebut kemudian disimpan ke dalam variabel iris_summary dengan nama kolom baru mean_sepal.

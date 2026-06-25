data <- data.frame(
  nama = c("Andi", "Budi", "Citra", "Dewi", "Eka"),
  jurusan = c("TI", "SI", "TI", "TI", "SI"),
  nilai = c(85, 68, 92, 74, 60)
)

print(data)

#Tidak menggunakan dplyr
data[data$nilai > 70, c("nama", "nilai")]

#Menggunakan dplyr
library(dplyr)
hasil <- data %>%
  filter(nilai > 70) %>%
  select(nama, nilai)
print(hasil)

nilaiAkhir <- data %>%
  mutate(
    status_lulus = ifelse(nilai >= 70, "Lulus", "Tidak Lulus"),
    kategori_nilai = case_when(
      nilai >= 85 ~ "Sangat Baik",
      nilai >= 70 ~ "Baik",
      TRUE ~ "Kurang"
    )
  ) %>%
  select(nama, kategori_nilai)

nilaiAkhir

data(iris)

ringkasan_iris <- iris %>%
  group_by(Species) %>%
  summarise(
    mean_sepal = mean(Sepal.Length),
    sd_sepal   = sd(Sepal.Length),
    n = n()
  )

ringkasan_iris
ringkasan_iris <- data.frame(ringkasan_iris)
str(ringkasan_iris)

df.num <- iris[, 1:4]

mean(df.num$Sepal.Length)
sd(df.num$Sepal.Length)
min(df.num$Sepal.Length)
max(df.num$Sepal.Length)

summary(df.num)

dat.num <- iris %>%
  select(where(is.numeric))

dat.num %>%
  summarise(
    mean_sepal_length = mean(Sepal.Length),
    sd_sepal_length   = sd(Sepal.Length),
    min_sepal_length  = min(Sepal.Length),
    max_sepal_length  = max(Sepal.Length)
  )

library(ggplot2)

df <- mtcars
colnames(df)

ggplot(data = df, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(
    title = "Hubungan berat mobil dan efisiensi bahan bakar",
    x = "Berat Mobil (wt)",
    y = "Miles per Galon (mpg)"
  )

p <- ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point() +
  labs(
    x = "Panjang Sepal (cm)",
    y = "Panjang Petal (cm)",
    color = "Jenis Bunga"
  )
p

library(ggplot2)
library(dplyr)

iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(mean_sepal = mean(Sepal.Length))

barplot <- ggplot(
  data = iris_summary,
  aes(x = Species, y = mean_sepal, fill = Species)
) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = rainbow(length(unique(iris_summary$Species)))) +
  labs(
    title = "Rata-rata Panjang Sepal per Spesies",
    x = "Spesies",
    y = "Rata-rata Sepal.Length"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

barplot

library(dplyr)
library(ggplot2)

df_tinggi <- data.frame(
  tinggi_badan = c(150, 155, 160, 162, 165, 168, 170, 172, 175, 178,
                   180, 182, 185, 158, 164, 169, 171, 174, 176, 179)
)

str(df_tinggi)

statistik <- df_tinggi %>%
  summarise(
    jumlah_data = n(),
    minimum = min(tinggi_badan),
    maksimum = max(tinggi_badan),
    rata_rata = mean(tinggi_badan),
    median = median(tinggi_badan),
    simpangan_baku = sd(tinggi_badan)
  )

statistik <- data.frame(statistik)
statistik

ggplot(df_tinggi, aes(x = tinggi_badan)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white") +
  labs(
    title = "Distribusi Tinggi Badan",
    x = "Tinggi Badan (cm)",
    y = "Frekuensi"
  ) +
  theme_minimal()
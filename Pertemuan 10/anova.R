########################################################
# 📌 ANALISIS PERBEDAAN PM2.5 ANTAR LOKASI (ANOVA)
########################################################

# 1. GENERATE DATA (sesuai soal)
set.seed(123)

n <- 2160

data <- data.frame(
  id = 1:n,
  lokasi = sample(c("GG","CA","BS"), n, replace = TRUE),
  pm25 = rnorm(n, mean = 30, sd = 10),
  suhu = rnorm(n, mean = 28, sd = 2),
  kelembaban = rnorm(n, mean = 70, sd = 5),
  status_hujan = sample(c("Hujan","Tidak"), n, replace = TRUE),
  jam = sample(0:23, n, replace = TRUE)
)

# 2. LIHAT RINGKASAN DATA
summary(data)

# 3. CEK RATA-RATA PM2.5 PER LOKASI
aggregate(pm25 ~ lokasi, data = data, mean)

########################################################
# 🔥 4. UJI ANOVA
########################################################

# Model ANOVA
anova_model <- aov(pm25 ~ lokasi, data = data)

# Hasil ANOVA
summary(anova_model)

########################################################
# 📊 INTERPRETASI
########################################################

# Ambil p-value
p_value <- summary(anova_model)[[1]][["Pr(>F)"]][1]

cat("P-value =", p_value, "\n")

if(p_value < 0.05){
  cat("Kesimpulan: TOLAK H0 → Ada perbedaan signifikan antar lokasi\n")
} else {
  cat("Kesimpulan: GAGAL TOLAK H0 → Tidak ada perbedaan signifikan\n")
}

########################################################
# 🔥 5. UJI LANJUT (POST-HOC TEST)
########################################################

# Jika ANOVA signifikan, lanjut Tukey
tukey <- TukeyHSD(anova_model)

# Lihat hasil
tukey

########################################################
# 📊 6. VISUALISASI (WAJIB DI LAPORAN 🔥)
########################################################

# Install jika belum ada
if(!require(ggplot2)){
  install.packages("ggplot2")
  library(ggplot2)
}

# Boxplot
ggplot(data, aes(x=lokasi, y=pm25, fill=lokasi)) +
  geom_boxplot() +
  labs(
    title="Perbandingan PM2.5 Antar Lokasi",
    x="Lokasi",
    y="PM2.5"
  ) +
  theme_minimal()
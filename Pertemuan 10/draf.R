############################################################
# 📌 STUDI KASUS PROBABILITAS BAYES (BUG & SPAM)
# Penulis: Misael Christopher Haryanto
# Tujuan: Menghitung probabilitas bersyarat menggunakan Teorema Bayes
############################################################

###############################
# 🔥 KASUS 1: DETEKSI BUG
###############################

# Probabilitas awal (prior)
p_bug <- 0.05                 # 5% modul mengandung bug
p_tidak_bug <- 1 - p_bug      # 95% tidak ada bug

# Probabilitas deteksi
p_deteksi_jika_bug <- 0.90    # jika ada bug, sistem benar 90%
p_deteksi_jika_tidak <- 0.10  # jika tidak ada bug, false alarm 10%

# -------------------------------------------
# 📌 HITUNG TOTAL PROBABILITAS TERDETEKSI
# Rumus:
# P(Terdeteksi) = P(Terdeteksi|Bug)*P(Bug) + 
#                 P(Terdeteksi|TidakBug)*P(TidakBug)
# -------------------------------------------

p_terdeteksi <- (p_deteksi_jika_bug * p_bug) +
                (p_deteksi_jika_tidak * p_tidak_bug)

# -------------------------------------------
# 📌 HITUNG PROBABILITAS BAYES
# P(Bug | Terdeteksi)
# -------------------------------------------

p_bug_given_terdeteksi <- (p_deteksi_jika_bug * p_bug) / p_terdeteksi

# -------------------------------------------
# 📊 OUTPUT HASIL
# -------------------------------------------

cat("===== HASIL KASUS BUG =====\n")
cat("Probabilitas Bug jika Terdeteksi = ", p_bug_given_terdeteksi, "\n")
cat("Dalam persen = ", p_bug_given_terdeteksi * 100, "%\n\n")



###############################
# 🔥 KASUS 2: DETEKSI SPAM
###############################

# Probabilitas awal
p_spam <- 0.20                 # 20% email adalah spam
p_bukan_spam <- 1 - p_spam     # 80% bukan spam

# Probabilitas deteksi
p_deteksi_spam <- 0.90         # jika spam, benar 90%
p_false_positive <- 0.15       # jika bukan spam, salah deteksi 15%

# -------------------------------------------
# 📌 HITUNG TOTAL TERDETEKSI
# -------------------------------------------

p_terdeteksi_spam <- (p_deteksi_spam * p_spam) +
                     (p_false_positive * p_bukan_spam)

# -------------------------------------------
# 📌 HITUNG BAYES
# P(Spam | Terdeteksi)
# -------------------------------------------

p_spam_given_detected <- (p_deteksi_spam * p_spam) / p_terdeteksi_spam

# -------------------------------------------
# 📊 OUTPUT HASIL
# -------------------------------------------

cat("===== HASIL KASUS SPAM =====\n")
cat("Probabilitas Spam jika Terdeteksi = ", p_spam_given_detected, "\n")
cat("Dalam persen = ", p_spam_given_detected * 100, "%\n\n")



###############################
# 🔥 VISUALISASI (OPTIONAL - BIAR KEREN 🔥)
###############################

# Install ggplot2 jika belum ada
if(!require(ggplot2)){
  install.packages("ggplot2")
  library(ggplot2)
}

# Data untuk visualisasi
data_hasil <- data.frame(
  Kasus = c("Bug", "Spam"),
  Probabilitas = c(p_bug_given_terdeteksi, p_spam_given_detected)
)

# Plot bar chart
ggplot(data_hasil, aes(x=Kasus, y=Probabilitas, fill=Kasus)) +
  geom_bar(stat="identity") +
  labs(
    title="Perbandingan Probabilitas Bayes",
    y="Probabilitas",
    x="Kasus"
  ) +
  theme_minimal()



###############################
# 🔥 SIMULASI (BIAR MAKIN PAHAM 🔥🔥)
###############################

# Simulasi 10000 data untuk kasus bug
set.seed(123)

n <- 10000

# Generate apakah bug atau tidak
bug <- sample(c("Bug","Tidak"), n, replace=TRUE, prob=c(0.05, 0.95))

# Simulasi deteksi sistem
deteksi <- ifelse(
  bug == "Bug",
  sample(c("Terdeteksi","Tidak"), n, replace=TRUE, prob=c(0.9,0.1)),
  sample(c("Terdeteksi","Tidak"), n, replace=TRUE, prob=c(0.1,0.9))
)

# Gabungkan data
simulasi <- data.frame(bug, deteksi)

# Hitung probabilitas empiris
hasil_simulasi <- sum(simulasi$bug == "Bug" & simulasi$deteksi == "Terdeteksi") /
                  sum(simulasi$deteksi == "Terdeteksi")

cat("===== HASIL SIMULASI BUG =====\n")
cat("Probabilitas (Simulasi) = ", hasil_simulasi, "\n")
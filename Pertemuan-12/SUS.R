# 1. Data, 30 responden
# ==============================
sus_data <- data.frame(
  ID = paste0("R", 1:30),
  Q1  = c(4,3,5,4,2,4,5,3,4,4,3,4,5,4,3,4,5,3,4,4,3,4,5,4,3,4,5,3,4,4),
  Q2  = c(2,3,1,2,4,2,1,3,2,2,3,2,1,2,3,2,1,3,2,2,3,2,1,2,3,2,1,3,2,2),
  Q3  = c(5,4,5,4,3,5,5,4,4,5,4,5,5,4,4,5,5,4,4,5,4,5,5,4,4,5,5,4,4,5),
  Q4  = c(2,2,1,3,4,2,1,2,2,2,2,2,1,3,2,2,1,2,2,2,2,2,1,3,2,2,1,2,2,2),
  Q5  = c(4,4,5,4,2,4,5,4,4,4,4,4,5,4,3,4,5,4,4,4,4,4,5,4,3,4,5,4,4,4),
  Q6  = c(2,3,1,2,4,2,1,3,2,2,3,2,1,2,2,2,1,3,2,2,3,2,1,2,2,2,1,3,2,2),
  Q7  = c(5,4,5,4,3,5,5,4,4,5,4,5,5,4,4,5,5,4,4,5,4,5,5,4,4,5,5,4,4,5),
  Q8  = c(1,2,1,2,4,1,1,2,2,1,2,1,1,2,2,1,1,2,2,1,2,1,1,2,2,1,1,2,2,1),
  Q9  = c(4,3,5,4,2,4,5,3,4,4,3,4,5,4,3,4,5,3,4,4,3,4,5,4,3,4,5,3,4,4),
  Q10 = c(2,2,1,2,4,2,1,2,2,2,2,2,1,2,2,2,1,2,2,2,2,2,1,2,2,2,1,2,2,2)
)
sus_data
# 2. Ambil data numerik saja
# ==============================
sus_numeric <- sus_data[, -1]
# Pastikan numeric (aman untuk paper)
sus_numeric <- data.frame(lapply(sus_numeric, as.numeric))
sus_numeric


# 3. Fungsi SUS 
# ==============================
sus_score <- function(x) {
  score <- 0
  for (i in 1:10) {
    if (i %% 2 == 1) {
      score <- score + (x[i] - 1)
    } else {
      score <- score + (5 - x[i])
    }
  }
  return(score * 2.5)
}
# ==============================
# 4. Hitung Skor SUS
# ==============================
scores <- apply(sus_numeric, 1, sus_score)
scores
# 5. Gabungan Hasil
# ==============================
result <- data.frame(
  ID = sus_data$ID,
  SUS_Score = scores
)
print(result)


# 6. STATISTIK DESKRIPTIF
# ==============================
mean_score <- mean(scores)
sd_score   <- sd(scores)
min_score  <- min(scores)
max_score  <- max(scores)
cat("\nMean :", mean_score)
cat("\nSD   :", sd_score)
cat("\nMin  :", min_score)
cat("\nMax  :", max_score)

# 7. Uji Normalitas
# ==============================
shapiro.test(scores)

# 8. Uji Hipotesis (BENCHMARK 68)
# ==============================
t.test(scores, mu = 68, alternative = "greater")

       # 9. Visualisasi
       # ==============================
       hist(scores, 
            main = "Distribusi Skor SUS", 
            xlab = "Skor SUS", 
            col = "lightblue", 
            border = "black")
       
       # Menambahkan garis vertikal untuk benchmark 68
       abline(v = 68, col = "red", lwd = 2, lty = 2)
       


       
# ============================================================
# SOAL 1 — Sistem Deteksi Bug Otomatis
# ============================================================
# Sebuah perusahaan software memiliki sistem deteksi bug otomatis.
#
# Diketahui:
#   P(B)      = 0.05  → 5% modul mengandung bug kritis
#   P(D|B)    = 0.90  → Jika ada bug, sistem deteksi benar (true positive)
#   P(D|B^c)  = 0.10  → Jika tidak ada bug, sistem tetap alarm (false positive)
#
# Ditanya: P(B|D) = ?
#   Probabilitas modul benar-benar ada bug, jika terdeteksi bug
# ============================================================

cat("========================================================\n")
cat("  SOAL 1: Sistem Deteksi Bug Otomatis\n")
cat("========================================================\n\n")

# --- Nilai yang diketahui ---
p_B       <- 0.05          # P(B)   = P(modul punya bug kritis)
p_Bc      <- 1 - p_B       # P(B^c) = P(modul TIDAK punya bug)
p_D_B     <- 0.90          # P(D|B)   = true positive rate
p_D_Bc    <- 0.10          # P(D|B^c) = false positive rate

cat("Diketahui:\n")
cat("  P(B)     =", p_B,  "  → 5% modul ada bug kritis\n")
cat("  P(B^c)   =", p_Bc, "  → 95% modul tidak ada bug\n")
cat("  P(D|B)   =", p_D_B,  "  → true positive (deteksi benar)\n")
cat("  P(D|B^c) =", p_D_Bc, "  → false positive (alarm palsu)\n\n")

# --- Langkah 1: Hitung P(D) menggunakan Hukum Total Probabilitas ---
# P(D) = P(D|B)·P(B) + P(D|B^c)·P(B^c)
p_D <- (p_D_B * p_B) + (p_D_Bc * p_Bc)

cat("Langkah 1 — Hukum Total Probabilitas:\n")
cat("  P(D) = P(D|B)·P(B) + P(D|B^c)·P(B^c)\n")
cat("  P(D) =", p_D_B, "×", p_B, "+", p_D_Bc, "×", p_Bc, "\n")
cat("  P(D) =", p_D_B * p_B, "+", p_D_Bc * p_Bc, "\n")
cat("  P(D) =", p_D, "\n\n")

# --- Langkah 2: Terapkan Teorema Bayes ---
# P(B|D) = P(D|B)·P(B) / P(D)
p_B_D <- (p_D_B * p_B) / p_D

cat("Langkah 2 — Teorema Bayes:\n")
cat("  P(B|D) = P(D|B)·P(B) / P(D)\n")
cat("  P(B|D) =", p_D_B * p_B, "/", p_D, "\n")
cat("  P(B|D) =", round(p_B_D, 6), "\n\n")

cat(">>> JAWABAN SOAL 1:\n")
cat("    P(Bug kritis | Terdeteksi bug) =",
    round(p_B_D, 4), "≈", round(p_B_D * 100, 2), "%\n\n")
cat("    Interpretasi: Meskipun sistem akurat 90%, karena prevalensi\n")
cat("    bug hanya 5%, probabilitas modul benar-benar ada bug saat\n")
cat("    terdeteksi hanya ~32.14%. Alarm palsu sangat mendominasi.\n\n")

# ============================================================
# SOAL 2 — Sistem Klasifikasi Spam Email
# ============================================================
# Sebuah sistem email menggunakan model klasifikasi spam.
#
# Diketahui:
#   P(S)      = 0.20  → 20% email adalah spam
#   P(D|S)    = 0.90  → Jika spam, terdeteksi benar = 90%
#   P(D|S^c)  = 0.15  → Jika bukan spam, salah deteksi (false positive) = 15%
#
# Ditanya: P(S|D) = ?
#   Probabilitas email benar-benar spam, jika terdeteksi sebagai spam
# ============================================================

cat("========================================================\n")
cat("  SOAL 2: Sistem Klasifikasi Spam Email\n")
cat("========================================================\n\n")

# --- Nilai yang diketahui ---
p_S       <- 0.20          # P(S)   = P(email spam)
p_Sc      <- 1 - p_S       # P(S^c) = P(email bukan spam)
p_D_S     <- 0.90          # P(D|S)   = true positive rate
p_D_Sc    <- 0.15          # P(D|S^c) = false positive rate

cat("Diketahui:\n")
cat("  P(S)     =", p_S,  "  → 20% email adalah spam\n")
cat("  P(S^c)   =", p_Sc, "  → 80% email bukan spam\n")
cat("  P(D|S)   =", p_D_S,  "  → true positive (deteksi spam benar)\n")
cat("  P(D|S^c) =", p_D_Sc, "  → false positive (non-spam salah ditandai)\n\n")

# --- Langkah 1: Hitung P(D) menggunakan Hukum Total Probabilitas ---
# P(D) = P(D|S)·P(S) + P(D|S^c)·P(S^c)
p_D2 <- (p_D_S * p_S) + (p_D_Sc * p_Sc)

cat("Langkah 1 — Hukum Total Probabilitas:\n")
cat("  P(D) = P(D|S)·P(S) + P(D|S^c)·P(S^c)\n")
cat("  P(D) =", p_D_S, "×", p_S, "+", p_D_Sc, "×", p_Sc, "\n")
cat("  P(D) =", p_D_S * p_S, "+", p_D_Sc * p_Sc, "\n")
cat("  P(D) =", p_D2, "\n\n")

# --- Langkah 2: Terapkan Teorema Bayes ---
# P(S|D) = P(D|S)·P(S) / P(D)
p_S_D <- (p_D_S * p_S) / p_D2

cat("Langkah 2 — Teorema Bayes:\n")
cat("  P(S|D) = P(D|S)·P(S) / P(D)\n")
cat("  P(S|D) =", p_D_S * p_S, "/", p_D2, "\n")
cat("  P(S|D) =", round(p_S_D, 6), "\n\n")

cat(">>> JAWABAN SOAL 2:\n")
cat("    P(Spam | Terdeteksi spam) =",
    round(p_S_D, 4), "≈", round(p_S_D * 100, 2), "%\n\n")
cat("    Interpretasi: Jika email terdeteksi spam, probabilitas\n")
cat("    email memang spam adalah 60%. Artinya 40% email yang\n")
cat("    ditandai spam sebetulnya bukan spam (false positive).\n\n")

# ============================================================
# RINGKASAN HASIL
# ============================================================
cat("========================================================\n")
cat("  RINGKASAN HASIL\n")
cat("========================================================\n")
cat(sprintf("  Soal 1 — P(Bug | Terdeteksi) = %.4f (%.2f%%)\n",
            p_B_D, p_B_D * 100))
cat(sprintf("  Soal 2 — P(Spam | Terdeteksi) = %.4f (%.2f%%)\n",
            p_S_D, p_S_D * 100))
cat("========================================================\n")

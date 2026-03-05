# Membuat data penjualan
penjualan <- data.frame(
  tanggal  = as.Date(c(
    "2024-01-01", "2024-01-01",
    "2024-01-02", "2024-01-02",
    "2024-01-03", "2024-01-03",
    "2024-01-04", "2024-01-04"
  )),
  produk   = c(
    "Laptop", "Mouse",
    "Laptop", "Keyboard",
    "Mouse", "Keyboard",
    "Laptop", "Mouse"
  ),
  kategori = c(
    "Elektronik", "Aksesoris",
    "Elektronik", "Aksesoris",
    "Aksesoris", "Aksesoris",
    "Elektronik", "Aksesoris"
  ),
  jumlah   = c(2, 5, 1, 3, 4, 2, 3, 6),
  harga    = c(8000000, 150000, 8000000, 300000, 150000, 300000, 8000000, 150000)
)

# Hitung total pendapatan untuk setiap transaksi
penjualan <- penjualan %>%
  mutate(harga = harga,
         total = jumlah * harga)

# Hitung total pendapatan per kategori.
# Kelompokkan berdasarkan kategori, lalu hitung:
# (a) Total pendapatan,
# (b) Total unit terjual,
# (c) Rata-rata harga produk

kategori_summary <- penjualan %>%
  group_by(kategori) %>%
  summarise(
    total_pendapatan = sum(total),
    total_unit = sum(jumlah),
    rata_harga = mean(harga)
  ) %>%
  arrange(desc(total_pendapatan))


# Tentukan tanggal dengan pendapatan tertinggi.
# Hitung total pendapatan per tanggal, lalu tampilkan hanya tanggal dengan pendapatan tertinggi.
tanggal_summary <- penjualan %>%
  group_by(tanggal) %>%
  summarise(total_pendapatan = sum(total)) %>%
  arrange(desc(total_pendapatan))

tanggal_tertinggi <- tanggal_summary %>%
  slice(1)


# Filter kategori dengan total penjualan di atas 20 juta.
# Tampilkan hanya kategori yang memiliki total pendapatan lebih dari 20.000.000.
kategori_20juta <- kategori_summary %>%
  filter(total_pendapatan > 20000000)


# Buat analisis lanjutan.
# Tambahkan kolom baru bernama tipe_penjualan dengan aturan:
#  (a) Jika total transaksi 10.000.000 “Penjualan Besar”
#  (b) Jika total transaksi < 10.000.000 “Penjualan Kecil”
#  (c) Kemudian hitung jumlah transaksi untuk masing-masing tipe.

penjualan <- penjualan %>%
  mutate(
    tipe_penjualan = ifelse(total >= 10000000, "Penjualan Besar", "Penjualan Kecil")
  )

tipe_summary <- penjualan %>%
  group_by(tipe_penjualan) %>%
  summarise(jumlah_transaksi = n())
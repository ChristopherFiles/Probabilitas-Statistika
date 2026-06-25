#1. Menggunakan R sebagai kalkulator
15 + 25 * 2

#2. Membuat variabel (Assignment)
nilai_hadir <- 90
nilai_uts <- 80

#3.Operasiantarvariabel
nilai_akhir <- (nilai_hadir + nilai_uts)/ 2

#4.MenampilkanhasilkeConsole
nilai_akhir

#=====================================
# Membuat vektor sudut dari 0 hingga 2*pi
x <- seq(0, 2*pi, length.out=100)

# Menghitung nilai sinus dan cosinus
y_sin <- sin(x)
y_cos <- cos(x)

# Membuat grafik
plot(x, y_sin, type="l", col="blue", lwd=2,
     ylim=c(-1,1), xlab="Sudut (radian)", ylab="Nilai",
     main="Grafik Sinus dan Cosinus")

# Menambahkan kurva cosinus
lines(x, y_cos, col="red", lwd=2)

# Menambahkan legenda
legend("topright", legend=c("sin(x)","cos(x)"),
       col=c("blue","red"), lwd=2)

#=====================================
# Membuat vektor suhu dalam Celcius
celcius <- c(0, 10, 20, 30, 40)

# Menghitung konversi ke Fahrenheit
fahrenheit <- 9/5 * celcius + 32

# Membuat dataframe
conversion <- data.frame(Celcius=celcius, Fahrenheit=fahrenheit)

# Menampilkan tabel
print(conversion)
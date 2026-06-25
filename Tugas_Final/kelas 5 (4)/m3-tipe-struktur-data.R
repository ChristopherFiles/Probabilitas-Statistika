rm(list = ls())

67 * 200

hitung <- 67 * 200
hitung

x <- 5
class(x)
typeof(x)

y <- 5.25
class(y)

z <- 8L
typeof(z)

t <- 123
t > 67

countries <- c("Konoha", "Singapura")

nilai_ujian <- c(45, 78, 35, 80)

countries <- c("Indo", "China", "Japan", "Sokor", "Singapore")
countries
class(countries)
typeof(countries)
length(countries)
paste(countries, collapse = " -- ")

data_penduduk <- c(456, 758, 1278, 230, 125, 55)
data_penduduk

names(data_penduduk) <- c("jateng", "jabar", "jkt", "kaltim", "sumut")
data_penduduk

data_penduduk(3)
data_penduduk[1]
data_penduduk[c(1, 3)]

max(data_penduduk)
which.max(data_penduduk)

data_penduduk[-3]
data_penduduk[-c(2, 4)]

x <- c(10, 20, 30, 40, 50)
x

x[1]
x[c(1, 3, 5)]
x[-1]
x[-c(2, 4)]

x[x > 25]
x > 25

x[2:4]

nilai <- c(Ferdi = 80, Tiara = 90, Fufufafa = 85)
nilai

nilai["Tiara"]

d1 <- c(55, 78, 90, 85, 80)
d1

which(d1 == 90)

d1 <- d1[-3]

ID_site <- c("A1.01", "A1.02", "B1.01", "B1.02")
Soil_PH <- c(5.6, 7.3, 4.1, 6.0)
num_spesies <- c(17, 23, 15, 7)
Treatment <- c("Fert", "Ferr", "No_Fert", "No_Fert")

ID_site
Soil_PH
Treatment
ID_site

tbl_pengamatan <- data.frame(
  ID_site,
  Soil_PH,
  num_spesies,
  Treatment
)

tbl_pengamatan

str(tbl_pengamatan)

tbl_pengamatan_numerik <- tbl_pengamatan[c(2, 3), ]
tbl_pengamatan_numerik

tbl_pengamatan_numerik <- tbl_pengamatan[, c(2, 3)]
tbl_pengamatan_numerik

summary(tbl_pengamatan_numerik)
summary(tbl_pengamatan)

mtcars

dim(mtcars)

names(mtcars)

length(names(mtcars))

row.names(mtcars)
rownames(mtcars)
colnames(mtcars)

head(mtcars)
head(mtcars, 1)

?mtcars

str(mtcars)

mtcars$hp

v_hp <- mtcars$hp
v_hp

mtcars[, 3]

# menampilkan dataset mtcars baris 2-5
# kolom 4,5,6
# disimpan dalam objek : analisa_1

analisa_1 <- mtcars[c(2:5), c(4:6)]
analisa_1

mean(mtcars$mpg)

rataan_mpg <- mean(mtcars$mpg)

rataan_mpg <- round(mean(mtcars$mpg), 2)
rataan_mpg

mtcars[mtcars$mpg > rataan_mpg, ]

state.x77

str(state.x77)

state.x77 <- data.frame(state.x77)

# merubah struktur objek menjadi data frame

head(state.x77)

names(state.x77)

# mengambil kolom atau variabel Income

income <- state.x77$Income

max(income)
min(income)

incomeMax <- which.max(income)
incomeMin <- which.min(income)

row.names(state.x77)[incomeMax]
row.names(state.x77)[incomeMin]

summary(income)

mtcars

str(mtcars)
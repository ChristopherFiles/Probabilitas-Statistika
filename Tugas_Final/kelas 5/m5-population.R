#---------------------------------------------------------#
#Nama: m5-populasi                                        #
#Tanggal: 26 Februari 2026                                #
#Mencari Negara Bagian dengan Tingkat Pendapatan Tertinggi#
#---------------------------------------------------------#

df <- state.x77
str(df)
df <- data.frame(df)

maxPopulation <- which.max(df$Population)
rownames(df)
rownames(df)[maxPopulation]

minIncome <- which.min(df$Income)
rownames(df)
rownames(df)[minIncome]

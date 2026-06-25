library(ggplot2)
mtcars
df <- mtcars
colnames(df)
ggplot(data = df, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth() +
  
  labs(
    title = "Hubungan Berat Mobil dan Efisiensi Bahan Bakar",
    x = "Berat Mobil (wt)",
    y = "Miles per Gallon (mpg)"
  )  

library(ggplot2)
p <- ggplot(iris, aes(Sepal.Length, Petal.Length,
                      color = Species)) +
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
  summarise(mean_sepal =
              mean(Sepal.Length))
barplot <- ggplot(data = iris_summary,
                  aes(x = Species, y = mean_sepal)) +
  geom_bar(stat = "identity", fill = "steelblue") 
labs(
  title = "Rata-rata Panjang sepal per Spesies",
  x = "spesies",
  y = "Rata-rata Sepal.Length" 
) +
  theme(
    plot.title = element_text(hjust = 0.5)
  )
barplot
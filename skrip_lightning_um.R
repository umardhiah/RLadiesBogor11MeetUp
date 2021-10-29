#Berbagai package dan fungsi R untuk memudahkan hidupmu!#

# 1. vtable ####
#install.packages("vtable")
library(vtable)

View(iris)
#akan membuka data iris di tab baru
#agak sulit misalnya kita ingin membuat subset data misalnya
#terutama bisa judul kolomnya lebih dari 20 misalnya

names(iris)
vtable(iris)
vtable(iris, index=T)

#kita ingin memilih Sepal Length dan Petal Length (kolom 1, 3)
new.iris <- iris[c(1,3)]

# 2. beeper ####
#install.packages("beepr")
library(beepr)

#suatu hari saya harus me-run skrip dengan bootstrapping
#ini bisa berlangsung lebih dari 5 menit (kalau beruntung)
#dan kadang saya harus mengerjakan tugas lain
#untungnya ada package ini

# contoh
# generate 10000 standard normal observations
set.seed(1)
n <- 5000
x <- rnorm(n)

# nonparametric bootstrap
#install.packages("nptest")
library(nptest)
npbs <- np.boot(x = x, statistic = median)
beep()

# 3. ggarrange ####
#install.packages("ggpubr")
library(ggpubr)

#salah satu tugas yang paling sering saya temui adalah
#menggabungkan sejumlah plot di dalam satu frame
#salah satu teknik andalan adalah menggunakan
#fungsi ggarrange

#kita buat plot pertama, simpan sebagai 'p1'
p1 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point()
#lalu buat plot kedua, simpan sebagai 'p2'
p2 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point() + facet_wrap( ~ cyl, ncol=2, scales = 'free') +
  guides(colour='none') +
  theme()
#selanjutnya, kita gabungkan keduanya, dan beri label 'a' dan 'b'
ggarrange(p1, p2, widths = c(2,1), labels = c('a', 'b'),
          ncol=2, nrow=1)
ggarrange(p1, p2, widths = c(2,1), labels = c('a', 'b'),
          ncol=1, nrow=2)
# 4. themes ####
#install.packages("ggplot")
library(ggplot)

#salah satu tugas yang juga sering saya lakukan adalah
#mengubah latar belakang plot dan memilih kira-kira
#mana yg paling tepat untuk gambar yg sedang saya kerjakan

#biasanya saya banyak bermain di penggunaan themes

#beri label dulu untuk variabel dalam dataset mtcars
mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V-shaped", "Straight"))
  am <- factor(am, labels = c("Automatic", "Manual"))
  cyl  <- factor(cyl)
  gear <- factor(gear)
})

p1<-ggplot(mtcars2) +
  geom_point(aes(x = wt, y = mpg, colour = gear)) +
  labs(
    title = "Fuel economy declines as weight increases",
    subtitle = "(1973-74)",
    caption = "Data from the 1974 Motor Trend US magazine.",
    tag = "Figure 1",
    x = "Weight (1000 lbs)",
    y = "Fuel economy (mpg)",
    colour = "Gears"
  )
p1

#sekarang, kita ubah themes-nya
p1+theme_bw()
p1+theme_linedraw()
p1+theme_light()
p1+theme_dark()
p1+theme_minimal()
p1+theme_classic()
p1+theme_void()

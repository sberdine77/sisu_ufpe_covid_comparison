setwd("/Users/savioberdine/Library/CloudStorage/OneDrive-Personal/Documentos/UFRPE/AnaliseDeDados/sisu_ufpe_covid_comparison")
install.packages("plotly")
library(plotly)
install.packages("dplyr")
library(dplyr)


data_2020 <- read.csv('discentes-ingressos-sisu-2020-ufpe.csv')
df <- apply(data_2020, 2, as.character)
Encoding(df)  <- "UTF-8"
data_2020 <- as.data.frame(df)
#View(data_2020)

data_2021 <- read.csv('discentes-ingressos-sisu-2021-ufpe.csv')
df <- apply(data_2021, 2, as.character)
Encoding(df)  <- "UTF-8"
data_2021 <- as.data.frame(df)
View(data_2021)

#-------------

students_by_course_2020 <- data_2020 %>%
  group_by(CURSO) %>%
  summarise(
    QtdAlunos = n()
  )

#View(students_by_course_2020)

#-------------

students_by_course_2021 <- data_2021 %>%
  group_by(CURSO) %>%
  summarise(
    QtdAlunos = n()
  )

#View(students_by_course_2021)

#-------------

students_by_father_education_2020 <- data_2020 %>%
  filter(ESCOLARIDADE_PAI != "") %>%
  group_by(ESCOLARIDADE_PAI) %>%
  summarise(
    QtdAlunos = n(),
    PercAlunos = (n()/nrow(data_2020))
  )

#View(students_by_father_education_2020)
par(mar = c(5, 10, 5, 5))
barplot(main = "2020 - Estudantes de acordo com a educação do pai", 
        students_by_father_education_2020$PercAlunos, 
        names.arg = students_by_father_education_2020$ESCOLARIDADE_PAI, 
        horiz = TRUE, 
        las = 1,
        cex.names = 0.5)
# graph <- plot_ly(data = students_by_father_education_2020, x = ~ESCOLARIDADE_PAI, y = ~QtdAlunos)
# graph

#-------------

students_by_father_education_2021 <- data_2021 %>%
  filter(ESCOLARIDADE_PAI != "") %>%
  group_by(ESCOLARIDADE_PAI) %>%
  summarise(
    QtdAlunos = n(),
    PercAlunos = (n()/nrow(data_2021))
  )

#View(students_by_father_education_2021)
barplot(main = "2021 - Estudantes de acordo com a educação do pai", 
        students_by_father_education_2021$PercAlunos, 
        names.arg = students_by_father_education_2021$ESCOLARIDADE_PAI, 
        horiz = TRUE, 
        las = 1,
        cex.names = 0.5)


#-------------

students_by_mother_education_2020 <- data_2020 %>%
  filter(ESCOLARIDADE_MAE != "") %>%
  group_by(ESCOLARIDADE_MAE) %>%
  summarise(
    QtdAlunos = n(),
    PercAlunos = (n()/nrow(data_2020))
  )

#View(students_by_mother_education_2020)
barplot(main = "2020 - Estudantes de acordo com a educação da mãe", 
        students_by_mother_education_2020$PercAlunos, 
        names.arg = students_by_mother_education_2020$ESCOLARIDADE_MAE, 
        horiz = TRUE, 
        las = 1,
        cex.names = 0.5)
# graph <- plot_ly(data = students_by_father_education_2020, x = ~ESCOLARIDADE_PAI, y = ~QtdAlunos)
# graph

#-------------

students_by_mother_education_2021 <- data_2021 %>%
  filter(ESCOLARIDADE_MAE != "") %>%
  group_by(ESCOLARIDADE_MAE) %>%
  summarise(
    QtdAlunos = n(),
    PercAlunos = (n()/nrow(data_2021))
  )

#View(students_by_mother_education_2021)
barplot(main = "2021 - Estudantes de acordo com a educação da mãe", 
        students_by_mother_education_2021$PercAlunos, 
        names.arg = students_by_mother_education_2021$ESCOLARIDADE_MAE, 
        horiz = TRUE, 
        las = 1,
        cex.names = 0.5)


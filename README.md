📊 Analyse des données RH avec R
Ce projet propose une analyse exploratoire des données RH à l’aide du langage R, en se concentrant sur la variable satisfaction_level et son impact sur la variable left, qui indique si un employé a quitté l’entreprise.

🗂️ Structure du projet
Le projet suit les étapes classiques d’analyse de données :

1.Chargement des données

2.Analyse univariée

3.Analyse bivariée

4.Visualisations et interprétations


📁 Dataset

•Nom du fichier : HR_comma_sep.csv

•Colonnes principales :

   satisfaction_level
      
   last_evaluation
      
   number_project
      
   average_montly_hours
      
   time_spend_company
      
   Work_accident
      
   left (employé a quitté l'entreprise ou non)
      
   promotion_last_5years
      
   department
      
   salary
  

🧪 1. Chargement des données

      library(readr)
      
      HR_comma_sep <- read_csv("HR_comma_sep.csv")
      
      View(HR_comma_sep)

📊 2. Analyse univariée

✏️ Dimensions et aperçu

      dim(HR_comma_sep)
      
      summary(HR_comma_sep)

📈 Statistiques de la variable satisfaction_level

• Moyenne, médiane, min, max, variance, écart-type, quantiles.

      mean(HR_comma_sep$satisfaction_level)
      
      median(HR_comma_sep$satisfaction_level)
      
      min(HR_comma_sep$satisfaction_level)
      
      max(HR_comma_sep$satisfaction_level)
      
      quantile(HR_comma_sep$satisfaction_level)
      
      var(HR_comma_sep$satisfaction_level)
      
      sd(HR_comma_sep$satisfaction_level)

🔍 Interprétation :
L’écart-type élevé suggère une grande dispersion de la satisfaction entre les employés.

🧷 Variable catégorique : salary
      
      table(HR_comma_sep$salary)

📌 La catégorie "low" est la plus fréquente, suivie de "medium".

🔗 3. Analyse bivariée

🔄 Corrélation

      cor(HR_comma_sep$satisfaction_level, HR_comma_sep$left)

📉 Régression linéaire

      linearMod <- lm(left ~ satisfaction_level, data=HR_comma_sep)
      
      summary(linearMod)

Modèle estimé :
left = 0.6458 - 0.6653 * satisfaction_level

📊 4. Visualisations

🔵 Scatter plot

      scatter.smooth(x=HR_comma_sep$satisfaction_level, y=HR_comma_sep$left, main="Satisfaction vs Départ")

🌈 Density Plots

      plot(density(HR_comma_sep$satisfaction_level))
      
      plot(density(HR_comma_sep$left))

📦 Boxplots

      boxplot(HR_comma_sep$satisfaction_level)
      
      boxplot(HR_comma_sep$left)

🧠 Interprétations générales

•  satisfaction_level est une variable continue bien distribuée.

•  left est plus constante, et a peu d’impact visuel sur d'autres variables.

•  Il y a une corrélation négative entre la satisfaction et le départ des employés.

🚀 À propos

•  📌 Langage : R

•  📁 Fichier de données : HR_comma_sep.csv

•  🔧 Packages utilisés : readr, e1071


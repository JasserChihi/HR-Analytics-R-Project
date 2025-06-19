# 📊 Analyse des Données RH avec R

Ce projet propose une **analyse exploratoire des données RH** à l’aide du langage **R**, en se concentrant sur la variable `satisfaction_level` et son impact sur la variable `left`, qui indique si un employé a quitté l’entreprise. L'objectif est de mieux comprendre les facteurs influençant la rétention ou le départ des collaborateurs.

---

## 🗂️ Structure du projet

Le projet suit les étapes classiques de l’analyse de données :

1. **Chargement des données**
2. **Analyse univariée**
3. **Analyse bivariée**
4. **Visualisations et interprétations**



---

## 📁 Jeu de données

- **Nom du fichier** : `HR_comma_sep_dataset.csv`
- **Colonnes principales** :
  - `satisfaction_level`
  - `last_evaluation`
  - `number_project`
  - `average_montly_hours`
  - `time_spend_company`
  - `Work_accident`
  - `left` *(employé a quitté l'entreprise ou non)*
  - `promotion_last_5years`
  - `department`
  - `salary`

---

## 🧪 1. Chargement des données

```r
library(readr)
HR_comma_sep <- read_csv("data/HR_comma_sep.csv")
View(HR_comma_sep)
```

---

## 📊 2. Analyse univariée

### ✏️ Dimensions et aperçu
```r
dim(HR_comma_sep)
summary(HR_comma_sep)
```

### 📈 Statistiques de la variable satisfaction_level
- Moyenne, médiane, min, max, variance, écart-type, quantiles :
```r
mean(HR_comma_sep$satisfaction_level)
median(HR_comma_sep$satisfaction_level)
min(HR_comma_sep$satisfaction_level)
max(HR_comma_sep$satisfaction_level)
quantile(HR_comma_sep$satisfaction_level)
var(HR_comma_sep$satisfaction_level)
sd(HR_comma_sep$satisfaction_level)
```
> Un écart-type élevé suggère une grande dispersion de la satisfaction entre les employés.

### 🧷 Variable catégorique : salary
```r
table(HR_comma_sep$salary)
```
> La catégorie "low" est la plus fréquente, suivie de "medium".

---

## 🔗 3. Analyse bivariée

### 🔄 Corrélation
```r
cor(HR_comma_sep$satisfaction_level, HR_comma_sep$left)
```

### 📉 Régression linéaire
```r
linearMod <- lm(left ~ satisfaction_level, data=HR_comma_sep)
summary(linearMod)
```
> Exemple de modèle estimé :  
> `left = 0.6458 - 0.6653 * satisfaction_level`  
> On observe une corrélation négative entre la satisfaction et le départ des employés.

---

## 📊 4. Visualisations

### 🔵 Scatter Plot
```r
scatter.smooth(x=HR_comma_sep$satisfaction_level, y=HR_comma_sep$left, main="Satisfaction vs Départ")
```

### 🌈 Density Plots
```r
plot(density(HR_comma_sep$satisfaction_level), main="Density: Satisfaction Level")
plot(density(HR_comma_sep$left), main="Density: Départ")
```

### 📦 Boxplots
```r
boxplot(HR_comma_sep$satisfaction_level, main="Boxplot: Satisfaction Level")
boxplot(HR_comma_sep$left, main="Boxplot: Départ")
```

---

## 🧠 Interprétations générales

- `satisfaction_level` est une variable continue bien distribuée.
- `left` est binaire, représentant le départ ou non.
- On observe une **corrélation négative** entre la satisfaction et le départ des employés : plus la satisfaction est faible, plus le risque de départ augmente.
- L’analyse peut être enrichie par des analyses multivariées et des visualisations interactives (ex : avec `ggplot2`).

---

## 🚀 Pour démarrer

1. **Cloner le dépôt :**
   ```bash
   git clone https://github.com/JasserChihi/HR-Analytics-R-Project.git
   cd HR-Analytics-R-Project
   ```
2. **Installer les packages nécessaires dans R :**
   ```r
   install.packages(c("readr", "e1071"))
   ```
3. **Charger et explorer le jeu de données avec les scripts fournis.**

---

## 🔧 Packages utilisés

- `readr`
- `e1071`
- *(Possibilité d'ajouter `ggplot2`, `dplyr` pour approfondir l'analyse)*

---

## 📄 À propos

Projet d’analyse exploratoire de données RH en R.  
Auteur : [JasserChihi](https://github.com/JasserChihi)

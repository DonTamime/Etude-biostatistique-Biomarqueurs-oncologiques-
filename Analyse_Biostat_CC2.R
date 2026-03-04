x = 2 
x = x + 2 
x = sd(9)

hist(oiseaux$OR.egg.volume, main = "Lamia la plus belle", col = "pink")
oiseaux$Plot = as.factor(oiseaux$Plot) #Pour transformer une variable qualitative en variable quantitative
summary(oiseaux)


length(which(oiseaux$OR.egg.volume > 1723))
       
oiseaux$Male.number.of.attacks.F = as.factor(oiseaux$Male.number.of.attacks) #La on creer une nouvelle variable pour avoir une variable qualitatif

summary(oiseaux$Male.number.of.attacks.F)

barplot(table(oiseaux$Plot), col = "blue", main = "Lagsika x Djagadishwaran") #Barplot doit etre avec table pcq je sai ssplus mais je le mettrai 

oiseaux = subset(oiseaux, subset = oiseaux$Plot != "tri") # != -- different, donc on veut extraire du donne jeu doiseau que lq vqriqble plosoit different de la varraible tri , donc on pred 2 variable 

oiseaux = oiseaux[oiseaux$Plot != "tri" ,] #autre facon de lecrire 

summary(oiseaux$Plot)

#mtn on va vouloir enlever la modalite aui nous sert a rien donc ici tri 

oiseaux$Plot = droplevels(oiseaux$Plot)

barplot(table(oiseaux$Plot), col = "blue", main = "Lagsika x Djagadishwaran")

oiseaux = subset(oiseaux, select=c(12, 34, 30, 49, 5, 9, 6, 1))#la on conserve ubniqumenet les colonnes qui nous interessent

oiseaux = oiseaux[, c(12, 34, 30, 49, 5, 9, 6, 1)]

oiseaux = na.omit(oiseaux)#Ca enleve tous les valeurs NA

summary(oiseaux$CF.total.reflectance)
summary(oiseaux$Male.number.of.attacks.F)
summary(oiseaux$Plot)

shapiro.test(na.omit(oiseaux$CF.total.reflectance))


karel_data <- subset(oiseaux, Plot == "Karel")


sluka_data <- subset(oiseaux, Plot == "sluka")

zmola_data = subset(oiseaux, Plot == "zmola")


# Répète pour les autres groupes si tu en as d'autres
t.test(karel_data$CF.total.reflectance, sluka_data$CF.total.reflectance, paired = FALSE, var.equal = FALSE)

t.test(karel_data$CF.total.reflectance, zmola_data$CF.total.reflectance)


summary(oiseaux)
plot(oiseaux$Plot, oiseaux$CF.total.reflectance)
table(oiseaux$Plot, oiseaux$CF.total.reflectance)


#1.4 

bartlett.test(oiseaux$CF.total.reflectance ~ oiseaux$Plot) #les variance entre tous les groupes osnt egales 
#on va donc uitliser le test non apparie de student



t.test(subset(oiseaux$CF.total.reflectance, subset = oiseaux$Plot == "sluka"), subset(oiseaux$CF.total.reflectance, subset = oiseaux$Plot == "Karel"), paired = FALSE, var.equal = TRUE)
t.test(subset(oiseaux$CF.total.reflectance, subset = oiseaux$Plot == "zmola"), subset(oiseaux$CF.total.reflectance, subset = oiseaux$Plot == "Karel"), paired = FALSE, var.equal = TRUE)
#difference entre slukla et zmola 

t.test(oiseaux$CF.total.reflectance, oiseaux$OR.total.reflectance, paired = TRUE) #pas de diff singifcative de valeur entre les 2 jeux de donnee 



#1.5 

boxplot(CF.total.reflectance ~ Plot, data = oiseaux, main = "Réflectance totale par Lieu",
        xlab = "Lieu (Plot)",
        ylab = "Réflectance") 

anova = aov(CF.total.reflectance ~ Plot, data = oiseaux)

summary(anova)


#1.6 

wilcox.test(oiseaux$CF.total.reflectance, oiseaux$OR.total.reflectance, paired = TRUE)

zmolax = as.numeric


zmolaEGG = oiseaux$OR.egg.volume[oiseaux$Plot == "zmola"]
karelEGG = oiseaux$OR.egg.volume[oiseaux$Plot == "Karel"]
slukaEGG = oiseaux$OR.egg.volume[oiseaux$Plot == "sluka"]

wilcox.test(karelEGG, zmolaEGG)
wilcox.test(slukaEGG, karelEGG)
#Pour l'instant, peu importe où l'on regarde (Karel, Zmola ou Sluka), le volume des œufs semble être identique. Le lieu n'influence pas la taille de l'œuf.


#On va faire  l'équivalent de l'ANOVA quand on ne peut pas supposer que la distribution est Normale.
kruskal.test(OR.egg.volume ~ Plot, data = oiseaux)
#Si p-value > 0.05 : Il n'y a aucune différence significative entre les 3 groupes. Les volumes d'œufs sont globalement similaires partout.
#Si p-value < 0.05 : Il y a une différence significative quelque part. Au moins un des lieux a des volumes d'œufs différents des autres.

#1.8
plot(oiseaux$CF.total.reflectance, oiseaux$OR.total.reflectance,
     main = "Corrélation entre Réflectances (OR vs CF)",
     xlab = "CF Reflectance",
     ylab = "OR Reflectance",
     pch = 19)
#permet dajouter la courbe de regression
abline(lm(OR.total.reflectance ~ CF.total.reflectance, data = oiseaux), col = "red")
#1.8 2
modele1 <- lm(OR.total.reflectance ~ CF.total.reflectance, data = oiseaux) 
summary(modele1) # pente positive (0.244) mais la relation est très faible et statistiquement non significative (p > 0.05).

modele2 = lm(OR.egg.volume ~ CF.total.reflectance, data = oiseaux)  #a = interceot ici 1,181e+04 et x egale 2,44e-01 (pas sur pour x, cest peut etre b)
summary(modele2) 


modele3 = lm(OR.egg.volume ~ CF.total.reflectance + Plot, data = oiseaux) #pas beosin de faire
summary(modele3)


#1.9 
oiseaux$Attaque_Presence = ifelse(oiseaux$Male.number.of.attacks > 0, 1, 0)
head(oiseaux$Attaque_Presence)


mean(oiseaux$Attaque_Presence)

tapply(oiseaux$Attaque_Presence, oiseaux$Plot, mean)


#1.9 question 2 

# On stocke le tableau de comptage dans un objet 'tab'
tab <- table(oiseaux$Plot, oiseaux$Attaque_Presence)


print(tab)

prop.test(tab[c("Karel", "sluka"), ])

prop.test(tab[c("Karel", "zmola"), ])


prop.test(tab[c("sluka", "zmola"), ])


p




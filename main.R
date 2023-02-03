library(factoextra)
library(FactoMineR)
library(openxlsx)
library(corrplot)

DAT <- read.xlsx("Segmentation.xlsx")

ACP <- PCA(DAT[,-c(1)])

print(ACP)

## eigenvalue
E.V <- get_eigenvalue(ACP)

fviz_eig(ACP, addlabels = TRUE, ylim = c(0, 40))

## coordonnées, corrélation entre variables et les axes, cosinus-carré et contributions

ACPv <- get_pca_var(ACP)

corrplot(ACPv$cos2, is.corr=FALSE)

# Cos2 total des variables sur Dim.1 et Dim.2
fviz_pca_var(ACP, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Évite le chevauchement de texte
             )

# contribution
head(ACPv$contrib, 4)

fviz_pca_var(ACP, col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07")
             )

## Coordonne
fviz_pca_var(ACP, col.var = "coord",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07")
             )










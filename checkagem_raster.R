############################ Checkagem dos raster ############################

# Carregando Pacotes
library(raster)

# Acessando o raster

## Altura de 5m
bands5m = stack("mapa_soja_5m_rec.tif") # Acessando as bandas RGB
bands5m

raster5m = raster("mapa_soja_5m_rec.tif") # Acessando raster
raster5m

## Altura de 10m
bands10m = stack("mapa_soja_10m_rec.tif") # Acessando as bandas RGB
bands10m

raster10m = raster("mapa_soja_10m_rec.tif") # Acessando raster
raster10m

## Altura de 15m
bands15m = stack("mapa_soja_15m_rec.tif") # Acessando as bandas RGB
bands15m

raster15m = raster("mapa_soja_15m_rec.tif") # Acessando raster
raster15m

# Verificando tamanho do raster

## Altura de 5m
value5m = values(raster5m)
length(value5m) ## Tamanho do Raster
sum(value5m == 0) ## Quantidade de NA's
sum(value5m != 0) ## Quantdade de Dados
res(raster5m) ## Verificando a resolução do pixel


windows() ## Verificando o raster
plot(raster5m, axes = FALSE, xlab = "", ylab = "")
dev.off()

## Altura de 10m
value10m = values(raster10m)
length(value10m) ## Tamanho do Raster
sum(value10m == 0) ## Quantidade de NA's
sum(value10m != 0) ## Quantdade de Dados
res(raster10m) ## Verificando a resolução do pixel

windows() ## Verificando o raster
plot(raster10m, axes = FALSE, xlab = "", ylab = "")
dev.off()

## Altura de 15m
value15m = values(raster15m)
length(value15m) ## Tamanho do Raster
sum(value15m == 0) ## Quantidade de NA's
sum(value15m != 0) ## Quantdade de Dados
res(raster15m) ## Verificando a resolução do pixel

windows() ## Verificando o raster
plot(raster15m, axes = FALSE, xlab = "", ylab = "")
dev.off()

# Manipulando as bandas do raster

## Altura de 5m
names(bands5m) ## Verificando nome das bandas
name_band = c("R", "G", "B", "Alpha") ## Armazenado o novo nome das bandas
bands5m = setNames(bands5m, name_band) # Configurando o nome das bandas
names(bands5m) # Verificando o novo nome das bandas

## Altura de 10m
names(bands10m) ## Verificando nome das bandas
bands10m = setNames(bands10m, name_band) # Configurando o nome das bandas
names(bands10m) # Verificando o novo nome das bandas

## Altura de 5m
names(bands15m) ## Verificando nome das bandas
bands15m = setNames(bands15m, name_band) # Configurando o nome das bandas
names(bands15m) # Verificando o novo nome das bandas

## Verificando bandas RGB dos Rasters
windows()
layout(matrix(c(1:9), nrow = 3, byrow = TRUE))

image(bands5m[[1]], main = "(A.1) - R", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
image(bands5m[[2]], main = "(A.2) - G", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
image(bands5m[[3]], main = "(A.3) - B", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)

image(bands10m[[1]], main = "(B.1) - R", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
image(bands10m[[2]], main = "(B.2) - G", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
image(bands10m[[3]], main = "(B.3) - B", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)

image(bands15m[[1]], main = "(C.1) - R", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
image(bands15m[[2]], main = "(C.2) - G", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
image(bands15m[[3]], main = "(C.3) - B", axes = FALSE, xlab = "", ylab = "",
      cex.main = 2)
dev.off()

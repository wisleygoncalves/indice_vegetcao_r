###################### Índices de Vegetação e Padronização ######################

# Carregando Pacotes

if(!require(raster))
  install.packages("raster")
library(raster)

################################## Funções #####################################

# Indices de Vegetacao

## ExR
exr = function(files) {
  exr_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    exr_iv = 1.4 * x[[1]] - x[[2]]
    exr_list[[file]] = exr_iv
    print(exr_list[[file]])
  }
  return(exr_list)
}

## VDVI
vdvi = function(files) {
  vdvi_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    vdvi_iv = (2 * x[[2]] - x[[1]] - x[[3]]) / (2 * x[[2]] + x[[1]] + x[[3]])
    vdvi_list[[file]] = vdvi_iv
    print(vdvi_list[[file]])
  }
  return(vdvi_list)
}

## NGRDI
ngrdi = function(files) {
  ngrdi_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    ngrdi_iv = (x[[2]] - x[[1]]) / (x[[2]] + x[[1]])
    ngrdi_list[[file]] = ngrdi_iv
    print(ngrdi_list[[file]])
  }
  return(ngrdi_list)
}

## TGI
tgi = function(files) {
  tgi_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    tgi_iv = x[[2]] - (0.39 * x[[1]]) - (0.61 * x[[3]])
    tgi_list[[file]] = tgi_iv
    print(tgi_list[[file]])
  }
  return(tgi_list)
}

## ExG
exg = function(files) {
  exg_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    exg_iv = 2 * x[[2]] - x[[1]] - x[[3]]
    exg_list[[file]] = exg_iv
    print(exg_list[[file]])
  }
  return(exg_list)
}

## GLI
gli = function(files) {
  gli_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    gli_iv = ((x[[2]] - x[[1]]) + (x[[2]] - x[[3]])) /
      (x[[2]] + x[[1]] + x[[2]] + x[[3]])
    gli_list[[file]] = gli_iv
    print(gli_list[[file]])
  }
  return(gli_list)
}

## VARI
vari = function(files) {
  vari_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    vari_iv = (x[[2]] - x[[1]]) / (x[[2]] + x[[1]] - x[[3]])
    vari_list[[file]] = vari_iv
    print(vari_list[[file]])
  }
  return(vari_list)
}

## bgi
bgi = function(files) {
  bgi_list = list()
  for (file in files) {
    raster_file = paste(file, '.tif', sep = '') 
    x = stack(raster_file)
    bgi_iv = x[[3]] / x[[2]]
    bgi_list[[file]] = bgi_iv
    print(bgi_list[[file]])
  }
  return(bgi_list)
}

# Renomear Raster
rename = function(z, y) {
  rename = list()
  for (i in 1:length(z)) {
    rename[[i]] = setNames(z[[i]], y[i])
    print(rename[[i]])
  }
  
  return(rename)
}

# Salvar Índices
sv = function(files) {
  sv = for (file in files) {
    sv = writeRaster(x = file, filename = paste(names(file), ".tif", sep = ""),
                     overwrite = T, format = 'GTiff')
    print(sv)
    }
  return(sv)
}

###################### Armazenando nomes de arquivos ###########################

# Base de dados - Geral
data = c('mapa_soja_5m_rec', 'mapa_soja_10m_rec', 'mapa_soja_15m_rec')

########################### Calculando os Índices ##############################

# ExR
EXR = exr(data) # Calcular os Índices de Vegetação

files = c('exr5', 'exr10', 'exr15')

RENAME = rename(EXR, files)

sv(RENAME) ## Salvando os arquivos

rm(EXR, files, RENAME, exr) # Limpando memória

# VDVI
VDVI = vdvi(data) # Calcular os Índices de Vegetação

files = c('vdvi5', 'vdvi10', 'vdvi15')

RENAME = rename(VDVI, files)

sv(RENAME) ## Salvando os arquivos

rm(VDVI, files, RENAME, vdvi) # Limpando memória

# NGRDI
NGRDI = ngrdi(data) # Calcular os Índices de Vegetação

files = c('ngrdi5', 'ngrdi10', 'ngrdi15')

RENAME = rename(NGRDI, files)

sv(RENAME) ## Salvando os arquivos

rm(NGRDI, files, RENAME, ngrdi) # Limpando memória

# TGI
TGI = tgi(data) # Calcular os Índices de Vegetação

files = c('tgi5', 'tgi10', 'tgi15')

RENAME = rename(TGI, files)

sv(RENAME) ## Salvando os arquivos

rm(TGI, files, RENAME, tgi) # Limpando memória

# ExG
ExG = exg(data) # Calcular os Índices de Vegetação

files = c('exg5', 'exg10', 'exg15')

RENAME = rename(ExG, files)

sv(RENAME) ## Salvando os arquivos

rm(ExG, files, RENAME, exg) # Limpando memória

# GLI
GLI = gli(data) # Calcular os Índices de Vegetação

files = c('gli5', 'gli10', 'gli15')

RENAME = rename(GLI, files)

sv(RENAME) ## Salvando os arquivos

rm(GLI, files, RENAME, gli) # Limpando memória

# VARI
VARI = vari(data) # Calcular os Índices de Vegetação

files = c('vari5', 'vari10', 'vari15')

RENAME = rename(VARI, files)

sv(RENAME) ## Salvando os arquivos

rm(VARI, files, RENAME, vari) # Limpando memória

# BGI
BGI = bgi(data) # Calcular os Índices de Vegetação

files = c('bgi5', 'bgi10', 'bgi15')

RENAME = rename(BGI, files)

sv(RENAME) ## Salvando os arquivos

rm(BGI, files, RENAME, bgi) # Limpando memória

quit() # Fechar RStudio

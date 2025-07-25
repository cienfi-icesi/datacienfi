#' @title Descargar datos del Registro único de vendedores en Cartagena 
#' @description Descarga datos desde datos.gov.co. Estándariza los nombres de columna
#' @return Tibble con observaciones por vendedor registrado 
download_vendedores <- function(url = "https://www.datos.gov.co/resource/y8mp-h84j.csv?$limit=10000"){
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Cargar paquetes sin mostrar mensajes 
  suppressPackageStartupMessages({
    library(readr)
    library(dplyr)
    library(janitor)
    library(stringr)
  })
  
  #Paso 1: Descargar los datos con nombres originales
  datos <- read_csv(url, show_col_types = FALSE)
  
  #Paso 2: Transformar nombres de columnas a formato snake_case
  datos <- datos %>% clean_names()
  
  #Paso 3: Renombrar algunas columnas a nombres legibles 
  datos <- datos %>% 
    rename(
      genero = g_nero
    )
  
  return(datos)
}
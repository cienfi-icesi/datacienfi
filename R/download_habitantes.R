#' @title Descarga observaciones de la base de Habitantes en situación de calle y en la calle
#' @description
#' Descarga datos desde datos.gov.co. Estandariza los nombres de columna 
#' @return Tibble con observaciones por individuo
#' @export
download_habitantes <- function(url = "https://www.datos.gov.co/resource/jmky-uei2.csv") {
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Cargar paquetes sin mostrar mensaje 
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
      periodo = a_o
    )
  
  return(datos)
}
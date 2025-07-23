#' @title Descargar observaciones de la base de Empresas mas Grandes del País
#' @description Descarga datos desde datos.gov.co. Estándariza los nombres de columna
#' @return Tibble con observaciones por empresa
#' @export
download_empresa <- function(url = "https://www.datos.gov.co/resource/6cat-2gcs.csv?$limit=10000") {
  
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
      razon_social = raz_n_social, 
      region = regi_n, 
      resultado_periodo = ganancia_p_rdida, 
      periodo = a_o_de_corte
    )
  
  # Paso 4: Limpiar y convertir columnas numéricas (quitar $ y comas)
  columnas_numericas <- c(
    "ingresos_operacionales", 
    "total_activos", 
    "total_patrimonio", 
    "total_pasivos", 
    "resultado_periodo"
  )
  
  datos <- datos %>%
    mutate(across(
      all_of(columnas_numericas),
      ~ as.numeric(str_replace_all(.x, "[\\$,]", ""))  # eliminar $ y ,
    ))
  
  return(datos)
}
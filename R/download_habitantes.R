#' @title Descarga observaciones de la base de Habitantes en situación de calle y en la calle
#' @description
#' Descarga datos desde datos.gov.co. Estandariza los nombres de columna 
#' @param url URL del archivo CSV o recurso que se desea descargar 
#' @return Tibble con observaciones por individuo
download_habitantes <- function(url = "https://www.datos.gov.co/resource/jmky-uei2.csv") {
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Paso 1: Descargar los datos con nombres originales 
  datos <- readr::read_csv(url, show_col_types = FALSE)
  
  #Paso 2: Transformar nombres de columnas a formato snake_case
  datos <- janitor::clean_names(datos)
  
  #Paso 3: Renombrar algunas columnas a nombres legibles 
  datos <- dplyr::rename(
    datos,
    periodo = a_o
  )
   
  return(datos)
}
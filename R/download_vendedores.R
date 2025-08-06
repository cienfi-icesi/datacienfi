#' 
#' @description Descarga datos desde datos.gov.co. Estándariza los nombres de columna
#' @param url URL del archivo CSV o recurso que se desea descargar 
#' @return Tibble con observaciones por vendedor registrado 
#' @keywords internal
download_vendedores <- function(url = "https://www.datos.gov.co/resource/y8mp-h84j.csv?$limit=10000"){
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Paso 1: Descargar los datos con nombres originales
  datos <- readr::read_csv(url, show_col_types = FALSE)
  
  #Paso 2: Transformar nombres de columnas a formato snake_case
  datos <- janitor::clean_names(datos)
  
  #Paso 3: Renombrar algunas columnas a nombres legibles 
  datos <- dplyr::rename(
    datos, 
    genero = g_nero
  )
  
  return(datos)
}
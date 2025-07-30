#' @title Descargar observaciones de la base de Turismo Receptivo en el Valle del Cauca
#' @description Descarga datos desde datos.gov.co. Estandariza los nombres de columna
#' @param url URL del archivo CSV o recurso que se desea descargar 
#' @return Tibble con observaciones por individuo
download_turismo <- function(url = "https://www.datos.gov.co/resource/xv5t-qgec.csv?$limit=2000"){
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Paso 1: Descargar los datos con nombres originales 
  datos <- readr::read_csv(url, show_col_types = FALSE) 
  
  #Paso 2: Transformar nombres de columnas a formato snake_case
  datos <- janitor::clean_names(datos)
  
  #Paso 3: Renombrar algunas columnas a nombres legibles 
  datos <- dplyr::rename(
    datos,
    genero_turista = genero,
    pais_procedencia = pa_s_de_procedencia, 
    departamento_procedencia = departamento,
    noches_viaje = noches,
    periodo = a_o
  )

  #Paso 4: Limpiar y convertir columnas numericas (quitar ".")
  columnas_numericas <- c("gasto_turistico_generado")
  
  datos <- dplyr::mutate(
    datos, 
    dplyr::across(
      .cols = dplyr::all_of(columnas_numericas), 
      .fns = ~ as.numeric(stringr::str_replace_all(.x, "[\\$.]", ""))
    )
  )
  
  return(datos)
}
  
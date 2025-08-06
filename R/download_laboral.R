#' 
#' @description
#' Descarga datos desde datos.gov.co. Estandariza los nombes de columna
#' @param url URL del archivo CSV o recurso que se desea descargar
#' @return Tibble con datos por periodo 
#' @keywords internal
download_laboral <- function(url = "https://datosabiertos.bogota.gov.co/dataset/199722a1-e999-422e-8214-cac75264efec/resource/51ae1760-fc6d-47d1-9c7c-669b0f3bc517/download/conjunto-mercado-laboral-bogota-03072025.xlsx"){
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Paso 1: Descargar los datos con nombres originales 
  datos <- rio::import(url)
  
  #Paso 2: Transformar nombres de columnas a formato snak_case
  datos <- janitor::clean_names(datos)
  
  #Paso 3: Transformar columna trimestre a formato numerico 
  # Asegurar que trimestre es numerico entero
  datos <- dplyr::mutate(datos, trimestre = lubridate::quarter(trimestre))
  
  #Paso 4: Eliminar decimales en columnas que no deberían tenerlos 
  datos <- dplyr::mutate(
    datos,
    desocupados = round(desocupados),
    subocupados = round(subocupados),
    total_informales_dane = round(as.numeric(total_informales_dane)),
    fuerza_de_trabajo_potencial = round(fuerza_de_trabajo_potencial)
  )
    
  # Paso 5: Redondear decimales en columnas de tasas
  datos <- dplyr::mutate(
    datos, 
    porcentaje_poblacion_en_edad_de_trabajar = round(as.numeric(porcentaje_poblacion_en_edad_de_trabajar), 2), 
    tasa_global_de_participacion = round(as.numeric(tasa_global_de_participacion), 2),
    tasa_de_desocupacion = round(as.numeric(tasa_de_desocupacion), 2), 
    tasa_de_subocupados = round(as.numeric(tasa_de_subocupados), 2), 
    tasa_ocupados_asalariados = round(as.numeric(tasa_ocupados_asalariados), 2), 
    tasa_ocupados_no_asalariados = round(as.numeric(tasa_ocupados_no_asalariados), 2), 
    tasa_fuerza_potencial_de_trabajo = round(as.numeric(tasa_fuerza_potencial_de_trabajo), 2), 
    tasa_de_informalidad_dane = round(as.numeric(tasa_de_informalidad_dane), 2)
  )
  
  return(datos)
}
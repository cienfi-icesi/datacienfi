#' @title Descargar hasta 50.000 observaciones de Saber 11 del año 2022
#' @description Descarga datos desde datos.gov.co, agrupa por institución educativa, calcula promedios por módulo y cuenta estudiantes.
#' @return Tibble con observaciones agregadas por institución educativa
download_notas <- function(url = "https://www.datos.gov.co/resource/kgxf-xxbe.csv?periodo=20224&$limit=50000") {
  
  # Evitar notación científica
  options(scipen = 999)
  
  # Cargar paquetes sin mostrar mensajes
  suppressPackageStartupMessages({
    library(readr)
    library(dplyr)
    library(janitor)
  })
  
  # Paso 1: Descargar los datos con nombres originales
  datos <- read_csv(url, show_col_types = FALSE)
  
  # Paso 2: Transformar nombres de columnas a snake_case
  datos <- datos %>% clean_names()
  
  # Paso 3: Reemplazar NAs y valores NaN
  datos <- datos %>%
    mutate(
      cole_depto_ubicacion = ifelse(is.na(cole_depto_ubicacion), "Sin dato", cole_depto_ubicacion),
      cole_mcpio_ubicacion = ifelse(is.na(cole_mcpio_ubicacion), "Sin dato", cole_mcpio_ubicacion),
      cole_area_ubicacion = ifelse(is.na(cole_area_ubicacion), "Sin dato", cole_area_ubicacion),
      cole_caracter = ifelse(is.na(cole_caracter), "Sin dato", cole_caracter),
      cole_bilingue = ifelse(is.na(cole_bilingue), "Sin dato", cole_bilingue),
      punt_lectura_critica = ifelse(is.na(punt_lectura_critica) | is.nan(punt_lectura_critica), 0, punt_lectura_critica),
      punt_matematicas = ifelse(is.na(punt_matematicas) | is.nan(punt_matematicas), 0, punt_matematicas),
      punt_sociales_ciudadanas = ifelse(is.na(punt_sociales_ciudadanas) | is.nan(punt_sociales_ciudadanas), 0, punt_sociales_ciudadanas),
      punt_c_naturales = ifelse(is.na(punt_c_naturales) | is.nan(punt_c_naturales), 0, punt_c_naturales),
      punt_ingles = ifelse(is.na(punt_ingles) | is.nan(punt_ingles), 0, punt_ingles)
    )
  
  # Paso 4: Agrupar y calcular promedios
  datos_agregados <- datos %>%
    group_by(cole_nombre_establecimiento) %>%
    summarise(
      departamento = first(cole_depto_ubicacion),
      municipio = first(cole_mcpio_ubicacion),
      area = first(cole_area_ubicacion),
      caracter = first(cole_caracter),
      sector = first(cole_naturaleza),
      bilingue = first(cole_bilingue),
      lectura_critica = round(mean(punt_lectura_critica), 2),
      matematicas = round(mean(punt_matematicas), 2),
      sociales_ciudadanas = round(mean(punt_sociales_ciudadanas), 2),
      ciencias_naturales = round(mean(punt_c_naturales), 2),
      ingles = round(mean(punt_ingles), 2),
      total_estudiantes = n(),
      .groups = "drop"
    )
  
  # Paso 5: Filtrar instituciones con promedios en cero
  datos_agregados <- datos_agregados %>%
    filter(
      lectura_critica != 0,
      matematicas != 0,
      sociales_ciudadanas != 0,
      ciencias_naturales != 0,
      ingles != 0
    )
  
  # Paso 6: Renombrar nombre de institución
  datos_agregados <- datos_agregados %>%
    rename(nombre_colegio = cole_nombre_establecimiento)
  
  return(datos_agregados)
}

#' @title Descargar hasta 50.000 observaciones de Saber Pro 2022-1
#' @description
#' Descarga datos desde datos.gov.co
#' @return Tibble con observaciones por individuo 
#' @export
download_universidades <- function(url = "https://www.datos.gov.co/resource/u37r-hjmu.csv?periodo=20222&$limit=50000") {
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Cargar paquetes sin mostrar mensajes 
  suppressPackageStartupMessages({
    library(readr)
    library(dplyr)
    library(janitor)
  })
  
  # Paso 1: Descargar los datos con nombres originales 
  datos <- read_csv(url, show_col_types = FALSE)
  
  # Paso 2: Transformar nombres de columnas a snake_case
  datos <- datos %>% clean_names()
  
  # Paso 3: Seleccionar solo columnas relevantes
  columnas_intereses <- c(
    "periodo", "estu_depto_reside", "inst_nombre_institucion", "estu_inst_departamento",
    "estu_nucleo_pregrado", "estu_prgm_academico", "estu_horassemanatrabaja", "estu_genero", 
    "fami_educacionpadre", "fami_educacionmadre", "fami_estratovivienda", "mod_razona_cuantitat_punt", 
    "mod_comuni_escrita_punt", "mod_lectura_critica_punt", "mod_competen_ciudada_punt", "mod_ingles_punt", "mod_ingles_desem"
  )
  
  columnas_validas <- intersect(columnas_intereses, names(datos))
  
  datos <- datos %>% select(all_of(columnas_validas))
  
  # Paso 4: Reemplazar NAs y valores NaN 
  datos <- datos %>% 
    mutate(
      estu_depto_reside = ifelse(is.na(estu_depto_reside), "Sin dato", estu_depto_reside), 
      inst_nombre_institucion = ifelse(is.na(inst_nombre_institucion), "Sin dato", inst_nombre_institucion), 
      estu_nucleo_pregrado = ifelse(is.na(estu_nucleo_pregrado), "Sin dato", estu_nucleo_pregrado),
      estu_inst_departamento = ifelse(is.na(estu_inst_departamento), "Sin dato", estu_inst_departamento), 
      estu_prgm_academico = ifelse(is.na(estu_prgm_academico), "Sin dato", estu_prgm_academico), 
      estu_horassemanatrabaja = ifelse(is.na(estu_horassemanatrabaja), "Sin dato", estu_horassemanatrabaja), 
      estu_genero = ifelse(is.na(estu_genero), "Sin dato", estu_genero), 
      fami_educacionpadre = ifelse(is.na(fami_educacionpadre), "Sin dato", fami_educacionpadre),
      fami_educacionmadre = ifelse(is.na(fami_educacionmadre), "Sin dato", fami_educacionmadre),
      fami_estratovivienda = ifelse(is.na(fami_estratovivienda), "Sin dato", fami_estratovivienda), 
      mod_razona_cuantitat_punt = ifelse(is.na(mod_razona_cuantitat_punt) | is.nan(mod_razona_cuantitat_punt), 0, mod_razona_cuantitat_punt),
      mod_comuni_escrita_punt = ifelse(is.na(mod_comuni_escrita_punt) | is.nan(mod_comuni_escrita_punt), 0, mod_comuni_escrita_punt), 
      mod_lectura_critica_punt = ifelse(is.na(mod_lectura_critica_punt) | is.nan(mod_lectura_critica_punt), 0, mod_lectura_critica_punt), 
      mod_competen_ciudada_punt = ifelse(is.na(mod_competen_ciudada_punt) | is.nan(mod_competen_ciudada_punt), 0, mod_competen_ciudada_punt),
      mod_ingles_punt = ifelse(is.na(mod_ingles_punt) | is.nan(mod_ingles_punt), 0, mod_ingles_punt), 
      mod_ingles_desem = ifelse(is.na(mod_ingles_desem), "Sin dato", mod_ingles_desem)
    )
  
  # Paso 5: Renombrar columnas seleccionadas a nombres elegibles 
  datos <- datos %>% 
    rename(
      periodo = periodo,
      departamento_estudiante = estu_depto_reside, 
      institucion = inst_nombre_institucion, 
      departamento_institucion = estu_inst_departamento, 
      nucleo_pregrado = estu_nucleo_pregrado, 
      pregrado = estu_prgm_academico, 
      horas_trabajo_semanal = estu_horassemanatrabaja, 
      genero_estudiante = estu_genero, 
      educacion_padre = fami_educacionpadre, 
      educacion_madre = fami_educacionmadre, 
      estrato_vivienda = fami_estratovivienda, 
      razonamiento_cuantitativo = mod_razona_cuantitat_punt, 
      comunicacion_escrita = mod_comuni_escrita_punt, 
      lectura_critica = mod_lectura_critica_punt, 
      competencias_ciudadanas = mod_competen_ciudada_punt, 
      ingles = mod_ingles_punt, 
      nivel_ingles = mod_ingles_desem
    )
  
  # Paso 6: Filtrar casos con puntajes en cero 
  datos <- datos %>% 
    filter(
      razonamiento_cuantitativo != 0, 
      comunicacion_escrita != 0, 
      lectura_critica != 0, 
      competencias_ciudadanas != 0, 
      ingles != 0
    )
  
  return(datos)
}
#' @title Descargar observaciones de la base de Empresas mas Grandes del País
#' @description Descarga datos desde datos.gov.co. Estándariza los nombres de columna
#' @param url URL del archivo CSV o recurso que se desea descargar 
#' @return Tibble con observaciones por empresa
download_empresa <- function(url = "https://www.datos.gov.co/resource/6cat-2gcs.csv?$limit=10000") {
  
  #Evitar notación cientifica 
  options(scipen = 999)
  
  #Paso 1: Descargar los datos con nombres originales
  datos <- readr::read_csv(url, show_col_types = FALSE)
  
  #Paso 2: Transformar nombres de columnas a formato snake_case
  datos <- janitor::clean_names(datos)
  
  #Paso 3: Renombrar algunas columnas a nombres legibles 
  datos <- dplyr::rename(
    datos, 
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
  
  datos <- dplyr::mutate(
    datos,
    dplyr::across(
      .cols = dplyr::all_of(columnas_numericas),
      .fns = ~ as.numeric(stringr::str_replace_all(.x, "[\\$,]", ""))
    )
  )
  
  return(datos)
}
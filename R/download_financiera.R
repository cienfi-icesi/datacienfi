#' @title Descargar hasta 10.000 observaciones de inclusión financiera
#' @description Descarga datos desde datos.gov.co y los filtra por tipo de producto financiero. Estándariza los nombres de columna.
#' @return Tibble con observaciones de CUENTAS DE AHORRO y CREDITOS DE CONSUMO
download_financiera <- function(url = "https://www.datos.gov.co/resource/ptgf-ywrb.csv?$limit=50000") {
  
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
  
  # Paso 2: Filtrar por tipos de producto financiero de interés
  datos <- datos %>%
    filter(tipo %in% c("CUENTAS DE AHORRO", "CREDITOS DE CONSUMO"))
  
  # Paso 3: Transformar nombres de columnas a formato snake_case
  datos <- datos %>% clean_names()
  
  # Paso 4: Seleccionar solo columnas relevantes con nombres transformados
  columnas_interes <- c(
    "nombreentidad", "fechacorte", "municipio", "tipo",
    "nro1smmlvca", "saldo1smmlv", "nro1y3smmlv", "saldo1y3smmlv",
    "nro3y5smmlv", "saldo3y5smmlv", "nroactivasca", "saldoactivasca",
    "generonromca", "generosaldomca", "generonrohca", "generosaldohca"
  )
  
  columnas_validas <- intersect(columnas_interes, names(datos))
  
  datos <- datos %>% select(all_of(columnas_validas))
  
  # Paso 5: Renombrar columnas seleccionadas a nombres legibles
  datos <- datos %>%
    rename(
      nombre_entidad       = nombreentidad,
      fecha_corte          = fechacorte,
      cuentas_hasta_1smmlv        = nro1smmlvca,
      saldo_cuentas_1smmlv         = saldo1smmlv,
      cuentas_entre_1y3smmlv      = nro1y3smmlv,
      saldo_cuentas_1y3smmlv       = saldo1y3smmlv,
      cuentas_entre_3y5smmlv      = nro3y5smmlv,
      saldo_cuentas_3y5smmlv       = saldo3y5smmlv,
      cuentas_activas       = nroactivasca,
      saldo_cuentas_activas        = saldoactivasca,
      numero_creditos_mujeres       = generonromca,
      monto_credito_mujeres        = generosaldomca,
      numero_creditos_hombres       = generonrohca,
      monto_creito_hombres        = generosaldohca
    )
  
  return(datos)
}

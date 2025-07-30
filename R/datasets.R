#' @title Obtener datos de inclusión financiera
#' @description Llama a la funcion de descarga y agrega metadatos
#' @return Tibble con datos listos para analisis
#' @export
get_finanzas <- function() {
  message("Ejecutando funcion get_finanzas()...")
  datos <- download_financiera()
  
  message("Fuente: Superintendencia Financiera de Colombia (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de notas academicas
#' @description
#' Llama a la funcion de descarga y agrega metadatos
#' @return Data frame con los datos 
#' @export
get_notas <- function() {
  message("Ejecutando funcion get_notas()...")
  datos <- download_notas()
  
  message("Fuente: ICFES (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de resultados Saber Pro Universidades
#' @description
#' Llama a la funcion de descarga y agrega metadatos 
#' @return Data frame con los datos 
#' @export
get_universidades <- function() {
  message("Ejecutando funcion get_universidades()...")
  datos <- download_universidades()
  
  message("Fuente: ICFES (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de 1.000 de las Empresas mas Grandes del Pais al 2023 
#' @description Llama a la funcion de descarga y agrega metadatos 
#' @return Data frame con los datos por empresa
#' @export 
get_empresas <- function(){
  message("Ejecutando funcion get_empresas()...")
  datos <- download_empresa()
  
  message("Las cifras se reportan en billones de pesos")
  message("Fuente: Superintendencia de Sociedades (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Turismo Receptivo en el Valle del Cauca 
#' @description Llama a la funcion de descarga y agrega metadatos 
#' @return Data frame con los datos por empresa
#' @export 
get_turismo <- function(){
  message("Ejecutando funcion get_turismo()...")
  datos <- download_turismo()
  
  message("Fuente: Gobernacion del Valle del Cauca (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Habitantes de Calle y en la Calle 
#' @description Llama a la funcion de descarga y agrega metadatos 
#' @return Data frame con los datos por individuo 
#' @export
get_habitantes <- function(){
  message("Ejecutando funcion get_habitantes()...")
  datos <- download_habitantes()
  
  message("Fuente: Gobernacion del Valle del Cauca (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Mercado laboral en Bogota
#' @description Llama a la funcion de descarga y agrega metadatos 
#' @return Data frame con los datos por periodo 
#' @export
get_laboral <- function(){
  message("Ejecutando funcion get_laboral()...")
  datos <- download_laboral()
  
  message("Fuente: Ministerio de Tecnologias de la Informacion y las Comunicaciones (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Vendedores registrados en Cartagena
#' @description Llama a la funcion de descarga y agrega metadatos 
#' @return Data frame con los datos de los vendedores registrados 
#' @export 
get_vendedores <- function(){
  message("Ejecutando funcion get_vendedoresl()...")
  datos <- download_vendedores()
  
  message("Fuente: Alcaldia de Cartagena (datos abiertos)")
  message("Por favor cite el paquete asi:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi:")
  message("Paquete de bases de datos publicas para analisis economico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de Indicadores Financieros de EEUU
#' @description
#' Carga el dataset EEUU_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_EEUU <- function() {
  file <- system.file("extdata", "EEUU_final.Rda", package = "datacienfi")
  e <- new.env()
  load(file = file, envir = e)
  # Informacion de fuente y estructura
  message("Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "Por favor cite el paquete asi:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi: ",
          "Paquete de bases de datos publicas para analisis economico y financiero. CIENFI, Universidad Icesi.")
  
    return(e$EEUU_final)
}


#' @title Obtener datos de Indicadores Financieros de Asia 
#' @description
#' Carga el dataset Asia_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_Asia <- function() {
  file <- system.file("extdata", "Asia_final.Rda", package = "datacienfi")
  e <- new.env()
  load(file = file, envir = e)
  # Informacion de fuente y estructura
  message("Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "Por favor cite el paquete asi:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi: ",
          "Paquete de bases de datos publicas para analisis economico y financiero. CIENFI, Universidad Icesi.")
  
  return(e$Asia_final)
}


#' @title Obtener datos de Indicadores Financieros de Europa 
#' @description
#' Carga el dataset Europa_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_Europa <- function() {
  file <- system.file("extdata", "Europa_final.Rda", package = "datacienfi")
  e <- new.env()
  load(file = file, envir = e)
  # Informacion de fuente y estructura
  message("Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "Por favor cite el paquete asi:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi: ",
          "Paquete de bases de datos publicas para analisis economico y financiero. CIENFI, Universidad Icesi.")
  
  return(e$Europa_final)
}


#' @title Obtener datos de Indicadores Financieros de Latinoamerica 
#' @description
#' Carga el dataset Latinoamerica_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_Latinoamerica <- function() {
  file <- system.file("extdata", "Latinoamerica_final.Rda", package = "datacienfi")
  e <- new.env()
  load(file = file, envir = e)
  # Informacion de fuente y estructura
  message("Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "Por favor cite el paquete asi:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). datacienfi: ",
          "Paquete de bases de datos publicas para analisis economico y financiero. CIENFI, Universidad Icesi.")
  
  return(e$Latinoamerica_final)
}

#' @title Obtener datos de inclusión financiera
#' @description Llama a la función de descarga y agrega metadatos
#' @return Tibble con datos listos para análisis
#' @export
get_finanzas <- function() {
  message("🚀 Ejecutando función get_finanzas()...")
  datos <- download_financiera()
  
  message("\n📦 Fuente: Superintendencia Financiera de Colombia (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de notas académicas
#' @description
#' Llama a la función de descarga y agrega metadatos
#' @param aplicar_transform Aplicar transformación predefinida? (TRUE por defecto)
#' @return Data frame con los datos 
#' @export
get_notas <- function() {
  message("🚀 Ejecutando función get_notas()...")
  datos <- download_notas()
  
  message("\n📦 Fuente: ICFES (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de resultados Saber Pro Universidades
#' @description
#' Llama a la función de descarga y agrega metadatos 
#' @param aplicar_transform Aplicar transformación predefinida? (TRUE por defecto)
#' @return Data frame con los datos 
#' @export
get_universidades <- function() {
  message("🚀 Ejecutando función get_universidades()...")
  datos <- download_universidades()
  
  message("\n📦 Fuente: ICFES (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de 1.000 de las Empresas mas Grandes del Pais al año 2023 
#' @description Llama a la función de descarga y agrega metadatos 
#' @param aplicar_transform Aplicar transformación predefinida? (TRUE por defecto)
#' @return Data frame con los datos por empresa
#' @export 
get_empresas <- function(){
  message("🚀 Ejecutando función get_empresas()...")
  datos <- download_empresa()
  
  message("Las cifras se reportan en billones de pesos")
  message("\n📦 Fuente: Superintendencia de Sociedades (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Turismo Receptivo en el Valle del Cauca 
#' @description Llama a la función de descarga y agrega metadatos 
#' @param aplicar_transform Aplicar transformación predefinida? (TRUE por defecto)
#' @return Data frame con los datos por empresa
#' @export 
get_turismo <- function(){
  message("🚀 Ejecutando función get_turismo()...")
  datos <- download_turismo()
  
  message("\n📦 Fuente: Gobernación del Valle del Cauca (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Habitantes de Calle y en la Calle 
#' @description Llama a la función de descarga y agrega metadatos 
#' @param aplicar_transform Aplicar transformación predefinida? (TRUE por defecto)
#' @return Data frame con los datos por individuo 
#' @export
get_habitantes <- function(){
  message("🚀 Ejecutando función get_habitantes()...")
  datos <- download_habitantes()
  
  message("\n📦 Fuente: Gobernación del Valle del Cauca (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Mercado laboral en Bogotá
#' @description Llama a la función de descarga y agrega metadatos 
#' @param aplicar_transform Aplicar transformación predefinida? (TRUE por defecto)
#' @return Data frame con los datos por periodo 
#' @export
get_laboral <- function(){
  message("🚀 Ejecutando función get_laboral()...")
  datos <- download_laboral()
  
  message("\n📦 Fuente: Ministerio de Tecnologías de la Información y las Comunicaciones (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}

#' @title Obtener datos de Vendedores registrados en Cartagena
#' @description Llama a la función de descarga y agrega metadatos 
#' @param aplicar_transform Aplicar transformación predefinidad (TRUE por defecto)
#' @return Data frame con los datos de los vendedores registrados 
#' @export 
get_vendedores <- function(){
  message("🚀 Ejecutando función get_vendedoresl()...")
  datos <- download_vendedores()
  
  message("\n📦 Fuente: Alcaldía de Cartagena (datos abiertos)")
  message("📚 Por favor cite el paquete así:")
  message("Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A.,")
  message("Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi:*")
  message("Paquete de bases de datos públicas para análisis económico y financiero.")
  message("CIENFI, Universidad Icesi.")
  
  return(datos)
}


#' @title Obtener datos de Indicadores Financieros de EEUU
#' @description
#' Carga el dataset EEUU_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_EEUU <- function() {
  data("EEUU_final", package = "datacienfi", envir = environment())
  return
  # Información de fuente y estructura
  message("📦 Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "📚 Por favor cite el paquete así:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi: ",
          "Paquete de bases de datos públicas para análisis económico y financiero*. CIENFI, Universidad Icesi.")
  
    return(EEUU_final)
}


#' @title Obtener datos de Indicadores Financieros de Asia 
#' @description
#' Carga el dataset Asia_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_Asia <- function() {
  data("Asia_final", package = "datacienfi", envir = environment())
  return
  # Información de fuente y estructura
  message("📦 Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "📚 Por favor cite el paquete así:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi: ",
          "Paquete de bases de datos públicas para análisis económico y financiero*. CIENFI, Universidad Icesi.")
  
  return(Asia_final)
}


#' @title Obtener datos de Indicadores Financieros de Europa 
#' @description
#' Carga el dataset Europa_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_Europa <- function() {
  data("Europa_final", package = "datacienfi", envir = environment())
  return
  # Información de fuente y estructura
  message("📦 Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "📚 Por favor cite el paquete así:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi: ",
          "Paquete de bases de datos públicas para análisis económico y financiero*. CIENFI, Universidad Icesi.")
  
  return(Europa_final)
}


#' @title Obtener datos de Indicadores Financieros de Latinoamerica 
#' @description
#' Carga el dataset Latinoamerica_final incluido en el paquete
#' @return Data frame con los datos 
#' @export
indicadores_Latinoamerica <- function() {
  data("Latinoamerica_final", package = "datacienfi", envir = environment())
  return
  # Información de fuente y estructura
  message("📦 Fuente: Yahoo Finance: https://finance.yahoo.com/\n",
          "📚 Por favor cite el paquete así:\n",
          "Martinez-Gonzalez, E., Granado-Mandinga, C., Torres-Montoya, M., Cano-Noguera, A., ",
          "Escobar-Arteaga, J., Gil-Marin, K., & Dow-Valenzuela, S. (2024). *datacienfi: ",
          "Paquete de bases de datos públicas para análisis económico y financiero*. CIENFI, Universidad Icesi.")
  
  return(Latinoamerica_final)
}

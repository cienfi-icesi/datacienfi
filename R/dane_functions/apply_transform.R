#' @title Aplicar transformación predefinida
#' @description
#' Aplica un script de transformación guardado en el paquete
#' @param datos Datos a transformar
#' @param nombre_script Nombre del script de transformación (sin extensión)
#' @return Datos transformados
#' @export
dg_apply_transform <- function(datos, nombre_script) {
  script_path <- system.file(
    "transform", 
    paste0(nombre_script, ".R"), 
    package = "datacienfi"
  )
  
  if(script_path == "") {
    stop("Script de transformación no encontrado ", nombre_script)
  }
  
  env <- new.env()
  source(script_path, local = env)
  
  transform_func_name <- paste0("transform_", nombre_script)
  if(!exists(transform_func_name, envir = env)) {
    stop("Función de transformación no encontrada: ", transform_func_name)
  }
  
  # Corrección final
  transform_func <- get(transform_func_name, envir = env)
  transform_func(datos)
}

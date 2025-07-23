#' @title Transformar datos geográficos
#' @description Convierte datos con coordenadas a objeto espacial (sf)
#' @param datos Tibble con datos a transformar
#' @param crs Código EPSG del sistema de referencia (ej: 4326 para WGS84)
#' @param lon_col Nombre columna longitud (default: "longitud")
#' @param lat_col Nombre columna latitud (default: "latitud")
#' @return Objeto sf con geometrías de puntos 
#' @export
#' @importFrom sf st_as_sf
dg_to_sf <- function(datos, crs = 4326, lon_col = "longitud", lat_col = "latitud") {
  if(!all(c(lon_col, lat_col) %in% names(datos))) {
    stop("Columnas de coordenadas no encontradas")
  }
  
  # Corrección en nombres de columnas
  sf::st_as_sf(
    datos,
    coords = c(lon_col, lat_col), 
    crs = crs
  )
}

#' @title Normalizar nombres de columnas 
#' @description
#' Estandarizar nombres de columnas a snake_case
#' @param datos Tibble con datos a transformar
#' @return Tibble con nombres normalizados
#' @export
#' @importFrom dplyr rename_with
#' @importFrom stringr str_to_lower str_replace_all str_remove_all
dg_normalizar_nombres <- function(datos) {
  # Corrección en export y nombres de funciones
  datos %>% 
    dplyr::rename_with(~ stringr::str_to_lower(.) %>%
                         stringr::str_replace_all("\\s+", "_") %>%
                         stringr::str_remove_all("[^a-z0-9_]"))
}






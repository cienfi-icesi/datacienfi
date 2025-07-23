#' @title Obtener metadatos de datasets disponibles 
#' @description Lista todos los datasets disponibles en datos.gov.co
#' @return Tibble con metadatos de datasets 
#' @export
#' @importFrom httr GET content http_error
#' @importFrom dplyr select rename mutate
#' @importFrom lubridate as_date
#' @importFrom jsonlite fromJSON
dg_list_datasets <- function() {
  api_url <- "https://www.datos.gov.co/api/views/metadata/v1"
  response <- httr::GET(api_url)
  
  # Corrección en http_error
  if (httr::http_error(response)) {
    stop("Error al conectar con Datos Abiertos Colombia")
  }
  
  # Corrección en response
  content <- httr::content(response, "text", encoding = "UTF-8")
  datasets <- jsonlite::fromJSON(content)
  
  datasets %>% 
    dplyr::select(id, name, description, updatedAt) %>% 
    dplyr::rename(
      id_dataset = id, 
      nombre = name, 
      descripcion = description, 
      actualizacion = updatedAt
    ) %>% 
    dplyr::mutate(actualizacion = lubridate::as_date(actualizacion))
}

#' @title Descargar datasets del DANE
#' @description Descarga un dataset específico usando su ID
#' @param dataset_id ID del dataset (ej: "gt2j-8ykr")
#' @param formato Formato de descarga ("csv", "json", "xml")
#' @param cache Usar caché? (TRUE por defecto)
#' @return Tiblle con los datos descargados 
#' @export 
#' @importFrom httr GET write_disk
#' @importFrom readr read_csv 
#' @importFrom jsonlite fromJSON
#' @importFrom xml2 read_xml 
#' @importFrom tools R_user_dir 
dg_download <- function(dataset_id, formato = "csv", cache = TRUE) {
  formatos_validos <- c("csv", "json", "xml")
  if (!formato %in% formatos_validos) {
    stop("Formato inválido. Use: ", paste(formatos_validos, collapse = ","))
  }
  
  # Corrección en ::
  cache_dir <- tools::R_user_dir("datacienfi", which = "cache")
  if(!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)
  cache_file <- file.path(cache_dir, paste0(dataset_id, ".rds"))
  
  if(cache && file.exists(cache_file)) {
    # Corrección en nombre de variable
    return(readRDS(cache_file))
  }
  
  base_url <- "https://www.datos.gov.co/api/views/"
  download_url <- paste0(base_url, dataset_id, "/rows.", formato, "?accessType=DOWNLOAD")
  
  temp_file <- tempfile(fileext = paste0(".", formato))
  httr::GET(download_url, httr::write_disk(temp_file, overwrite = TRUE))
  
  datos <- switch(
    formato, 
    "csv" = readr::read_csv(temp_file, locale = readr::locale(encoding = "UTF-8")), 
    "json" = jsonlite::fromJSON(temp_file), 
    "xml" = xml2::read_xml(temp_file)
  )
  
  file.remove(temp_file)
  
  if(cache) saveRDS(datos, cache_file)
  
  return(datos)
}
 
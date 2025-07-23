#' @title Transformación del dataset Saber 11
#' @description Aplica limpieza y filtrado por edad al dataset Saber 11
#' @param datos Data frame crudo
#' @return Data frame transformado
transform_saber11 <- function(datos) {
  datos %>%
    dplyr::mutate(
      estu_fechanacimiento = lubridate::ymd(estu_fechanacimiento),
      edad = floor(lubridate::interval(estu_fechanacimiento, Sys.Date()) / lubridate::years(1))
    ) %>%
    dplyr::filter(edad >= 15 & edad <= 20)
}

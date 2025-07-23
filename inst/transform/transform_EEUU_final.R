#' @title Transformar dataset de EEUU
#' @description Aplica transformaciones al dataset de indicadores financieros de EE.UU.
#' @param data Data frame con los datos brutos.
#' @param nombre Nombre del dataset (solo para trazabilidad).
#' @return Data frame transformado.
#' @export
transform_EEUU_final <- function(data, nombre = "EEUU") {
  data |>
    dplyr::mutate(data, fecha = as.Date(fecha)) |>
    dplyr::arrange(fecha)
}

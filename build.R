
#build.R

#Cargar librerias necesarias 
require(pacman)
p_load(devtools,
       roxygen2,
       pkgbuild)

#Director raiz del paquete 
pkg_path <- "."

# Verificar que la estructura del paquete esté correcta
check_result <- devtools::check(pkg_path, document = TRUE)

# Extraer número de errores y advertencias
n_errors <- length(check_result$errors)
n_warnings <- length(check_result$warnings)

if (n_errors == 0 && n_warnings == 0) {
  message("El paquete pasó las verificaciones.")
  
  # Compilar el paquete y generar el archivo .tar.gz
  pkg_file <- devtools::build(pkg_path)
  message("Paquete generado: ", pkg_file)
  
} else {
  stop(paste0("El paquete tiene ", n_errors, " errores y ", n_warnings, " advertencias. Revisa antes de continuar."))
}

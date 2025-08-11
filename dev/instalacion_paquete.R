# Limpiar entorno actual
rm(list = ls())
gc()

# Establecer el directorio raíz del paquete
setwd("~/Desktop/CIENFI/datacienfi/")  # <-- Ajusta si tu ruta es diferente

# Cargar paquetes necesarios
library(devtools)
library(roxygen2)

# Generar la documentación (actualiza man/ y NAMESPACE)
devtools::document()

# Cargar el paquete completo como si estuviera instalado
devtools::load_all()

# Probar funciones si lo deseas
# ejemplo:
# df <- get_finanzas()
# head(df)

creditos <- get_finanzas()
notas <- get_notas()
universidades <- get_universidades()
empresas <- get_empresas()
turismo <- get_turismo()
habitantes <- get_habitantes()
vendedores <- get_vendedores()
indicadores_EEUU <-indicadores_EEUU()
indicadores_Asia <- indicadores_Asia()
indicadores_Europa <- indicadores_Europa()
indicadores_Latinoamerica <- indicadores_Latinoamerica()



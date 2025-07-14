# 📦 datacienfi

`datacienfi` es un paquete en desarrollo para R que permite **descargar, transformar y preparar bases de datos públicas del DANE y otras fuentes oficiales** de forma automatizada, estandarizada y reproducible.

Este paquete ha sido creado por el **Centro de Investigación en Economía y Finanzas (CIENFI)** de la Universidad Icesi para facilitar el uso sistemático de datos estadísticos en proyectos y ejercicios de análisis económico, social y académico, eliminando procesos manuales y reduciendo errores de procesamiento.

---

## 🎯 Objetivo del paquete

Brindar herramientas que:

- Automatizan la descarga directa de archivos desde los portales de datos abiertos del DANE.
- Aplican transformaciones consistentes a los conjuntos de datos (nombres de variables, tipos, codificaciones).
- Integran estructuras auxiliares como diccionarios o plantillas de estandarización.

---

## 🚀 Instalación

Para instalar la versión en desarrollo desde una carpeta local:

```r
# Instala devtools si aún no lo tienes
install.packages("devtools")

# Instala datacienfi desde tu directorio
devtools::install("ruta/a/datacienfi")

** ##🔧 Ejemplo de uso**

r
Copiar
Editar
library(datacienfi)

# Descargar una base del IPM municipal desde el DANE
ipm_raw <- descargar_dane("ipm_municipal")

# Aplicar transformación estandarizada
ipm_limpio <- transformar_ipm(ipm_raw)

# Visualizar los primeros registros
head(ipm_limpio)

**📁 Estructura del paquete**
bash
Copiar
Editar
R/                  # Funciones del paquete
man/                # Documentación de funciones
data/               # Diccionarios auxiliares (opcional)
tests/              # Pruebas unitarias
DESCRIPTION         # Información del paquete
NAMESPACE           # Control de funciones exportadas
README.md           # Este archivo

**📦 Dependencias**
dplyr, readr, httr, jsonlite, stringr, purrr

Requiere R ≥ 4.1.0

**📄 Licencia**
MIT License – Uso libre con atribución.




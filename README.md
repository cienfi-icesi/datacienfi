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



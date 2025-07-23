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

```r
library(datacienfi)

# Descargar una base de los resultados de las pruebas Saber 11 desde el DANE
notas_saber <- datacienfi::get_notas()
```

---

## 📁 Estructura del paquete

```bash
R/                  # Funciones del paquete
man/                # Documentación de funciones
data/               # Diccionarios auxiliares (opcional)
tests/              # Pruebas unitarias
DESCRIPTION         # Información del paquete
NAMESPACE           # Control de funciones exportadas
README.md           # Este archivo
```

---

## 📦 Dependencias

- `dplyr`
- `readr`
- `httr`
- `jsonlite`
- `stringr`
- `purrr`

> Requiere R ≥ 4.1.0

---

## 📄 Licencia

MIT License – Uso libre con atribución.

---

## 👨‍💻 Autor

**Eduard Fernando Martínez-Gonzalez;**
**César Arvey Granado-Mandinga;**
**Miguel Angel Torres-Montoya;**
**Alejandro Cano-Noguera;**
**Juan Camilo Escobar-Arteaga;**
**Karen Sofía Gil-Marin;**
**Sebastian Dow-Valenzuela**  
Centro de Investigación en Economía y Finanzas (CIENFI)  
Universidad Icesi – Colombia  
Contacto: cienfi@icesi.edu.co

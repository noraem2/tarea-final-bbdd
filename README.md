# Galería de Arte — Actividad Grupal BBDD

CLI en Python para consultar y gestionar una base de datos de galería de arte sobre SQLite.

## Requisitos

- Python 3.10+
- `rich` (instalado con `pip install -r requirements.txt`)

## Puesta en marcha

1. Instala las dependencias de Python:

   ```bash
   pip install -r requirements.txt
   ```

2. Ejecuta la aplicación:

   ```bash
   python main.py
   ```

> La base de datos SQLite (`galeria_arte.db`) debe estar presente en el directorio raíz del proyecto.

## Menú de opciones

| Opción | Descripción |
|--------|-------------|
| 1 | Insertar nuevo cliente |
| 2 | Tema potencialmente más rentable |
| 3 | Artistas que trabajan únicamente pintura y escultura |
| 4 | Artista con mayor valor total de obras |
| 5 | Obras anteriores al año 2000 del tema retratos |
| 6 | Clientes en la misma localidad que artistas que no les gustan |
| 7 | Temas con más de una obra asociada (`HAVING`) |
| 8 | Ejecutar todas las consultas |
| 0 | Salir |

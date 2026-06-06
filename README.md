# Galería de Arte — Actividad Grupal BBDD

CLI en Python para consultar y gestionar una base de datos de galería de arte sobre MariaDB.

## Requisitos

- Docker y Docker Compose
- Python 3.10+

## Puesta en marcha

1. Crea un fichero `.env` con las variables de entorno:

   ```env
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=galeria_arte
   DB_USER=galeria
   DB_PASSWORD=secreto
   ```

2. Levanta la base de datos (crea el esquema e inserta los datos automáticamente):

   ```bash
   docker compose up -d
   ```

3. Instala las dependencias de Python:

   ```bash
   pip install -r requirements.txt
   ```

4. Ejecuta la aplicación:

   ```bash
   python main.py
   ```

## Consultas disponibles

| Opción | Descripción |
|--------|-------------|
| a | Tema potencialmente más rentable |
| b | Artistas que trabajan únicamente pintura y escultura |
| c | Artista con mayor valor total de obras |
| d | Obras anteriores al año 2000 del tema retratos |
| e | Clientes en la misma localidad que artistas que no les gustan |
| f | Temas con más de una obra asociada (`HAVING`) |

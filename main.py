import os

import mysql.connector
from dotenv import load_dotenv
from rich import box
from rich.console import Console
from rich.panel import Panel
from rich.table import Table

load_dotenv()

console = Console()


def conectar():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        port=int(os.getenv("DB_PORT", 3306)),
        user=os.getenv("DB_USER", "root"),
        password=os.environ["DB_PASSWORD"],
        database=os.getenv("DB_NAME", "galeria_arte"),
    )


def insertar_cliente():
    conexion = conectar()
    cursor = conexion.cursor()

    console.rule("Insertar nuevo cliente", style="bold cyan")

    dni = input("DNI: ")
    nombre = input("Nombre: ")
    localidad = input("Localidad: ")
    calle = input("Calle: ")
    numero = input("Número: ")
    codigo_postal = input("Código postal: ")

    dinero_total_gastado = float(
        input("Dinero total gastado en la galería: ")
    )

    sql = """
        INSERT INTO cliente 
        (dni, nombre, localidad, calle, numero, codigo_postal, dinero_total_gastado)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """

    valores = (
        dni,
        nombre,
        localidad,
        calle,
        numero,
        codigo_postal,
        dinero_total_gastado
    )

    try:
        cursor.execute(sql, valores)
        conexion.commit()
        console.print("[bold green]Cliente insertado correctamente.[/bold green]")
    except mysql.connector.Error as error:
        console.print(f"[bold red]Error al insertar cliente:[/bold red] {error}")
    finally:
        cursor.close()
        conexion.close()


def ejecutar_consulta(titulo, consulta):
    conexion = conectar()
    cursor = conexion.cursor()

    console.rule(titulo, style="bold cyan")

    try:
        cursor.execute(consulta)
        resultados = cursor.fetchall()

        if not resultados:
            console.print("[dim]No hay resultados.[/dim]")
        else:
            columnas = [desc[0] for desc in cursor.description]
            tabla = Table(box=box.ROUNDED, show_header=True, header_style="bold white")

            for col in columnas:
                tabla.add_column(col)

            for fila in resultados:
                tabla.add_row(*[str(valor) for valor in fila])

            console.print(tabla)

    except mysql.connector.Error as error:
        console.print(f"[bold red]Error:[/bold red] {error}")
    finally:
        cursor.close()
        conexion.close()


def consulta_a():
    sql = """
        SELECT 
            tema.nombre AS tema,
            SUM(cliente.dinero_total_gastado) AS total_gastado_por_clientes_interesados
        FROM tema
        JOIN cliente_tema cliente_tema ON tema.id_tema = cliente_tema.id_tema
        JOIN cliente ON cliente_tema.dni = cliente.dni
        GROUP BY tema.id_tema, tema.nombre
        ORDER BY total_gastado_por_clientes_interesados DESC
        LIMIT 1;
    """

    ejecutar_consulta(
        "a) Tema potencialmente más rentable",
        sql
    )


def consulta_b():
    sql = """
SELECT 
    Artista.nombre_artista
FROM Artista
JOIN Artista_Estilo ON Artista.id_artista = Artista_Estilo.id_artista
JOIN Estilo ON Artista_Estilo.id_estilo = Estilo.id_estilo
GROUP BY Artista.id_artista, Artista.nombre_artista
HAVING 
    COUNT(DISTINCT Estilo.nombre_estilo) = 2
    AND SUM(CASE WHEN Estilo.nombre_estilo IN ('pintura', 'escultura') THEN 1 ELSE 0 END) = 2;
    """

    ejecutar_consulta(
        "b) Artistas que hagan únicamente pintura y escultura",
        sql
    )


def consulta_c():
    sql = """
        SELECT 
            artista.nombre_artista,
            SUM(obra.precio) AS valor_total_obras
        FROM artista artista
        JOIN obra obra ON artista.id_artista = obra.id_artista
        GROUP BY artista.id_artista, artista.nombre_artista
        ORDER BY valor_total_obras DESC
        LIMIT 1;
    """

    ejecutar_consulta(
        "c) Artista con mayor valor",
        sql
    )


def consulta_d():
    sql = """
        SELECT 
    Obra."título",
    Obra.anio_creacion,
    Obra.precio,
    Artista.nombre_artista,
    Tema.nombre AS tema
FROM Obra
JOIN Artista ON Obra.id_artista = Artista.id_artista
JOIN Obra_Tema ON Obra.id_obra = Obra_Tema.id_obra
JOIN Tema ON Obra_Tema.id_tema = Tema.id_tema
WHERE 
    Obra.anio_creacion < 2000
    AND Tema.nombre = 'Retrato';

    """

    ejecutar_consulta(
        "d) Obras anteriores al año 2000 y del tema retratos",
        sql
    )


def consulta_e():
    sql = """
       SELECT DISTINCT
            cliente.nombre AS cliente,
            cliente.localidad,
            artista.nombre_artista AS artista_no_gustado
        FROM cliente
        JOIN artista ON cliente.localidad = artista.localidad
        WHERE NOT EXISTS (
            SELECT 1
            FROM cliente_artista cliente_artista
            WHERE cliente_artista.dni_cliente = cliente.dni
              AND cliente_artista.id_artista = artista.id_artista
);
    """

    ejecutar_consulta(
        "e) Clientes que viven en la misma localidad que artistas que no les gustan",
        sql
    )


def consulta_f():
    sql = """
       SELECT 
            tema.nombre AS tema,
            COUNT(obra.id_obra) AS numero_obras
        FROM tema
        JOIN obra_tema obra_tema ON tema.id_tema = obra_tema.id_tema
        JOIN obra ON obra_tema.id_obra = obra.id_obra
        GROUP BY tema.id_tema, tema.nombre
        HAVING COUNT(obra.id_obra) > 1;
    """

    ejecutar_consulta(
        "f) Temas con más de una obra asociada",
        sql
    )


def mostrar_menu():
    opciones = (
        "1. Insertar nuevo cliente\n"
        "2. Consulta a) Tema más rentable\n"
        "3. Consulta b) Artistas solo pintura y escultura\n"
        "4. Consulta c) Artista con mayor valor\n"
        "5. Consulta d) Obras antes del 2000 de retratos\n"
        "6. Consulta e) Clientes en localidad de artistas no gustados\n"
        "7. Consulta f) Query con HAVING\n"
        "8. Ejecutar todas las consultas\n"
        "0. Salir"
    )
    console.print()
    console.print(Panel(opciones, title="GALERÍA DE ARTE", border_style="cyan"))


def main():
    while True:
        mostrar_menu()
        opcion = input("Elige una opción: ")

        if opcion == "1":
            insertar_cliente()
        elif opcion == "2":
            consulta_a()
        elif opcion == "3":
            consulta_b()
        elif opcion == "4":
            consulta_c()
        elif opcion == "5":
            consulta_d()
        elif opcion == "6":
            consulta_e()
        elif opcion == "7":
            consulta_f()
        elif opcion == "8":
            consulta_a()
            consulta_b()
            consulta_c()
            consulta_d()
            consulta_e()
            consulta_f()
        elif opcion == "0":
            console.print("Saliendo del programa.")
            break
        else:
            console.print("[yellow]Opción no válida.[/yellow]")


if __name__ == "__main__":
    main()

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
            t.nombre AS tema,
            SUM(c.dinero_total_gastado) AS total_gastado_por_clientes_interesados
        FROM tema t
        JOIN cliente_tema ct ON t.id_tema = ct.id_tema
        JOIN cliente c ON ct.dni_cliente = c.dni
        GROUP BY t.id_tema, t.nombre
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
            a.nombre_artistico
        FROM artista a
        JOIN artista_estilo ae ON a.id_artista = ae.id_artista
        JOIN estilo e ON ae.id_estilo = e.id_estilo
        GROUP BY a.id_artista, a.nombre_artistico
        HAVING 
            COUNT(DISTINCT e.nombre) = 2
            AND SUM(CASE WHEN e.nombre IN ('pintura', 'escultura') THEN 1 ELSE 0 END) = 2;
    """

    ejecutar_consulta(
        "b) Artistas que hagan únicamente pintura y escultura",
        sql
    )


def consulta_c():
    sql = """
        SELECT 
            a.nombre_artistico,
            SUM(o.precio) AS valor_total_obras
        FROM artista a
        JOIN obra o ON a.id_artista = o.id_artista
        GROUP BY a.id_artista, a.nombre_artistico
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
            o.titulo,
            o.anio_creacion,
            o.precio,
            a.nombre_artistico,
            t.nombre AS tema
        FROM obra o
        JOIN artista a ON o.id_artista = a.id_artista
        JOIN obra_tema ot ON o.id_obra = ot.id_obra
        JOIN tema t ON ot.id_tema = t.id_tema
        WHERE 
            o.anio_creacion < 2000
            AND t.nombre = 'retratos';
    """

    ejecutar_consulta(
        "d) Obras anteriores al año 2000 y del tema retratos",
        sql
    )


def consulta_e():
    sql = """
        SELECT DISTINCT
            c.nombre AS cliente,
            c.localidad,
            a.nombre_artistico AS artista_no_gustado
        FROM cliente c
        JOIN artista a ON c.localidad = a.localidad_residencia
        WHERE NOT EXISTS (
            SELECT 1
            FROM cliente_artista ca
            WHERE ca.dni_cliente = c.dni
              AND ca.id_artista = a.id_artista
        );
    """

    ejecutar_consulta(
        "e) Clientes que viven en la misma localidad que artistas que no les gustan",
        sql
    )


def consulta_f():
    sql = """
        SELECT 
            t.nombre AS tema,
            COUNT(o.id_obra) AS numero_obras
        FROM tema t
        JOIN obra_tema ot ON t.id_tema = ot.id_tema
        JOIN obra o ON ot.id_obra = o.id_obra
        GROUP BY t.id_tema, t.nombre
        HAVING COUNT(o.id_obra) > 1;
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

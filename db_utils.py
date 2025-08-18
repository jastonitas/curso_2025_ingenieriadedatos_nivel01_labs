from sqlalchemy import create_engine, text
import pandas as pd
import psycopg2

# 1. Crear el engine
engine = create_engine("postgresql+psycopg2://colab:colab@localhost/testdb")

def execute_script(path):
  # Leer el contenido del archivo SQL
  with open(path, "r", encoding="utf-8") as file:
      sql_script = file.read()

  # Ejecutar el script
  with engine.connect() as connection:
      connection.execute(text(sql_script))
      connection.commit()

  print("Script ejecutado exitosamente")


def execute_query(query):
  conn = None
  try:
    return pd.read_sql(query, engine)

  except (Exception, psycopg2.DatabaseError) as error:
      print(f"Error executing SQL script: {error}")

  finally:
      if conn is not None:
          conn.close()

print("Funciones creadas.")

import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()

try:
    mydb = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    if mydb.is_connected():
        print("Connected to the database")
        print(mydb)
        mycursor = mydb.cursor()

        with open(os.getenv("SQL_FILE"), "r") as sql_file:
            sql_commands = sql_file.read().split(";")
            for command in sql_commands:
                command = command.strip()
                if command:
                    mycursor.execute(command)
            mydb.commit()

    else:
        print("Failed to connect to the database")
except mysql.connector.Error as err:
    print(f"Error: {err}")
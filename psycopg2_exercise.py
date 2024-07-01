import os
from dotenv import load_dotenv

import psycopg2 as pg2

load_dotenv()
secret = os.getenv('PG_ADMIN_PASSWORD')

conn = pg2.connect(database='dvdrental', user='postgres', password=secret)

cur = conn.cursor()

cur.execute('SELECT * FROM payment')

data = cur.fetchmany(10)

print(data[0][4])

conn.close()

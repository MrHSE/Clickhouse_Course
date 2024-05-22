import os
import clickhouse_connect


client = clickhouse_connect.get_client(
    host='localhost',
    username='default',
    password=os.environ['ps'],
    port=9999,
    interface='http',
    secure=False
)
response = client.query('SELECT COUNT(*) FROM test.mouseevents;')
print(response.result_rows[0][0])

# 1249

response = client.query(
    'SELECT '
    '   COUNT(*), ms.target '
    'FROM test.mouseevents AS ms '
    'WHERE 1=1 '
    'AND ms.x < 1000 '
    'AND ms.y < 1000 '
    'GROUP BY ms.target;'
)
print('\n'.join([f'{row[0]}\t{row[1]}' for row in response.result_rows]))

# 27	dev – main.py
# 17	postgres2clickhouse.sql - dev - code-server — Mozilla Firefox

response = client.query(
    'SELECT '
    '   x, y, btn_code, target, plus(abs(dx), abs(dy)) AS td '
    'FROM test.mouseevents AS ms '
    'ORDER BY td DESC '
    'LIMIT 20;'
)
print('\n'.join([f'{row[0]}\t{row[1]}\t{row[2]}\t{row[3]}\t{row[4]}' for row in response.result_rows]))

# 1546	553	0	dev – main.py	3092
# 2573	-5	0	dev – main.py	2594
# 2572	-5	0	dev – main.py	2581
# 2573	-5	0	dev – main.py	2581
# 2573	-4	0	dev – main.py	2581
# 2574	-5	0	dev – main.py	2581
# 2573	-4	0	dev – main.py	2581
# 2573	-6	0	dev – main.py	2580
# 2573	-5	0	dev – main.py	2580
# 2574	-6	0	dev – main.py	2580
# 2574	-6	0	dev – main.py	2579
# 2560	-1	0	dev – main.py	2579
# 2573	-6	0	dev – main.py	2579
# 2574	-7	0	dev – main.py	2579
# 2574	-5	0	dev – main.py	2579
# 2572	-6	0	dev – main.py	2579
# 2572	-7	0	dev – main.py	2578
# 2572	-7	0	dev – main.py	2578
# 2572	-7	0	dev – main.py	2578
# 2558	-6	0	dev – main.py	2576

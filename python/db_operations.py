import mysql.connector
import subprocess

def get_ip():
    CMD = 'bash script/ingress_ip.sh'
    p = subprocess.Popen(CMD, stdout=subprocess.PIPE, shell=True, executable='/bin/bash')
    return p.stdout.readlines()[0].strip().decode()

def get_port():
    CMD = 'bash script/db_port.sh'
    p = subprocess.Popen(CMD, stdout=subprocess.PIPE, shell=True, executable='/bin/bash')
    return p.stdout.readlines()[0].strip().decode()

host = get_ip()
port = get_port()
print(host)
print(port)

connection_params = {
    'host': host,
    'port': '31737',
    'user': "root",
    'password': "hello",
    'database': "test-database",
}

print(connection_params)

def get_db_values():
    request = "select * from identity"
    with mysql.connector.connect(**connection_params) as db :
        with db.cursor() as c:
            db.autocommit = True
            #c.excute(request2)
            c.execute(request)
            result = c.fetchall()
            return result

def add_identity(id, name, sex, age, height, nationality):
    params = (id, name, sex, age, height, nationality)
    request = """insert into identity 
            (id, name, sex, age, height, nationality)
             values (%s, %s, %s, %s, %s, %s)"""
    with mysql.connector.connect(**connection_params) as db :
        with db.cursor() as c:
            c.execute(request, params)
            db.commit()
            return 1

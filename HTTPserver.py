import socket
import pymysql
import collections
import jsontosql
import json



j=''
HOST, PORT = '', 80

listen_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listen_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_socket.bind((HOST, PORT))
listen_socket.listen(1)
print 'Serving HTTP on port %s ...' % PORT
while True:
    db = pymysql.connect(host="localhost",  # your host, usually localhost
                         port=3306,
                         user="root",  # your username
                         passwd="Your Password",  # your password
                         db="zonaldesk")  # name of the data base
    cur = db.cursor()
    client_connection, client_address = listen_socket.accept()
    print "connected to"+str(client_address)
    request = client_connection.recv(1024)
    i=1;
    query=''
    while request[-i] != '\n':
        query=query+ request[-i]
        i=i+1
    query=query[::-1]
    print query
    try:
        query=jsontosql._query(query)
    except Exception as e:
        query=str(e)
    try:
        cur.execute(query)
        rows = cur.fetchall()
        rowarray_list = []
        for row in rows:

            rowarray_list.append(row)

        j = json.dumps(rowarray_list)

        print j
    except pymysql.Error as e:
        print str(e)
        j=str(e)
    db.commit()
    db.close()

    http_response = """\
HTTP/1.1 200 OK

"""+j

    client_connection.sendall(http_response)
    client_connection.close()
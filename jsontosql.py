import json

def _query(j):
    #j='{ "type": "select|update|insert", "distinct": "true|false", "function": "null|functions", "columns": "*|column_name", "from": "table_name", "where": "null|condition", "having": "null|condition", "orderby": "null|coulumns,Acs|Des" }'
    #j='{"type":"insert", "into":"tablename", "columns":" , , ","values":"values" }'
    jo = json.loads(j)
    query=''
    if jo['type']=="select":
        query=query+"SELECT"
        if jo['distinct']=="true":
            query= query+" "+"DISTINCT"
        if jo['function']!="null":
            query=query+" "+jo['function']
        query=query+" "+jo['columns']+" "+"FROM"+" "+jo["from"]
        if jo["where"]!="null":
            query=query+" "+"WHERE"+" "+jo["where"]
    if jo['type']=="insert":
        query=query+"INSERT"
        query=query+" "+"INTO"+" "+jo["into"]+" "+"("+jo['columns'] +")"+" "+"VALUES"+"("+" "+jo["values"]+")"
    print query
    return query
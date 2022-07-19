import csv
import pymysql
'모듈 가져오기'

conn = pymysql.connect(host='localhost', user='root', password='1234', db='etf', charset='utf8') 
cursor = conn.cursor()
# DB연결

sql = "INSERT INTO etf (ETF_code, ETF_name, ETF_date, ETF_index, market, assets) VALUES (%s, %s, %s, %s, %s, %s)" 
#쿼리문 etf 테이블에 정보 등록

f = open('data_5558_20220719.csv','r')
rdr = csv.reader(f)
#csv 파일을 읽음

arr = list(rdr)
#csv 파일을 index로 제어하기위해 리스트로 변환
 
for i in range(len(arr)):
    if(i != 0):
    #첫번째 행은 컬럼명이 있기 때문에 0번째 컬럼은 제외
        print(arr[i][1],arr[i][3],arr[i][5],arr[i][6],arr[i][10],arr[i][11])
        cursor.execute(sql,(arr[i][1],arr[i][3],arr[i][5],arr[i][6],arr[i][10],arr[i][11])) 

conn.commit() 
conn.close()
f.close()


import os
import glob
# 파일리스트를 불러오기 위해 사용
from selenium import webdriver
from selenium.webdriver.common.by import By
# selenium 이용하여 웹 크롤링
from time import sleep
# 시자 적용을 위해 사용
import schedule
# 일정시간에 실행을 위해 사용
import csv
# csv파일읽기 위해 사용
import pymysql
# mysql 연동하기 위해 사용

# 웹 크롤링
def download():
    options = webdriver.ChromeOptions() ;
    
    # 다운로드 절대경로 
    prefs = {"download.default_directory" : "D:\CSV"};

    options.add_experimental_option("prefs",prefs);
    #크롬 드라이브를 경로 지정
    driver = webdriver.Chrome(executable_path='D:\chromedriver.exe',chrome_options=options);

    try:

        # 지정된 주소로 이동
        driver.get("http://data.krx.co.kr/contents/MDC/MDI/mdiLoader/index.cmd?menuId=MDC0201030104")
        sleep(2)

        #해당 버튼을 클래스 이름을 통해 선택
        driver.find_element(By.CLASS_NAME,"CI-MDI-UNIT-DOWNLOAD").click()
        sleep(2)

        # 다운로드
        driver.find_element(By.XPATH,"/html/body/div[2]/section[2]/section/section/div/div/form/div[2]/div[2]/div[2]/div/div[2]/a").click()
        sleep(3) #다운 완료되는 시간 고려
        driver.close()
        return "다운로드 완료"
    except:
        print("Invalid URL")
        return "다운로드 실패"

# 파일 리스트 조회
def fileName():
    print(download())

    list_of_files = glob.glob('D:\CSV\*') # * means all if need specific format then *.csv
    latest_file = max(list_of_files, key=os.path.getctime)
    return latest_file

# 파일의 데이터를 DB에 입력
def dbInsert():
    fname = fileName()

    conn = pymysql.connect(host='localhost', user='root', password='1234', db='etf_db', charset='utf8') 
    cursor = conn.cursor()
    # DB연결

    sql = "INSERT IGNORE INTO etf (ETF_code, ETF_name, ETF_date, ETF_index, market, assets) VALUES (%s, %s, %s, %s, %s, %s)" 
    #쿼리문 etf 테이블에 정보 등록

    f = open(fname,'r')
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

# 매일 9시 21분에 실행
job1 = schedule.every().day.at("09:21").do(dbInsert)

# 반복실행
while True:
    schedule.run_pending()
    sleep(2)
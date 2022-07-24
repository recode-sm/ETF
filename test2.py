from selenium import webdriver
from selenium.webdriver.common.by import By

from time import sleep


#크롬 드라이브를 경로 지정
chromedriver = "D:\chromedriver.exe"    
driver = webdriver.Chrome(chromedriver)    

# 지정된 주소로 이동
driver.get("http://data.krx.co.kr/contents/MDC/MDI/mdiLoader/index.cmd?menuId=MDC0201030104")
sleep(2)

#해당 버튼을 클래스 이름을 통해 선택
driver.find_element(By.CLASS_NAME,"CI-MDI-UNIT-DOWNLOAD").click()
sleep(2)

# 다운로드
driver.find_element(By.XPATH,"/html/body/div[2]/section[2]/section/section/div/div/form/div[2]/div[2]/div[2]/div/div[2]/a").click()


from bs4 import BeautifulSoup
import requests
from fake_useragent import UserAgent
import paho.mqtt.client as mqtt
import time
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="ptudiot"
)
topics = [
    "Shome_DHT",
    "Shome_Motion",
    "Shome_Gas",
    "Shome_Security",
    "Shome_Water",
    "Shome_Door",
    "Shome_Light",
    "Shome_Led",
    "Shome_Air",
    "Shome_Humi",
]
# TG temp - humi - light - move -gas - sound -water -air -airAT -humi -humiAT -lightOut -lightAT -door -led - sensor
#       0   1       2       3   4       5       6       7   8   9       10      11          12      13  14      15
dataValue=[0,0,0,"no","no","no",0,"no","no","no","no","no","no","no","no","no"]
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    for topic in topics:
        print(topic)
        client.subscribe(topic)

def on_message(client, userdata, msg):
    data=str(msg.payload.decode("utf-8"))
    print(msg.topic+" "+ data)
    match msg.topic:
        case "Shome_DHT":
            temp=data.split(',')
            dataValue[0]=temp[0]
            dataValue[1]=temp[1]
        case "Shome_Light":
            ##?????????????
            # dataValue[2]=data
            if data=="on":
                dataValue[11]="yes"
            elif data=="off":
                dataValue[11]="no"
            elif data=="onat":
                dataValue[12]="yes"
            elif data=="offat":
                dataValue[12]="no"
            else:
                dataValue[2]=data
        case "Shome_Motion":
            if data=="on":
                dataValue[3]="yes"
            else:
                dataValue[3]="no"
        case "Shome_Gas":
            if data=="warn":
                dataValue[4]="yes"
            else:
                dataValue[4]="no"
        case "Shome_Security":
            if data=="warn":
                dataValue[5]="yes"
            else:
                dataValue[5]="no"
        case "Shome_Water":
            if data=="on":
                dataValue[15]="yes"
            elif data=="off":
                dataValue[15]="no"
            else:
                dataValue[6]=data
        case "Shome_Air":
            if data=="on":
                dataValue[7]="yes"
            elif data=="off":
                dataValue[7]="no"
            elif data=="onat":
                dataValue[8]="yes"
            else:
                dataValue[8]="no"
        case "Shome_Humi":
            if data=="on":
                dataValue[9]="yes"
            elif data=="off":
                dataValue[9]="no"
            elif data=="onat":
                dataValue[10]="yes"
            else:
                dataValue[10]="no"
        case "Shome_Door":
            if data=="on":
                dataValue[13]="yes"
            elif data=="off":
                dataValue[13]="no"
        case "Shome_Led":
            if data=="on":
                dataValue[14]="yes"
            elif data=="off":
                dataValue[14]="no"
    # sql = "INSERT INTO `nhietdo`(`Thoigian`, `Nhietdo`) VALUES (%s,%s)"
    # val = ("a", "abc")
    # print(mycursor.rowcount, "record inserted.")
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect("broker.emqx.io", 1883, 60)
client.loop_start()  # Thêm dòng này
headers = {
    'User-Agent': UserAgent().random,
    'Accept-Language': 'en-US,en;q=0.9,vi-VN;q=0.8,vi;q=0.7',
}
def find_weather(city_name):
   city_name="thời tiết "+city_name
   city_name = city_name.replace(" ", "+")
 
   try:
       res = requests.get(
           f'https://www.google.com/search?q=${city_name}', headers=headers)
       soup = BeautifulSoup(res.text, 'html.parser')
 
       temp = soup.select('#wob_tm')[0].getText().strip()
       humi = soup.select('#wob_hm')[0].getText().strip()[:-1]
       wdsd = soup.select('#wob_ws')[0].getText().strip()[:-5]
       info = soup.select('#wob_dc')[0].getText().strip()
       alli4=f"{info},{temp},{humi},{wdsd}"
       print(alli4)
       client.publish("Shome_ReciveWeather",alli4)
   except:
       print("error")
try:
    while True:
        find_weather("Vĩnh Long")
        time.sleep(5)
        mycursor = mydb.cursor()
        sql = f"INSERT INTO `data` (`temp`, `humi`, `light`, `move`, `gas`, `secur`, `water`, `air`, `airat`, `mois`, `moisat`, `lightout`, `lightat`, `door`, `led`, `sensor`) VALUES ({dataValue[0]}, {dataValue[1]}, {dataValue[2]}, '{dataValue[3]}', '{dataValue[4]}', '{dataValue[5]}', {dataValue[6]}, '{dataValue[7]}', '{dataValue[8]}', '{dataValue[9]}', '{dataValue[10]}', '{dataValue[11]}', '{dataValue[12]}', '{dataValue[13]}', '{dataValue[14]}', '{dataValue[15]}')"
        # print(sql)
        mycursor.execute(sql)
        mydb.commit()
except KeyboardInterrupt:
    client.disconnect()
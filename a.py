from bs4 import BeautifulSoup
import requests
from fake_useragent import UserAgent
import paho.mqtt.client as mqtt
import time

# DHTTopic = "Shome_DHT"
# MotionTopic = "Shome_Motion"
# GasTopic = "Shome_Gas"
# SecurityTopic = "Shome_Security"
# PhotoresistorTopic = "Shome_Photoresistor"
# WaterTopic = "Shome_Water"
# DoorTopic = "Shome_Door"
# LightTopic = "Shome_Light"
# LedTopic = "Shome_Led"
# AirTopic = "Shome_Air"
# HumiTopic = "Shome_Humi"
topics = [
    "Shome_DHT",
    "Shome_Motion",
    "Shome_Gas",
    "Shome_Security",
    "Shome_Photoresistor",
    "Shome_Water",
    "Shome_Door",
    "Shome_Light",
    "Shome_Led",
    "Shome_Air",
    "Shome_Humi",
]
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    for topic in topics:
        client.subscribe(topic)

def on_message(client, userdata, msg):
    print(msg.topic+" "+ str(msg.payload.decode("utf-8")))

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("broker.emqx.io", 1883, 60)
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
except KeyboardInterrupt:
    client.disconnect()
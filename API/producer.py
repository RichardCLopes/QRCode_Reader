#!/usr/bin/env python   
import pika
import json
import config as cfg

def SendJson(JsonData):
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=cfg.RABBIT_HOST))
    channel = connection.channel()
    print("#### enviando para o Rabbitq ####")

    channel.queue_declare(queue=cfg.QUEUE_TOPIC, durable=True)

    channel.basic_publish(exchange='', routing_key=cfg.QUEUE_TOPIC, body=json.dumps(JsonData))
    
    print(" [x] Sent 'Hello World!'")
    connection.close()

if __name__ =="__main__":
    data = {  
    "id": 1,         
    "name": "My Name",         
    "description": "This is description about me"     
    } 
    SendJson(data)
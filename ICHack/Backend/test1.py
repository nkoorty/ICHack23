# # import requests
# # import random
# # import time

# # url= "http://localhost:3003/api/hr_timestamps"
# # timestamp = 0;
# # while True:
# #     timestamp += 1
# #     random_number = random.randint(1, 100)
# #     data = {"Heart Rate": random_number, 
# #              "timestamp": timestamp}
# #     response = requests.post(url, data=data)
# #     print("Sent:", data,"Response:", response.text)
# #     time.sleep(1)

# import websocket
# import json

# def on_message(ws, message):
#     # Handle the message received from the socket
#     data = json.loads(message)
#     # Update the hr_list and time_list with the data received
#     hr_list.append(data["hr"])
#     time_list.append(data["time"])

# def on_error(ws, error):
#     # Handle any errors that occur
#     print(f"Error: {error}")

# def on_close(ws):
#     # Handle the closure of the websocket connection
#     print("Connection closed")

# def send_data(hr, time):
#     # Send data to the websocket
#     data = {"hr": hr, "time": time}
#     ws.send(json.dumps(data))

# if __name__ == "__main__":
#     # Create the websocket connection
#     ws = websocket.WebSocket("http://localhost:3003", 
#                              socket=any, 
#                              rfile=any)
#     ws.run_forever()

#     # Send some test data
#     send_data(70, "12:00:00")
#     send_data(72, "12:05:00")
#     send_data(75, "12:10:00")
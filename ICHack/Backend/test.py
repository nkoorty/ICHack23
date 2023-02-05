import requests

url = "	https://webhook.site/e4a8924f-af37-46ae-90e9-19825c789e1f"
response = requests.get(url)

print(response.status_code)
print(response.text)
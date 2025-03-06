import os
from storygraph_api import User
from dotenv import load_dotenv
from pathlib import Path

dotenv_path = Path('/home/kat/Documents/Code/Git/storygraph-api/.env')

load_dotenv(dotenv_path=dotenv_path)
cookie = os.getenv('COOKIE') # retrieve cookie from .env file
uname = 'visualkill' #some username 
user = User()
result = user.currently_reading(uname,cookie=cookie)
print(result)

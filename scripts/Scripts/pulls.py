import os
from dotenv import load_dotenv
from pathlib import Path
from Comic_Geeks import Comic_Geeks

dotenv_path = Path('/home/kat/Documents/Code/Git/comicgeeks-0.3.4')

load_dotenv(dotenv_path=dotenv_path)
cookie = os.getenv('COOKIE')

client = Comic_Geeks(cookie)

# get info about an issue
client.issue_info(3616996)

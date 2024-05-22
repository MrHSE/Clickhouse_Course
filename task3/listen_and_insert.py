import os
from datetime import datetime

from pynput.mouse import Listener
from win32gui import GetWindowText, GetCursorPos, WindowFromPoint
from infi.clickhouse_orm import Database, Buffer

from models import MouseEvents


db = Database(
    'test',
    db_url='http://localhost:9999/',
    username='default',
    password=os.environ['ps'],
    readonly=False,
    autocreate=False,
    timeout=60,
    verify_ssl_cert=False,
    log_statements=False
)
bf_table = Buffer(MouseEvents, num_layers=8, min_time=10, max_time=100, min_rows=10000, max_rows=1000000)
db.create_table(MouseEvents)
last_move = MouseEvents(x=0, y=0, dx=0, dy=0, dt=datetime.now(), btn_code=0, target='')


def on_move(x, y):
    global last_move
    mouse_event = MouseEvents(
        x=x, y=y,
        dx=x-last_move.x,
        dy=x-last_move.y,
        dt=datetime.now(),
        btn_code=0,
        target=GetWindowText(WindowFromPoint(GetCursorPos()))
    )
    last_move = mouse_event
    db.insert([last_move])


def on_click(x, y, button, *args):
    global last_move
    mouse_event = MouseEvents(
        x=x, y=y,
        dx=x - last_move.x,
        dy=x - last_move.y,
        dt=datetime.now(),
        btn_code=button.value[0],
        target=GetWindowText(WindowFromPoint(GetCursorPos()))
    )
    last_move = mouse_event
    db.insert([mouse_event])


while True:
    with Listener(on_move=on_move, on_click=on_click) as listener:
        listener.join()

# Fetches the latest crossword clues from the times
# For use in my neovim config

import datetime
import urllib.parse
import re
import html
import os
import json

import requests
from bs4 import BeautifulSoup

# Filters to decide which crossword to take. Not all are available every day.
PRECEDENCE = ["O Tempora", "Quick Cryptic", "Times Cryptic No", "Concise No"]

# The value of acs_tnl can be found in a cookie for thetimes.co.uk
secrets_filename = os.path.join(
    os.path.dirname(os.path.realpath(__file__)), "./.secrets.json"
)
ACS_TNL = json.load(open(secrets_filename, "r"))["acs_tnl"]


def crossword_urls_for_date(crossword_date):
    cookies = {"acs_tnl": ACS_TNL}

    date_string = urllib.parse.quote(crossword_date.strftime("%d/%m/%Y"), safe="")
    url = f"https://www.thetimes.co.uk/puzzleclub/crosswordclub/puzzles-list?filter%5Bpuzzle_type%5D=&filter%5Bpublish_at%5D%5Bfrom%5D={date_string}&filter%5Bpublish_at%5D%5Bto%5D={date_string}"

    resp = requests.get(url, cookies=cookies)
    soup = BeautifulSoup(resp.text, "html.parser")

    todays_puzzles = []
    for puzzle in soup.find_all("div", {"class": "puzzle-link"}):
        title = puzzle.find("h3", {"class": "puzzle-list-puzzle-title"}).text
        link = puzzle.find("a", {"class": "puzzle-title-link"})["href"]
        print_link = puzzle.find("p", {"class": "PuzzleItem--print-link"}).find("a")[
            "href"
        ]
        todays_puzzles.append({"title": title, "link": link, "print_link": print_link})

    puzzle = None
    for puzzle_type in PRECEDENCE:
        matching_puzzles = [
            p for p in todays_puzzles if puzzle_type.lower() in p["title"].lower()
        ]
        if len(matching_puzzles) > 0:
            puzzle = matching_puzzles[0]
            break

    resp = requests.get(puzzle["print_link"], cookies=cookies, allow_redirects=False)
    redirect_url = resp.headers["Location"]
    crossword_data_url = redirect_url[: redirect_url.rfind("/")] + "/data.json"

    return crossword_data_url, puzzle["link"]


def fetch_crossword(crossword_data_url):
    resp = requests.get(crossword_data_url).json()
    copy = resp["data"]["copy"]

    clues = []
    for direction in copy["clues"]:
        for clue in direction["clues"]:
            clue = f'{clue["number"]}{direction["title"][0].lower()} - {html.unescape(clue["clue"])} ({clue["length"]})'
            clues.append(clue)

    return clues


try:
    today = datetime.date.today()
    crossword_data_url, crossword_web_url = crossword_urls_for_date(today)
    clues = fetch_crossword(crossword_data_url)

    shortest_clue = min(clues, key=len)
    with open(
        os.path.join(os.path.dirname(os.path.realpath(__file__)), "crossword.txt"), "w+"
    ) as f:
        f.write(f"{crossword_web_url}\n")
        f.write(shortest_clue)
except Exception as e:
    with open(
        os.path.join(os.path.dirname(os.path.realpath(__file__)), "crossword.txt"), "w+"
    ) as f:
        print(e)
        f.write(
            "https://www.thetimes.co.uk/puzzleclub/crosswordclub/\nAlas your script is broken..."
        )

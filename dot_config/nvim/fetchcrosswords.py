# Fetches the latest crossword clues from the times
# For use in my neovim config
# Uses only Python standard library - no external dependencies

import re
import html
import os
import json
import urllib.request

# Filters to decide which crossword to take. Not all are available every day.
PRECEDENCE = ["concise", "cryptic", "quick-cryptic", "tempora"]


def find_crossword_link():
    """Fetch the main crossword page and extract a crossword puzzle link."""
    url = "https://www.thetimes.com/puzzles/crossword"

    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response:
        html_content = response.read().decode('utf-8')

    # Find all crossword links matching the pattern
    # <a href="/puzzles/crossword/times-concise-no-9966-ntzs3pbhn"
    pattern = r'<a[^>]+href="(/puzzles/crossword/[^"]+)"'
    matches = re.findall(pattern, html_content)

    # Filter by precedence
    for puzzle_type in PRECEDENCE:
        for match in matches:
            if puzzle_type in match.lower():
                return "https://www.thetimes.com" + match

    # If no preferred type found, return the first match
    if matches:
        return "https://www.thetimes.com" + matches[0]

    raise Exception("No crossword link found")


def find_feed_url(crossword_page_url):
    """Extract the feed URL from the crossword page."""
    req = urllib.request.Request(crossword_page_url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response:
        html_content = response.read().decode('utf-8')

    # Look for feed URL pattern like:
    # https://feeds.thetimes.com/puzzles/sp/crosswordconcise/20251015/74651/
    pattern = r'https://feeds\.thetimes\.com/puzzles/[^"\s]+'
    match = re.search(pattern, html_content)

    if match:
        feed_url = match.group(0)
        # Ensure it ends with /
        if not feed_url.endswith('/'):
            feed_url += '/'
        return feed_url, feed_url + 'data.json'

    raise Exception("No feed URL found")


def fetch_crossword(crossword_data_url):
    """Fetch and parse the crossword data JSON."""
    req = urllib.request.Request(crossword_data_url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response:
        data = json.loads(response.read().decode('utf-8'))

    copy = data["data"]["copy"]

    clues = []
    for direction in copy["clues"]:
        for clue in direction["clues"]:
            clue_text = f'{clue["number"]}{direction["title"][0].lower()} - {html.unescape(clue["clue"])} ({clue["length"]})'
            clues.append(clue_text)

    return clues


try:
    crossword_page_url = find_crossword_link()
    feed_url, crossword_data_url = find_feed_url(crossword_page_url)
    clues = fetch_crossword(crossword_data_url)

    shortest_clue = min(clues, key=len)
    with open(
        os.path.join(os.path.dirname(os.path.realpath(__file__)), "crossword.txt"), "w"
    ) as f:
        f.write(f"{feed_url}\n")
        f.write(shortest_clue)
except Exception as e:
    with open(
        os.path.join(os.path.dirname(os.path.realpath(__file__)), "crossword.txt"), "w"
    ) as f:
        print(f"Error: {e}")
        f.write(
            "https://www.thetimes.com/puzzles/crossword\nAlas your script is broken..."
        )

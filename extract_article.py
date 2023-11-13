#!/usr/bin/env python3

import sys
import bz2
import xml.etree.ElementTree as ET

OFFSET = int(sys.argv[1])
FILE_SIZE = int(sys.argv[2])
PAGE_ID = int(sys.argv[3])
FILE = sys.argv[4]

print("extracting...")

f = open(FILE, "rb")
f.seek(OFFSET)
block = f.read(FILE_SIZE)
xml = bz2.decompress(block).decode("utf-8")
root = ET.fromstring("<root>" + xml + "</root>")
page = root.find(f".//page[id='{PAGE_ID}']")
title = page.find("title").text
print(f"title: {title}")
tree = ET.ElementTree(page)
tree.write(f"./wiki/{title}.xml", encoding="utf-8")
f.close()

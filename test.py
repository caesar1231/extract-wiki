import bz2
import xml.etree.ElementTree as ET

# 日本政治史
OFFSET = 1106321235
# 日本政治史の次のブロックの先頭
NEXT_OFFSET = 1106480011
# 日本政治史のページID
PAGE_ID = 717826

f = open("wiki.xml.bz2", "rb")
f.seek(OFFSET)
block = f.read(NEXT_OFFSET - OFFSET)
xml = bz2.decompress(block).decode("utf-8")
root = ET.fromstring("<root>" + xml + "</root>")
page = root.find("page/[id='%s']" % PAGE_ID)
tree = ET.ElementTree(page)
tree.write("japan_politics.xml", encoding="utf-8")
title = page.find("title").text
print(title)
f.close()

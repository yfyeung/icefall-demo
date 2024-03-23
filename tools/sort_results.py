import re
from collections import defaultdict

pattern = r"epoch-(\d+)-avg-(\d+)"

score = defaultdict(float)


for test_set in ["1", "2"]:
    with open(test_set) as f:
        lines = f.read().splitlines()

    for line in lines:
        line = line.split(" ", 1)
        key = re.search(pattern, line[1]).group()
        score[key] += float(line[0])

score = sorted(score.items(), key=lambda x: x[1])

for line in score:
    print(line[0], line[1])

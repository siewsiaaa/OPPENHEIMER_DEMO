import csv


def setup(self):

fields = []
rows = []

f = open("../TestData/WorkingClassHeroData.csv", "r")

csvReader = csv.reader(f)

for row in csvReader:
    rows.append(row)

for i in rows:
    for j in i:
        print(j, end=",")
    print('/n')


import datetime
import csv

class Calculation:

    def __init__(self): #, name, gender, birthday, salary, tax):
        """
        Constructor class that instantiates calculations
        """
        #self.name = name
        #self.gender = gender
        #self.birth_year = birth_year
        #self.salary = salary
        #self.tax = tax
        #self.tax_relief = tax_relief



    def calculateAge(self, year):
        now = datetime.datetime.now()
        print(now.year)
        return now.year - year

    def getGenderBonus(self, gender):
        if gender == 'F':
            return 500
        else:
            return 0

    def getVariable(self, age):
        if age <= 18:
            return 1
        elif age <= 35:
            return 0.8
        elif age <= 50:
            return 0.5
        elif age <= 75:
            return 0.367
        else:
            return 0.05

    def getYear(self, birthday):


    def calculateTaxRelief(self, amt, variable, g_bonus):
        tax_relief = (amt*variable)+g_bonus

fields = []
rows = []

f = open("../TestData/WorkingClassHeroData.csv", "r")

csvReader = csv.reader(f)

for row in csvReader:
    rows.append(row)

for i in rows:
    for j in i:
        print(j, end=",")
        fields.append(j)
    print('/n')

print(rows)
#print(fields)


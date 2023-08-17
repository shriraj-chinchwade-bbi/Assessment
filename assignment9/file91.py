
class Student:
    def __init__(self,roll,name):
        self.roll = roll
        self.name = name
    def __add__(self,other):
        if isinstance(other,Student):
            new_roll=self.roll + other.roll
            return new_roll
    def __addstr__(self,other):
        if isinstance(other,Student):
            new_name=self.name+other.name
            return new_name
a=Student(23,'alex')
b=Student(29,'birju')
c=a+b
print(Student.__addstr__(a,b))
print(c)

# output:-
# alexbirju
# 52

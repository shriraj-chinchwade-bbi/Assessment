from  abc import ABC, abstractmethod
class Vehicle(ABC):
    
    def __init__(self,make,model):
        self._make=make
        self._model=model
       
    def get_make(self):
        return self._make
        
       
    def get_model(self):
        return self._model
        
    @abstractmethod 
    def display_info(self):
        pass

class Car(Vehicle):
    def __init__(self, make, model,fuel_type):
        super().__init__(make, model)
        self.__fuel_type = fuel_type
    def get_fuel_type(self):
        return self.__fuel_type
    def display_info(self):
        
        print(f"Make:{self._make}, Model:{self._model}")
        print(f"fuel type: {self.__fuel_type}")

class Motorcycle(Vehicle):
    def __init__(self, make, model,engine_capacity):
        super().__init__(make, model)
        self.__engine_capacity = engine_capacity
    def get_engine_capacity(self):
        return self.__engine_capacity
    def display_info(self):
        print(f"Make:{self._make}, Model:{self._model}")
        print(f"Engine capacity: {self.__engine_capacity}")

car1=Car("BMW","x5","Diseal")
motorcycle1=Motorcycle("Suzuki","Gixxar","150cc")
# print(car1.display_info())
# print(motorcycle1.display_info())

n=int(input("How many vehicles to enter in registry: "))
vehicles_list=[]
for i in range(n):
    make=input("Enter vehicle make: ")
    model=input("Enter vehicle model: ")
    x=input("Car or Motorcycle: ")
    if x=="Car" or x=="car":
        fuel_type=input("Enter vehicle fuel type: ")
        vehicles_list.append(Car(make,model,fuel_type))
    elif x=="Motorcycle" or x=="motorcycle":
        engine_capacity=input("Enter vehicle engine capacity: ")
        vehicles_list.append(Motorcycle(make,model,engine_capacity))

print("\nVehicle info list:")
for vehicle in vehicles_list:
    vehicle.display_info()

# output:-
# How many vehicles to enter in registry: 1
# Enter vehicle make: toyota
# Enter vehicle model: corrolla
# Car or Motorcycle: car
# Enter vehicle fuel type: petrol

# Vehicle info list:
# Make:toyota, Model:corrolla
# fuel type: petrol

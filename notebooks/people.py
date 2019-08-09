
from typing import Iterable, List


class Person:
    
    def __init__(self, name):
        self.name = name

        
def get_people(*names: Iterable[str]) -> List[Person] :
    return [Person(name) for name in names]
    
    
people = get_people("Alice", "Bob")

people[1].age

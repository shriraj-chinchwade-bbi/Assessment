import random

class human:
    def __init__(self):
        self.hp=50

class hero(human):
    def __init__(self,high_iq=False):
        super().__init__()
        self.light_attack=10
        if high_iq:
            self.light_attack+=5

class monster(human):
    def __init__(self,big_body=False):
        super().__init__()
        self.dark_attack=10
        if big_body:
            #self.dark_attack+=5
            self.hp+=5



def team(n_hero,n_monster,n_highiq,n_bigbody):
    heroes=[hero(high_iq=True) if i<n_highiq else hero()for i in range(n_hero)]
    monsters=[monster(big_body=True) if i<n_bigbody else monster()for i in range(n_monster)]
    return heroes,monsters

def fight(heroes,monsters):
    while heroes and monsters:
        for hero in heroes:
            if monsters:
                target=random.choice(monsters)
                target.hp-=hero.light_attack
                if target.hp<=0:
                    monsters.remove(target)

        for monster in monsters:   
            if heroes:
                target=random.choice(heroes)
                target.hp-=monster.dark_attack
                if target.hp<=0:
                    heroes.remove(target)
    if heroes:
        for hero in heroes:
            print("🦸",end=" ")
        return "Heroes Won"
    elif monsters:
        for monster in monsters:
            print("👹",end=" ")
        return "Monsters Won"
    else:
        return "Draw"      
                
h=int(input("Enter number of heroes🦸:"))
m=int(input("Enter number of monsters👹:"))                      
high_iq_limit=int(input("Enter number of High_IQ heroes:"))
big_body_limit=int(input("Enter number of Big Body monsters:"))

print("\nFight Night\n🦸vs👹 \n\nwinners are:")
heroes,monsters=team(h,m,high_iq_limit,big_body_limit)
result=fight(heroes,monsters)
print(result)


'''
Enter number of heroes🦸:6
Enter number of monsters👹:6
Enter number of High_IQ heroes:2
Enter number of Big Body monsters:6

Fight Night
🦸vs👹 

winners are:
🦸 🦸 🦸 🦸 Heroes Won
'''

input_str="2TZ1C1N1NJSNAOETOP7T8N4FZEULH3DJKZH7PDLP3C54JJKDOTUIPEGO8097"


def secret_key(input_str):
    last_4_character = input_str[-4:]
    
    output=""
    skip_length=[]
    for char in last_4_character:
        skip_length.append(int(char))
    index=0
    for skip in skip_length:
        index+=skip
        output+=input_str[index:index+8]
        index+=8
    return output
print(secret_key(input_str))

# output="NJSNAOETOP7T8N4FZH7PDLP3OTUIPEGO"

        

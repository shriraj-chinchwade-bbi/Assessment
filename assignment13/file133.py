input_str="EJLGNAGS9GLI87RLW8RD0460CUZD8103"


def secret_key(input_str):
    last_4_character = input_str[-4:]
    
    skip_length=[]
    for char in last_4_character:
        skip_length.append(int(char))
    index=0
    output_arr=[]
    for skip in skip_length:
        index+=skip
        output_arr.append(input_str[index:index+4])
        index+=4
    output=''.join(output_arr[::-1])
    return output
print(secret_key(input_str))

# otput:- "CUZD8RD07RLW9GLI"

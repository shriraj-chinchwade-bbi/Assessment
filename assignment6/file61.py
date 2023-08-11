given=str(input("enter string to check : "))

def longpal(string):
    n=len(string)
    longest=""
    for i in range(n):
        for j in range(i+1,n+1):
            w=string[i:j]
            '''print(w)'''
            if w==w[::-1]:
                if len(w)>len(longest):
                    
                    longest=w
    return "longest palindrome is : "+longest
print(longpal(given))

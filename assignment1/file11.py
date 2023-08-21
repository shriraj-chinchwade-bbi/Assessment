'''You are given two arrays rowSum and colSum of non-negative integers where rowSum[i] is the sum of the elements in the ith row and colSum[j] is the sum of the 
elements of the jth column of a 2D matrix. In other words, you do not know the elements of the matrix, but you do know the sums of each row and column.
Find any matrix of non-negative integers of size rowSum.length x colSum.length that satisfies the rowSum and colSum requirements.
Return a 2D array representing any matrix that fulfills the requirements. It's guaranteed that at least one matrix that fulfills the requirements exists.'''
#hardcode input
rowSum = [3,8]
colSum = [4,7]

def newmatrix(row, col):
    x,y=len(row),len(col)
    a=[[0]*y for i in range(x)]
    for i in range(x):
        for j in range(y):
            a[i][j]=min(row[i],col[j])
            row[i]-=a[i][j]
            col[j]-=a[i][j]
    return a
result=newmatrix(rowSum,colSum)
for row in result:
    print(row)
    print("hello ")

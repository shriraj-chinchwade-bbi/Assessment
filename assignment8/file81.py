grid=[["X","O","X"],
      ["X","O","X"],
      ["O","X","O"]]

a=0
def winner_who(grid):
    for i in range(len(grid[0])):
        
        if grid[i][0] == grid[i][a+1]==grid[i][a+2] and grid[i][0]!="":
            #row
            return grid[i][0]
        if grid[0][i] == grid[a+1][i] ==grid[a+2][i] and grid[0][i]!="":
            #column
            return grid[0][i]
    if grid[0][0]==grid[1][1] == grid[2][2] and grid[0][0]!="":
        #diagonalright
        return grid[0][0]
    if grid[0][2]==grid[1][1]==grid[2][0] and grid[0][2]!="":
        #diagonalleft
        return grid[0][2]
    return None
    
def tic_tack_toe(grid):
    winner= winner_who(grid)
    if winner:
        return winner+" is winning."
    elif "" in grid[0] or "" in grid[1] or "" in grid[2]:
        return "Pending"
    else:
        return "Draw"
    
print(tic_tack_toe(grid))

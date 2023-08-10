'''Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. 
That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
Return the answer in an array.'''
#hardcode input
numS = [8,1,2,2,3]
Output: [4,0,1,1,3]

def smallnum(nums): 
    ans=[]
    for i in range(len(nums)):
        counter=0
        for j in range(len(nums)):
            if nums[i]>nums[j]:
                counter+=1
                ans.append(counter)
    return ans

output=smallnum(numS)
print(output)
#complexity=O(n^2)

def smallnum2(nums):
    sorted_nums=sorted(nums)
    count={}
    for i, j in enumerate(sorted_nums):
        if j not in count:
            count[j]=i
    ans2=[count[j] for j in nums]
    return ans2
print(smallnum2(numS))
#complexity=sorting complexity only O(nlogn)

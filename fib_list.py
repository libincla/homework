#coding:
'''
origin fib list = [1,1,2]
'''

origin_fib_list = [1,1,2]
fib_list = [1,1,2]

def fib_item(n):
    if n <= 3:
        return origin_fib_list
    while n - 3 > 0:
        fib_list.append(fib_list[-1] + fib_list[-2])
        n -= 1
    return fib_list

print(fib_item(10))

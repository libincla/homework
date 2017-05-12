#coding:utf-8

def prime(n):
    if n <= 1:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return n

if __name__ == '__main__':
    prime_list = []
    for x in range(1000000):
        if prime(x) != False:
            prime_list.append(x)

print(prime_list)
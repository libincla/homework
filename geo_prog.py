#coding:utf-8

'''
geo_prog:等比级数
geo_list:等比数列
n: 等比数列的常数
m: 等比数列的项数
'''


from   random import  randint

geo_list = []

n = randint(1,10)
m = randint(1,10)

for i in range(1,m +1):
    geo_list.append(n ** i)


geo_prog = sum(geo_list)

print(geo_prog,'is the geo_progression')


#coding:utf-8

l1 = ['a','b','a','b',123,2,'b']
l2  = []

for i in l1:
	if i not in l2:
		l2.append(i)
	print(l2)



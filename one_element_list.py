#coding:utf-8

exam_list = [45,'a','b',14,'cook','tornado','tornado',13,'a','b','a','a','b','b']

l1 = [ str(x) for x in exam_list ]
l1.sort()

k = iter(l1)
count = 1
final_list = []
flag = True

while count < len(l1):

    oldone = next(k)
    newone = l1[count]

    if oldone != newone:
        final_list.append(oldone)


    count += 1

final_list.append(l1[-1])

print(l1)
print(final_list)

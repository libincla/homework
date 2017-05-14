#!/root/.pyenv/versions/3.6.1/bin/python3

import os

dir_list = ['.']
file_list = []
dir_list2 = []

while dir_list:
	cur = dir_list.pop()
	print(dir_list)
	for i in os.scandir(cur):
		if i.is_dir():
			dir_list.append(i)
			dir_list2.append(i)
		else:
			file_list.append(i)

print('*' * 25)
print(dir_list)
print('^' * 15)
print(dir_list2)
print('-' * 30)
print(file_list)		

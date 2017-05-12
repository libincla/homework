#!/root/.pyenv/versions/3.6.1/bin/python3

def triangle(m,n):
	lst = [1]
	while True:
		yield lst
		lst.append(0)
		lst = [ lst[i-1] + lst[i] for i in range(len(lst)) ]
	return(lst[m][n])

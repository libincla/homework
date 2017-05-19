#coding:utf-8

exam_words = [ 'i','love','i','hate','love','go','hate']



def simpleway(Args):

    # import collections.Counter
    from  collections import  Counter

    result = Counter(Args)
    print(result)




def DIYway(Args):

    iterable_obj = iter(Args)
    standard_dict = {}
    lst_ord = 1
    count =  1
    flag = 1
    while flag:
        tmp = next(iterable_obj)
        standard_dict[tmp] = count
        lst_ele = Args[lst_ord]


        if lst_ele in standard_dict:
            count += 1
            standard_dict[lst_ele] = count
        
	else:
	    count = 1
        lst_ord += 1
        if lst_ord > len(Args)-1:
            flag = 0
    print('finally')
    print(standard_dict)


DIYway(exam_words)

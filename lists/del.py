name_file = "hosts.txt"
f = open(name_file,'r').read()
total = f.split('\n')
f = f.split('\n')
f = set(f)
print(f)
print(len(total) - len(f),'всего удалённых строк')
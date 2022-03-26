filetosearch = '/etc/mysql/mariadb.conf.d/50-server.cnf'
texttoreplace = '127.0.0.1'
texttoinsert = '0.0.0.0'

s = open(filetosearch).read()
s = s.replace(texttoreplace, texttoinsert)
f = open(filetosearch, 'w')
f.write(s)
f.close()
quit()

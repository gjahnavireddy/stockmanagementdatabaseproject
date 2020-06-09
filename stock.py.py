import mysql.connector

cnx=mysql.connector.connect(host='localhost',database='stockmanagement',user='new',password='newuser12321')


def printstockinfo():
	print()
	print()
	query="select * from stockcomp"
	cursor.execute(query)
	records = cursor.fetchall()
	#mx = len(max((sub[0] for sub in records),key=len))
	mx=20
	head=["stockcompid","company_name","capitol_in_rs_cr","open","high","low","current_price","previous_price","change_percentage"]
	print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in head]))
	for row in records:
		print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in row]))

def printtopgainers():
	print()
	print()
	query="select * from top_gainers"
	cursor.execute(query)
	records = cursor.fetchall()
	mx=20
	head=["stock_id","current_price","52week_high","52week_low"]
	print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in head]))
	for row in records:
		print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in row]))

def printtoplosers():
	print()
	print()
	query="select * from top_gainers"
	cursor.execute(query)
	records = cursor.fetchall()
	mx=20
	head=["stock_id","current_price","52week_high","52week_low"]
	print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in head]))
	for row in records:
		print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in row]))

def printusercredentials():
	print()
	print()
	query="select * from user_credentials"
	cursor.execute(query)
	records = cursor.fetchall()
	mx=20
	head=["name","user_id","age","investment","networth","password"]
	print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in head]))
	for row in records:
		print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in row]))

def printusertransaction():
	print()
	print()
	query="select * from user_transaction"
	cursor.execute(query)
	records = cursor.fetchall()
	mx=20
	head=["user_id","company_id","buying_price","qty","current_price","time","gain"]
	print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in head]))
	for row in records:
		print(" ".join(["{:<{mx}}".format(ele,mx=mx) for ele in row]))


def insert_user_credentials(name,user_id,age,investment,networth,password):
	cursor.execute("insert into user_credentials(name,user_id,age,investment,networth,password) VALUES(%s,%s,%s,%s,%s,%s)",(name,user_id,age,investment,networth,password))
	cnx.commit()


def insert_user_transaction(user_id,company_id,buying_price,qty,current_price,time,gain):
	cursor.execute("insert into user_transaction(user_id,company_id,buying_price,qty,current_price,time,gain) VALUES(%s,%s,%s,%s,%s,%s,%s)",(user_id,company_id,buying_price,qty,current_price,time,gain))
	cnx.commit()

def delete_user_transaction(user_id):
	cursor.execute("delete from user_transaction where user_id=%s",(user_id,))
	cnx.commit()

cursor=cnx.cursor()

x=0

while(x!=10):
	print()
	print("1) Display stock information table")
	print("2) Display top gainers table")
	print("3) Display top losers table")
	print("4) Display user credentials table")
	print("5) Display user transaction table")
	print("6) Insert into user credentials")
	print("7) Insert into user transaction")
	print("8) Delete from user transaction")
	print()
	x=int(input("Choice"))
	if(x==1):
		printstockinfo()
	elif(x==2):
		printtopgainers()
	elif(x==3):
		printtoplosers()
	elif(x==4):
		printusercredentials()
	elif(x==5):
		printusertransaction()
	elif(x==6):
		print("Enter details")
		t,u,v,x,y,z=input().split()
		insert_user_credentials(t,u,v,x,y,z)
	elif(x==7):
		print("Enter details")
		a,b,c,d,e,f,g=input().split()
		insert_user_transaction(a,b,c,d,e,f,g)
	elif(x==8):
		x=input("user_id")
		delete_user_transaction(x)

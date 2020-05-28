from flask import Flask, render_template,request

import mysql.connector
#from flask_mysqldb import MySQL
from flask import jsonify
from flask_cors import CORS,cross_origin
import requests
import json
app = Flask(__name__)
cors=CORS(app)

@app.route('/wt2/reservations/list',methods=['GET','OPTIONS'])
@cross_origin()
def lis():
	
		mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
		cur=mydb.cursor()
		cur.execute("select fname,guest_id,room_no,checkout_date,ph_no,checkin_date from customer,reservation,room where guest_id=gst_id and gst_id=customer_id and hall_number is NULL")
		rv = cur.fetchall()
		payload = []
		content = {}
		for result in rv:
			content = {'FNAME': result[0], 'GUEST_ID': result[1], 'ROOM_NO': result[2], 'CHECKOUT_DATE':result[3], 'PH_NO':result[4], 'CHECKIN_DATE':result[5]}
			payload.append(content)
			content = {}
		return jsonify(payload),200

@app.route('/wt2/employees/view',methods=['GET','OPTIONS'])
@cross_origin()
def view_emps():
	mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
	cur=mydb.cursor()
	cur.execute("SELECT * FROM `employee` WHERE 1")
	rv = cur.fetchall()
	payload = []
	content = {}
	for result in rv:
		content = {'SALARY': result[0], 'FNAME': result[1], 'MINIT': result[2], 'LNAME':result[3], 'JOIN_DATE':result[4], 'DOB':result[5], 'EMP_ID':result[6], 'PHONE':result[7], 'GENDER':result[8]}
		payload.append(content)
		content = {}
	return jsonify(payload),200

@app.route('/wt2/price/view',methods=['GET','OPTIONS'])
@cross_origin()
def view_price():
	mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
	cur=mydb.cursor()
	cur.execute("SELECT * FROM `price_list` WHERE 1")
	rv = cur.fetchall()
	payload = []
	content = {}
	for result in rv:
		content = {'CATEGORY': result[0], 'PRICE_PER_DAY': result[1]}
		payload.append(content)
		content = {}
	return jsonify(payload),200

@app.route('/wt2/employees/add_emp',methods=['POST','OPTIONS'])
@cross_origin()
def view_emp():
	if(request.method=='POST'):
		data=request.get_json()
		# from pdb import set_trace; set_trace()
		t=(int(data['salary']),data['fname'],data['mname'],data['lname'],data['join_date'],data['dob'],int(data['phno']),data['gender'])
		print(t)
		try:
			mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
			cur=mydb.cursor()
			cur.execute('INSERT INTO `employee`(`SALARY`, `FNAME`, `MINIT`, `LNAME`, `JOIN_DATE`, `DOB`, `PHONE`, `gender`) VALUES' + str(t))
		except Exception as e:
			cur.close()
			return "FAIL",400
		mydb.commit()
		cur.close()
		return "SUCCCESS",200
	else:
		return "Fail",405

@app.route('/wt2/employees/get_emp',methods=['POST','OPTIONS'])
@cross_origin()
def get_emp():
	data=request.get_json()
	data['emp_id']
	mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
	cur=mydb.cursor()
	cur.execute("SELECT * FROM `employee` WHERE `EMP_ID`="+str(data['emp_id']))
	rv = cur.fetchall()
	payload = []
	content = {}
	for result in rv:
		content = {'SALARY': result[0], 'FNAME': result[1], 'MINIT': result[2], 'LNAME':result[3], 'JOIN_DATE':result[4], 'DOB':result[5], 'EMP_ID':result[6], 'PHONE':result[7], 'GENDER':result[8]}
		payload.append(content)
		content = {}
	return jsonify(payload),200

@app.route('/wt2/employees/del_emp',methods=['POST','OPTIONS'])
@cross_origin()
def del_emp():
	data=request.get_json()
	try:
		mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
		cur=mydb.cursor()
		cur.execute("DELETE FROM `employee` WHERE `EMP_ID`="+str(data['emp_id']))
	except(MySQL.Error,MySQL.Warning) as e:
		cur.close()
		return "FAIL",400
	mydb.commit()
	cur.close()
	return "SUCCCESS",200


@app.route('/wt2/graph')

def graph():
	mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
	cur=mydb.cursor()
	#out=[['Task','Hours per Day'],['Work',11],['Eat',2],['Commute',2],['Watch TV',2],['Sleep',7]]
	out=[['PAYMENT_METHODS','NUMBER_OF_PAYMENTS']]
	cur.execute("SELECT COUNT(GUEST_NUM), PAYMENT_METHODS FROM payment GROUP BY PAYMENT_METHODS")
	output=cur.fetchall()
	for row in output:
		ar=[]
		ar.append(row[1])
		ar.append(row[0])
		out.append(ar)
	cur.execute("SELECT COUNT(BILL_ID),SUM(AMOUNT), DATE FROM (SELECT * FROM bill ORDER BY DATE ASC ) AS sub GROUP BY sub.DATE")

	output2=cur.fetchall()
	out2=[["Date","total money"]]
	for row in output2:
		ar=[]
		ar.append(str(row[2]))
		ar.append(int(row[1]))
		#ar.append(int(row[0]))
		out2.append(ar)
	cur.execute("SELECT COUNT(EMP_ID), gender FROM employee GROUP BY gender")
	output3=cur.fetchall()
	out3=[["gender","count"]]
	for row in output3:
		ar=[]
		ar.append(row[1])
		ar.append(row[0])
		out3.append(ar)

	cur.execute("SELECT COUNT(GST_ID), CATEGORY FROM reservation GROUP BY CATEGORY")
	output4=cur.fetchall()
	out4=[["ROOM CATEGORY", "NO_OF_RESERVATONS"]]
	for row in output4:
		ar=[]
		ar.append(row[1])
		ar.append(row[0])
		out4.append(ar)


	return render_template('index.html',datum=out,dat=out2, dat3=out3,dat4=out4)


@app.route('/wt2/stats')



def stats():
	mydb = mysql.connector.connect(host="localhost",user="root",password="root",database="hotel")
	cur=mydb.cursor()
	cur.execute("select SUM(AMOUNT) as tamt,AVG(AMOUNT) as avg,COUNT(AMOUNT) as cnt from bill")
	output1=cur.fetchall()
	out1=[]
	ar=[]
	ar.append(int(output1[0][0]))
	ar.append(int(output1[0][1]))
	ar.append(int(output1[0][2]))
	out1.append(ar)
	cur.execute("select * from employee order by SALARY DESC limit 0,3")
	output2=cur.fetchall()
	out2=[]
	for row in output2:
		ar=[]
		ar.append(row[0])
		ar.append(row[1])
		ar.append(str(row[4]))
		out2.append(ar)
	
	

	
	return render_template('stat.html',dat1=out1,dat2=out2)

	
		 
	

	

if __name__ == '__main__':
    app.run(debug=True)


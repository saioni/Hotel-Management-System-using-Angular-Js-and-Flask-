import os
import unittest
import json
from app import app,cors
from flask_sqlalchemy import SQLAlchemy
import flask


TEST_DB='test.db'
db=SQLAlchemy(app)

class BasicTestCase(unittest.TestCase):
	def test_index(self):
		tester = app.test_client(self)
		response = tester.get("/", content_type="html/text")
		#self.assertEqual(response.status_Code, 200)
		
	def test_database(self):
		tester = os.path.exists("hotel.sql")
		self.assertTrue(tester)
		
class FlaskrTestCase(unittest.TestCase):
	def setUp(self):
		basedir = os.path.abspath(os.path.dirname(__file__))
		app.config["TESTING"] = True
		app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///" + os.path.join(basedir, TEST_DB)
		app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
		self.app = app.test_client()
		db.create_all()
	
	def tearDown(self):
		db.drop_all()
		db.session.commit()
	
	def addEmp(self,salary,fname,mname,lname,join_date,dob,city,phno,gender):
		return self.app.post(
			'/wt2/employees/add_emp',
			json=dict(salary=int(salary), fname=fname, mname=mname, lname=lname, join_date=join_date, dob=dob, city=city, phno=int(phno), gender=gender),
			follow_redirects = True
		)
	#1
	def test_valid_add(self):
		response = self.addEmp('98000','fghj','a','bcd', '06-06-2020', '01-01-1998', 'Bangalore', '39','Male')
		#self.assertEqual(response.status_code, 201)
	
	#2
	#def test_invalid_add(self):
	#	response = self.addEmp('salary','saioni','a','bcd', '06-06-2020', '01-01-1998', 'Bangalore', '39','Male')
	#	self.assertEqual(response.status_code, 400)
	#3
	def addEmpW(self,salary,fname,mname,lname,join_date,dob,city,phno,gender):
		return self.app.get(
			'/wt2/employees/add_emp',
			json=dict(salary=int(salary), fname=fname, mname=mname, lname=lname, join_date=join_date, dob=dob, city=city, phno=int(phno), gender=gender),
			follow_redirects = True
		)
	def test_invalid_addw(self):
		response = self.addEmpW('98000','abcd','a','bcd', '06-06-2020', '01-01-1998', 'Bangalore', '39','Male')
		#self.assertEqual(response.status_code, 405)
	#4
	def test_empList(self):
		response = self.app.get('/wt2/employees/view')
	
		#self.assertEqual(response.status_code, 200)
		
	
	#5
	def getEmp(self,emp_id):
		return self.app.post(
			'/wt2/employees/get_emp',
			json = dict(emp_id=int(emp_id)),
			follow_redirects=True
		)
	def test_valid_getEmp(self):
		response = self.getEmp('1')
		#self.assertEqual(response.status_code, 200) 	
		
	#6 
	def test_invalid_getEmp(self):
		response = self.getEmp('70')
		#self.assertEqual(response.status_code,200)	
		
	#7
	def test_priceList(self):
		response = self.app.get('/wt2/price/view')
		#self.assertEqual(response.status_code,200)
	
	#8
	def test_priceList(self):
		response = self.app.post('/wt2/price/view')
		#self.assertEqual(response.status_code,405)
	
	#9
	def delEmp(self,emp_id):
		return self.app.post(
			'/wt2/employees/del_emp',
			json = dict(emp_id=int(emp_id)),
			follow_redirects=True
		)
	def test_valid_delEmp(self):
		response = self.delEmp('4')
		#self.assertEqual(response.status_code, 200) 
	
	#10 
	def test_invalid_delEmp(self):
		response = self.delEmp('70')
		#self.assertEqual(response.status_code, 200)
		
	#11
	def test_valid_reservationList(self):
		response = self.app.get('/wt2/reservations/list')
		#self.assertEqual(response.status_code,200) 
	
	#12
	def test_invalid_reservationList(self):
		response = self.app.post('/wt2/reservations/list')
		#self.assertEqual(response.status_code,405) 
		
		

if __name__=='__main__':
	unittest.main()

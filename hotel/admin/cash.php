<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">

        <title>Current Room Service</title>
        <link rel="icon" href="web-icon/favicon.ico" type="image/icon type">

        <!-- Bootstrap core CSS -->
        <link href="https://getbootstrap.com/docs/4.4/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/4.4/dist/css/bootstrap.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>





  <style>
  .navbar-default {
  background-color: #0B235A;
  background-image: none;
  background-repeat: no-repeat;
 } 
 .center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}

 </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

  <script>
	function homepage()
	{
		window.open('roomreservation.php')
	}
	
  </script>
  <link href="dash.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
          <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Sunrise Hotels</a>
              <ul class="navbar-nav px-3">
                  <li class="nav-item text-nowrap">
                      <a class="nav-link" href="#">Sign out</a>
                  </li>
              </ul>
      </nav>
      <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.php">
                        <span data-feather="home"></span>
                        Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="roomreservation.php">
                        <span data-feather="plus-square"></span>
                        Room Reservation
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="custroom.html">
                        <span data-feather="activity"></span>
                            On-Going Room Service
                        </a>
                    </li>
                </ul>
                <hr/>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="employee_add.html">
                        <span data-feather="user-plus"></span>
                            Add Employee
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cur_employees.html">
                        <span data-feather="users"></span>
                            View Current Employees
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="employee_delete.html">
                        <span data-feather="user-minus"></span>
                            Remove Employees
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="payement.php">
                        <span data-feather="credit-card"></span>
                            Make Payment
                        </a>
                    </li>
                </ul>
                <hr/>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="stats.php">
                        <span data-feather="bar-chart-2"></span>
                            View Stats
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://127.0.0.1:5000/wt2/graph">
                        <span data-feather="bar-chart-2"></span>
                            Analytics
                        </a>
                    </li>
                </ul>
                </div>
            </nav>
        </div>
    </div>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <!--PAGE CONETENT HERE!!!!-->
<div class="container">

             
  <table class="table table-striped table-hover">
    
	<tbody>
<?php
    $money_given=$_POST['money_given'];
    $payee_name=$_POST['payee_name'];
    $custID=$_POST['custID'];
    $total_amt=$_POST['total_amt'];
    $invoice_number=$_POST['inv'];
    
    
    
    $conn = mysqli_connect("localhost","root","root","hotel") or die(mysql_error());
    if(!$conn){
        echo "Error:Connection failed";
    }
    $change=$money_given-$total_amt;
    $sql="SELECT * FROM customer WHERE GUEST_ID=$custID";
    $query_result=mysqli_query($conn,$sql);
	echo mysqli_error($conn); 
    $row = $query_result->fetch_assoc();
    $ph_nooo=$row['PH_NO'];
	echo "hi".$ph_nooo;
    #echo $ph_nooo;
    $date=date("Y-m-d");
    #echo "CUST: ".$custID;
    $sql="INSERT INTO `bill`(`AMOUNT`, `NAME`, `DATE`, `PH_NO`, `CUSTOMER_ID`) VALUES ($total_amt,'$payee_name','$date',".$ph_nooo.",$custID)";
    $query_result=mysqli_query($conn,$sql);
    echo mysqli_error($conn);	
    if($query_result)
    {
        $sql=" UPDATE `invoice` `STATUS`='PAYEMENT SUCCESFUL' WHERE `INVOICE_NUMBER`=$invoice_number;";
        $query_result=mysqli_query($conn,$sql);
        $sql="SELECT `FNAME`, `MINIT`, `LNAME` FROM `customer` WHERE `GUEST_ID`=$custID;";
        $query_result=mysqli_query($conn,$sql);
        $row = $query_result->fetch_assoc();
        $FNAME=$row['FNAME'];
        $MINIT=$row['MINIT'];
        $LNAME=$row['LNAME'];
        $name=$FNAME." ".$MINIT." ".$LNAME;
        $sql="SELECT  `CHECKIN_DATE`, `CHECKOUT_DATE`, `PERIOD_STAY`,`CATEGORY` FROM `reservation` WHERE GST_ID=$custID";
        $query_result=mysqli_query($conn,$sql);
        $row = $query_result->fetch_assoc();
        $checkindate=$row['CHECKIN_DATE'];
        $checkoutdate=$row['CHECKOUT_DATE'];
        $periodstay=$row['PERIOD_STAY'];
        $category=$row['CATEGORY'];
        $sql="SELECT BILL_ID FROM bill WHERE CUSTOMER_ID=$custID";
        $query_result=mysqli_query($conn,$sql);
        $row = $query_result->fetch_assoc();
        $bill_id=$row['BILL_ID'];
		$sqlq="UPDATE `room` SET `CUSTOMER_ID`=NULL WHERE room.CUSTOMER_ID=$custID";
		$query_rresult=mysqli_query($conn,$sqlq);
		$sql="DELETE FROM reservation where GST_ID=$custID";
		$query_result=mysqli_query($conn,$sql);
        echo "<tr><td>Guest Name: </td><td><b>".$name."</b></td></tr><tr><td>Phone Number: </td><td>".$ph_nooo."</td></tr><tr><td>Customer ID: </td><td>".$custID."</td></tr><tr><td>Bill Number: </td><td>".$bill_id."</td></tr><tr></tr><tr><td>Category: </td><td>".$category."</td></tr><tr><td>Duration Of Stay: </td><td>".$periodstay."</td></tr><tr><td>Bill Amount: </td><td>$". $total_amt."</td></tr><tr><td>Change Returned: </td><td>$". $change."</td></tr>";
    }
    else
    {
        echo "Payement Failed";
    }
	
?>

    </tbody>
  </table>
 <button onclick=homepage() class="btn btn-dark">Home Page</button>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="https://getbootstrap.com/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="https://getbootstrap.com//docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        <script src="dashboard.js"></script>

</body>
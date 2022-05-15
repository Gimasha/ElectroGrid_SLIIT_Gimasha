<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Bill</title>
    <link href="views/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="components/bootstrap.min.js"></script>
    <script src="components/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="styles/payment.css">
    <script src="components/bill.js"></script>
</head>
<body>
<div class="form-body">
    <div class="row">
        <div class="col">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>Bill Update</h3>
                        <p>Fill in the data below.</p>
                        <form class="requires-validation" novalidate id="formBill" name="formBill" method="post" action="bill.jsp">

                            <div class="col-md-12">
                                <input id="billId" class="form-control" type="text" name="billId" placeholder="Bill ID" required>
                                <div class="valid-feedback">Bill ID field is valid!</div>
                                <div class="invalid-feedback">Bill ID field cannot be blank!</div>
                            </div>

                            <div class="col-md-12">
                                <input id="date" class="form-control" type="date" name="date" placeholder="Date" required>
                                <div class="valid-feedback">Date field is valid!</div>
                                <div class="invalid-feedback">Date field cannot be blank!</div>
                            </div>

                            <div class="col-md-12">
                                <input id="previousBalance" class="form-control" type="text" name="previousBalance" placeholder="Previous Balance" required>
                                <div class="valid-feedback">previous Balance field is valid!</div>
                                <div class="invalid-feedback">previous Balance field cannot be blank!</div>
                            </div>


                            <div class="col-md-12">
                                <input id="chargeForPeriod" class="form-control" type="text" name="chargeForPeriod" placeholder="Charge For Period" required>
                                <div class="valid-feedback">chargeForPeriod field is valid!</div>
                                <div class="invalid-feedback">chargeForPeriod cannot be blank!</div>
                            </div>

                            <div class="col-md-12">
                                <input id="currentBalance" class="form-control" type="text" name="currentBalance" placeholder="Current Balance" required>
                                <div class="valid-feedback">Current Balance field is valid!</div>
                                <div class="invalid-feedback">Current Balance cannot be blank!</div>
                            </div>

                            <div class="col-md-12">
                                <input id="units" class="form-control" type="text" name="units" placeholder="Units" required>
                                <div class="valid-feedback">Current Balance field is valid!</div>
                                <div class="invalid-feedback">Current Balance cannot be blank!</div>
                            </div>

                            <div class="form-button mt-3">
                                <button id="btnUpdate" name="btnUpdate" type="button" class="btn btn-primary">Update Bill</button>
                            </div>
                        </form>
                        <div id="alertSuccess" class="alert alert-success"> </div>

                        <div id="alertError" class="alert alert-danger"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
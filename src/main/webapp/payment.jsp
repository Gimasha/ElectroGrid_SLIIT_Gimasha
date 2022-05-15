<%@page import="com.electrogrid.services.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Payment</title>
    <link href="views/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="components/bootstrap.min.js"></script>
    <script src="components/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="styles/payment.css">
    <script src="components/payment.js"></script>
</head>
<body>
<div class="form-body">
    <div class="row">
    <div class="col">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h3>Bill Payment</h3>
                    <p>Fill in the data below.</p>
                    <form class="requires-validation" novalidate id="formPayment" name="formPayment" method="post" action="payment.jsp">

                        <div class="col-md-12">
                            <input id="billId" class="form-control" type="text" name="billId" placeholder="Bill ID" required>
                            <div class="valid-feedback">Bill ID field is valid!</div>
                            <div class="invalid-feedback">Bill ID field cannot be blank!</div>
                        </div>

                        <div class="col-md-12">
                            <input id="method" class="form-control" type="email" name="method" placeholder="Method" required>
                            <div class="valid-feedback">Method field is valid!</div>
                            <div class="invalid-feedback">Method field cannot be blank!</div>
                        </div>

                        <div class="col-md-12">
                            <input id="refId" class="form-control" type="email" name="refId" placeholder="Reference ID" required>
                            <div class="valid-feedback">Reference ID field is valid!</div>
                            <div class="invalid-feedback">Reference ID field cannot be blank!</div>
                        </div>


                        <div class="col-md-12">
                            <input id="amount" class="form-control" type="text" name="amount" placeholder="Amount" required>
                            <div class="valid-feedback">Amount field is valid!</div>
                            <div class="invalid-feedback">Amount field cannot be blank!</div>
                        </div>


                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                            <label class="form-check-label">I confirm that all data are correct</label>
                            <div class="invalid-feedback">Please confirm that the entered data are all correct!</div>
                        </div>


                        <div class="form-button mt-3">
                            <button id="btnPay" name="btnPay" type="button" class="btn btn-primary">Pay</button>
                        </div>
                    </form>
                    <div id="alertSuccess" class="alert alert-success"> </div>

                    <div id="alertError" class="alert alert-danger"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col" style="align-self: center">
        <div id="divPaymentGrid">
            <%
                PaymentService paymentService = new PaymentService();
                out.print(paymentService.findAllPayments());
            %>
        </div>
    </div>
    </div>
</div>

</body>
</html>

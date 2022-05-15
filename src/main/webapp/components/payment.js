
$(document).ready(function () {
    $("#alertSuccess").hide();
    $("#alertError").hide();
});


// Create payment
$(document).on("click", "#btnPay", function (event) {
    // Clear alerts---------------------
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();


    $.ajax(
        {
            url: "payment",
            type: "POST",
            data: $("#formPayment").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onPaymentResult(response, status)
            }
        });
});

//Delete payment
$(document).on("click", ".btnDelete", function(event)
{
    $.ajax(
        {
            url : "payment",
            type : "DELETE",
            data : "payId=" + $(this).data("payid"),
            dataType : "text",
            complete : function(response, status)
            {
                onPaymentResult(response, status);
            }
        });
});


function onPaymentResult(response, status) {
    console.log(response);
    if (status === "success") {
        const resultSet = JSON.parse(response.responseText);

        if (resultSet.status.trim() === "success") {
            $("#alertSuccess").text(resultSet.data);
            $("#alertSuccess").show();
            $("#divPaymentGrid").html(resultSet.data);
        } else if (resultSet.status.trim() === "error") {
            $("#alertError").text(resultSet.data);
            $("#alertError").show();
        }

    } else if (status === "error") {
        $("#alertError").text("Error while saving.");
        $("#alertError").show();
    } else {
        $("#alertError").text("Unknown error while saving..");
        $("#alertError").show();
    }

}
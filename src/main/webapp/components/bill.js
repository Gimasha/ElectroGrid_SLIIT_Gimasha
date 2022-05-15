$(document).ready(function () {
    $("#alertSuccess").hide();
    $("#alertError").hide();
});

$(document).on("click", "#btnUpdate", function (event) {
    // Clear alerts---------------------
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();


    $.ajax(
        {
            url: "bill",
            type: "PUT",
            data: $("#formBill").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onBillResult(response, status)
            }
        });
});

function onBillResult(response, status) {
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
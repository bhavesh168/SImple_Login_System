function alertMsg(msgtype, Msg) {
    var dvClass = "";

    switch (msgtype) {
        case "success":
            dvClass = "alert-success";
            break;
        case "error":
            dvClass = "alert-warning";
            break;
    }

    $(".dvAlert").removeClass("d-none");
    $(".dvAlert").addClass(dvClass);
    $("#SpMSG").html(Msg);
    setTimeout(mAlertClose, 3000);
}

function mAlertClose() {
    $('.dvAlert').addClass("d-none");
}
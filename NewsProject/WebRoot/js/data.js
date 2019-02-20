
function d_a_0() {
    $("#my-modal-loading").click();
    window.location.href="/web/superadmin/synchronizewechat";
}
function d_b_0(num) {
    $("#my-modal-loading").click();
    if(num ==0){
        window.location.href="/web/superadmin/user_data.csv";
    }
    if(num ==1){
        window.location.href="/web/superadmin/questions_data.csv";
    }
    if(num ==2){
        window.location.href="/web/superadmin/worktype_data.csv";
    }

}
function d_b_1(num) {
    if(num ==0){
       $("#fileupload0").click();
    }
    if(num ==1){
        $("#fileupload1").click();
    }
    if(num ==2){
        $("#fileupload2").click();
    }
}
function d_c_0(num) {
    $("#my-modal-loading").click();
    if(num ==0){
        window.location.href="/web/superadmin/user_day_data.csv";
    }
    if(num ==1){
        window.location.href="/web/superadmin/user_month_data.csv";
    }
}
function d_c_1(num) {
    $("#my-modal-loading").click();
    if(num ==0){
        window.location.href="/web/superadmin/workshop_day_data.csv";
    }
    if(num ==1){
        window.location.href="/web/superadmin/workshop_month_data.csv";
    }
}


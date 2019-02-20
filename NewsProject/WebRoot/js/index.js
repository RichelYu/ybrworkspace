


function week_sort(day) {
    n = 0;
    for (i = day; i <= 6; i++) {
        for (j = i; j > n; j--) {
            var mid = option.xAxis[0].data[j];
            option.xAxis[0].data[j] = option.xAxis[0].data[j - 1];
            option.xAxis[0].data[j - 1] = mid;
        }
        n++;
    }
}

function daily_sort(a, b) {
    return b.data[6] - a.data[6];
}

function time() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month < 10) {
        month = "0" + month
    }
    var day = date.getDate();
    if (day < 10) {
        day = "0" + day
    }
    var hour = date.getHours();
    if (hour < 10) {
        hour = "0" + hour
    }
    var minute = date.getMinutes();
    if (minute < 10) {
        minute = "0" + minute
    }
    var second = date.getSeconds();
    if (second < 10) {
        second = "0" + second
    }
    $("#timearea").text(year + "年" + month + "月" + day + "日    " + hour + ":" + minute + ":" + second);
    t = window.setTimeout(function () {
        time()
    }, 1000);
}


function setting() {
    $("#oldpwd").val("");
    $("#oldpwd").parent().removeClass("am-form-error");
    $("#oldpwd").parent().removeClass("am-form-success");
    $("#newpwd").val("");
    $("#newpwd").parent().removeClass("am-form-error");
    $("#newpwd").parent().removeClass("am-form-success");
    $("#newpwd2").val("");
    $("#newpwd2").parent().removeClass("am-form-error");
    $("#newpwd2").parent().removeClass("am-form-success");
    $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function (e) {
            if (setting_reg(4)) {
                //修改密码递交请求
                $.ajax({
                    type: "post",
                    url: "/web/moditypassword",
                    data: {
                        "oldpwd": $('#oldpwd').val(),
                        "newpwd": $('#newpwd').val()
                    },
                    async: true,
                    cache: true,
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        if (data.responseText == "{'info':'success'}")
                            alert("修改密码成功");
                        else if (data.responseText == "{'info':'error'}")
                            alert("修改密码失败，您输入的旧密码错误！");
                    },
                    error: function (data) {
                        console.log(data);
                        if (data.responseText == "{'info':'success'}")
                            alert("修改密码成功");
                        else if (data.responseText == "{'info':'error'}")
                            alert("修改密码失败，您输入的旧密码错误！");
                    }
                })
            }
        },
        onCancel: function (e) {

        }
    });
}

function setting_reg(num) {
    if (num == 0) {
        if ($("#oldpwd").val() == "") {
            $("#oldpwd").parent().removeClass("am-form-success");
            $("#oldpwd").parent().addClass("am-form-error");

        } else {
            $("#oldpwd").parent().removeClass("am-form-error");
            $("#oldpwd").parent().addClass("am-form-success");

        }
    } else if (num == 1) {
        if ($("#newpwd").val() == "") {
            $("#newpwd").parent().removeClass("am-form-success");
            $("#newpwd").parent().addClass("am-form-error");

        } else {
            $("#newpwd").parent().removeClass("am-form-error");
            $("#newpwd").parent().addClass("am-form-success");

        }
    } else if (num == 2) {
        if ($("#newpwd2").val() == "" || $("#newpwd").val() != $("#newpwd2").val()) {
            $("#newpwd2").parent().removeClass("am-form-success");
            $("#newpwd2").parent().addClass("am-form-error");

        } else if ($("#newpwd").val() == $("#newpwd2").val()) {
            $("#newpwd2").parent().removeClass("am-form-error");
            $("#newpwd2").parent().addClass("am-form-success");

        }
    } else if (num == 4) {
        if ($("#oldpwd").val() == "") {
            alert("修改密码失败：您尚未输入旧密码。");
            return false;
        }
        if ($("#newpwd").val() == "") {
            alert("修改密码失败：您尚未输入新密码。");
            return false;
        }
        if ($("#newpwd").val() != $("#newpwd2").val()) {
            alert("修改密码失败：您输入两次输入的新密码不一致。");
            return false;
        }
        return true;
    }
}


function send_message() {
    $("#sendmessagearea").val("");

    $('#my-prompt2').modal({
        relatedTarget: this,
        onConfirm: function (e) {
            if($("#sendmessagearea").val() ==""){
                alert("您发送的通知内容为空！");
                return;
            }
            var dpsend = [];
            var wssend = [];
            dpsend.push(-1);
            wssend.push(-1);
            $("input[name='dp']").each(function () {
                if($(this).is(':checked'))
                    dpsend.push(parseInt($(this).attr("l")));
            });
            $("input[name='ws']").each(function () {
                if($(this).is(':checked'))
                    wssend.push(parseInt($(this).attr("l")));
            });
            $.ajax({
                url:'/web/sendmsg?dp='+dpsend+"&ws="+wssend+"&msg="+encodeURI($("#sendmessagearea").val()),
                type:'get',
                data:{},
                contentType:'application/json;charset=UTF-8',
                success:function (data) {
                    console.log(data);
                    var j = JSON.parse(data);
                    if(j.errmsg=="ok"){
                        alert("发送消息成功！");
                    }
                },
                error:function (data) {
                    console.log(data);
                }
            })
        },
        onCancel: function (e) {

        }
    });
}

function setBestMember() {
    $("#ppid").val("");
    $("#pid").val("");
    $("#msg").val("");
    $('#my-prompt3').modal({
        relatedTarget: this,
        onConfirm: function (e) {
            if ($("#pid").val() == "") {
                return;
            } else {
                $("#d_b_name").text(d_b_bestmember.name);
                $("#d_b_avatar").attr("src", d_b_bestmember.avatarUrl);
                $("#d_b_msg").text(e.data[1]);

                $.ajax({
                    type:'post',
                    // url: '/web/monthbest?userid='+d_b_bestmember.id+"&msg="+e.data[0],
                    url: '/web/monthbest',
                    data:{
                        userid:d_b_bestmember.id,
                        msg:e.data[1]
                    },
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (data) {
                        console.log(data);
                    }
                })
            }
        },
        onCancel: function (e) {

        }
    });
}
var d_b_bestmember ;
function select() {
    var ppid = $("#ppid").val();
    $.ajax(
        {
            type: "get",
            url: "/web/superadmin/selectPerson?ppid=" + ppid,
            success: function (data) {
                console.log(data);
                if (data == "null" || data == "") {
                    alert("查无此人 或 输入格式错误");
                } else {
                    user = JSON.parse(data);
                    $("#pid").val(user.name);
                    d_b_bestmember = user;
                }
            },
            error: function (data) {
                console.log(data);
                alert("查无此人");
            }
        }
    )
}



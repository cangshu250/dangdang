<%@page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>用户注册 - 当当网</title>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/page_bottom.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        var isEmailFlag = false;
        var isNiceNameFlag = false;
        var isPasswordFlag = false;
        var isRepeatPassFlag = false;
        var isVcodeFlag=false;
        $(function () {
            //点击更换验证码
            $(".yzm_img").click(function () {
                $("#imgVcode").prop("src", "${pageContext.request.contextPath}/user/printVcode?date=" + new Date());
            });
            //邮箱验证
            $("#txtEmail").live("blur", function () {
                var email = $(this).val().trim();
                var info = $("#email_info");
                if (email == '') {
                    console.log("jinlaile");

                    info.html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;电子邮件不能是空的");
                    isEmailFlag = false;
                } else {
                    console.log("走的这里？");
                    var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.]){1,2}[A-Za-z\d]{2,5}$/g;
                    var bool = reg.test(email);
                    if (bool) {
                        console.log("那一定也走了这里");
                        $.ajax({
                            type: "GET",
                            url: "${pageContext.request.contextPath}/user/user_isEmailExist?email=" + email,
                            success: function (result) {
                                if (result == "exist") {
                                    isEmailFlag = false;
                                    info.html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;电子邮件已存在");
                                    console.log("还走了这里");
                                } else {

                                    isEmailFlag = true;
                                    info.html("<img src='${pageContext.request.contextPath}/images/right.gif'/>&nbsp;邮箱成功");
                                }
                            }

                        });
                    } else {
                        $("#email_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;邮箱格式不正确");
                        isEmailFlag = false;
                    }
                }
            })
            //昵称验证
            $("#txtNickName").blur(function () {
                var niceName = $("#txtNickName").val();
                var namePattrn = /^[A-Za-z0-9]{4,16}|[\u4e00-\u9fa5]{2,8}/
                if (!namePattrn.test(niceName)) {
                    $("#name_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;用户名搞得有问题");
                    isNiceNameFlag = false;
                } else {
                    $("#name_info").html("<img src='${pageContext.request.contextPath}/images/right.gif'/>&nbsp;&nbsp;用户名么得问题");
                    isNiceNameFlag = true;
                }
            })
            //密码验证
            $("#txtPassword").blur(function () {
                var password = $("#txtPassword").val().trim();
                var passwordPattern = /^[A-Za-z0-9]{6,20}/
                if (password == "") {
                    $("#password_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;密码不能为空");
                    isPasswordFlag = false;
                } else {
                    if (!passwordPattern.test(password)) {
                        $("#password_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;密码格式错误");
                        isPasswordFlag = false;
                    } else {
                        $("#password_info").html("<img src='${pageContext.request.contextPath}/images/right.gif'/>&nbsp;&nbsp;密码么得问题");
                        isPasswordFlag = true;
                    }

                }
            })
            //重新输入密码验证
            $("#txtRepeatPass").blur(function () {
                var rePass = $("#txtRepeatPass").val().trim();
                var pass=$("#txtPassword").val().trim();
                if(rePass==""){
                    $("#password1_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;密码不能为空");
                    isRepeatPassFlag = false;
                }else{
                    if(!rePass==pass){
                        $("#password1_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;搞个锤子？两次输入的密码不一致");
                        isRepeatPassFlag = false;
                    }else{
                        $("#password1_info").html("<img src='${pageContext.request.contextPath}/images/right.gif'/>&nbsp;&nbsp;么得问题");
                        isRepeatPassFlag = true;
                    }
                }
            })
            //验证码确定
            $("#txtVerifyCode").blur(function () {
                var pageCode = $("#txtVerifyCode").val().trim();
                if(pageCode==""){
                    $("#vcode_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;验证码不能为空");
                    isVcodeFlag = false;
                }else{
                    $.ajax({
                        type:"GET",
                        url:"${pageContext.request.contextPath}/user/user_isVcodeExists?pageCode="+pageCode,
                        success:function (result) {
                            if(result=="exists"){
                                $("#vcode_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;验证成功");
                                isVcodeFlag = true;
                            }else{
                                $("#vcode_info").html("<img src='${pageContext.request.contextPath}/images/wrong.gif'/>&nbsp;&nbsp;验证失败，重新输入");
                                isVcodeFlag = false;
                            }
                        }
                    })
                }

            })
            //验证数据，开启注册
            $("#btnClientRegister").click(function () {
                if(isEmailFlag==true && isNiceNameFlag==true && isPasswordFlag==true && isRepeatPassFlag==true && isVcodeFlag==true){
                    $("#f").submit();
                }else{
                    alert("请核实信息！！！");
                    return false;
                }
            })
        })
    </script>
</head>
<body>
<%@include file="../common/head1.jsp" %>
<div class="login_step">
    注册步骤:
    <span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
</div>
<div class="fill_message">
    <form name="ctl00" method="post" action="${pageContext.request.contextPath}/user/regist" id="f">
        <h2>
            以下均为必填项
        </h2>
        <table class="tab_login">
            <tr>
                <td valign="top" class="w1">
                    请填写您的Email地址：
                </td>
                <td>
                    <input name="email" type="text" id="txtEmail" class="text_input"/>
                    <div class="text_left" id="emailValidMsg">
                        <p>
                            请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。
                        </p>
                        <span id="email_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    设置您在当当网的昵称：
                </td>
                <td>
                    <input name="nickname" type="text" id="txtNickName" class="text_input"/>${sessionScope.user.nickname}
                    <div class="text_left" id="nickNameValidMsg">
                        <p>
                            您的昵称可以由小写英文字母、中文、数字组成，
                        </p>
                        <p>
                            长度4－20个字符，一个汉字为两个字符。
                        </p>
                        <span id="name_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    设置密码：
                </td>
                <td>
                    <input name="password" type="password" id="txtPassword"
                           class="text_input"/>
                    <div class="text_left" id="passwordValidMsg">
                        <p>
                            您的密码可以由大小写英文字母、数字组成，长度6－20位。
                        </p>
                        <span id="password_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    再次输入您设置的密码：
                </td>
                <td>
                    <input name="password1" type="password" id="txtRepeatPass"
                           class="text_input"/>
                    <div class="text_left" id="repeatPassValidMsg">
                        <span id="password1_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    验证码：
                </td>
                <td>
                    <img class="yzm_img" id='imgVcode' src="${pageContext.request.contextPath}/user/printVcode"/>
                    <input name="code" type="text" id="txtVerifyCode" class="yzm_input"/>
                    <div class="text_left t1">
                        <p class="t1">
                            <span id="vcodeValidMsg">请输入图片中的四个字母。</span>
                            <span id="vcode_info" style="color:red"></span>
                            <a href="javascript:void(0)" class="yzm_img">看不清楚？换个图片</a>
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <div class="login_in">

            <input id="btnClientRegister" class="button_1" name="regist" type="button" value="注 册"/>
        </div>
    </form>
</div>
<%@include file="../common/foot1.jsp" %>
</body>
</html>


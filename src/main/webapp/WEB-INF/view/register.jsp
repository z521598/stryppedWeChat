<%@ page language="java"  pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>公众号注册页面</title>
    <script src="/resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        //封装正确/错误效验
        function right() {
            return "<img src = '/resources/img/sign-check-icon.png' alt = 'right' height = '15' width = '15'/>";
        }
        function wrong() {
            return "<img src = '/resources/img/sign-error-icon.png' alt = 'wrong' height = '15' width = '15'/>";
        }
        /*
         *@封装test方法
         *require代表效验标准，lab代表label标签的id
         */
        function test(require, lab) {
            if (require) {
                $(lab).html(right());
                return true;
            } else {
                $(lab).html(wrong());
                return false;
            }
        }
        function testFont(require, lab, font) {
            if (require) {
                $(lab).html(right());
                return true;
            } else {
                $(lab).html(wrong() + font);
                return false;
            }
        }
        function testUsername() {
            //注意加return
            return test($("#username").val().trim().length >= 5, "#ilab");
        }
        function testPassword() {
            return test($("#password").val().trim().length >= 6, "#plab");
        }
        function testRepeatPassword() {
            return test($("#repeatpassword").val() == $("#password").val() && $("#password").val().trim().length >= 6, "#rlab");
        }
        function testName() {
            return test($("#name").val().trim() != "", "#nlab");
        }
        function testProfession() {
            return test($("#profession").val().trim() != "", "#prlab");
        }

        function testEmail() {
            return test($("#email").val().trim().match("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$"), "#elab");
        }
        function testSex() {
            return test($(":radio:checked").size() == 1, "#slab");
        }
        function testBirthday() {
            return test($("#birthday").val().match("(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)"), "#blab");
        }
        function AJAXTestUsername() {
            $.get("/user/query.json?username=" + $("#username").val(), function (data) {
                        return testFont($("#username").val().trim().length >= 5, "#ilab", "不得少于5位") && testFont(data.success, "#ilab", "用户名重复");
                    }
            );
        }
        function testAll() {
            if (testUsername() && testPassword() && testRepeatPassword() && testName() && testEmail() && testSex() && testBirthday()) {
                return true;
            } else {
                return false;
            }
        }

    </script>
</head>

<body>
<form action="/user" onsubmit="return testAll();" method="post">
    <center>
        <table border="1" cellspacing="0">
            <tr>
                <td>用户名：</td>
                <td><input type="text" name="username" id="username" onblur="AJAXTestUsername()"
                           placeholder="不得少于5位"><label
                        id="ilab"></label></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password" id="password" onblur="testPassword()"
                           placeholder="不得少于6位"><label
                        id="plab"></label>
                </td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><input type="password" name="repeatpassword" id="repeatpassword"
                           onblur="testRepeatPassword()" placeholder="2次密码必须一致"><label
                        id="rlab"></label></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="name" id="name" onblur="testName()"><label id="nlab"
                                                                                        placeholder="不得为空"></label></td>
            </tr>
            <tr>
                <td>职业：</td>
                <td><input type="text" name="profession" id="profession" onblur="testProfession()"
                           placeholder="不得为空"><label id="prlab"></label></td>
            </tr>

            <tr>
                <td>性别：</td>
                <td>
                    <input type="radio" name="sex" value="男" onblur="testSex()"/>男
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="sex" value="女" onblur="testSex()"/>女
                    <label id="slab"></label>
                </td>
            </tr>
            <tr>
                <td>电子邮箱：</td>
                <td><input type="text" id="email" name="email" onblur="testEmail()" placeholder="不得为空"/><label
                        id="elab"></label></td>
            </tr>
            <tr>
                <td>公众号名称：</td>
                <td><input type="text" id="publicname" name="publicname"  placeholder="不得为空"/><label
                        id="pnlab"></label></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" id="submit" value="注册"></td>
            </tr>
        </table>
    </center>
</form>
</body>
</html>
<html>
<head>
    <title><g:message code='springSecurity.login.title'/></title>

    <title>Login V2</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--===============================================================================================-->
    <!--===============================================================================================-->
    <asset:stylesheet  href="vendor/bootstrap/css/bootstrap.min.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="fonts/iconic/css/material-design-iconic-font.min.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="vendor/animate/animate.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="vendor/css-hamburgers/hamburgers.min.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="vendor/animsition/css/animsition.min.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="vendor/select2/select2.min.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet  href="vendor/daterangepicker/daterangepicker.css"/>
    <!--===============================================================================================-->
    <asset:stylesheet rel="stylesheet" type="text/css" href="css/util.css"/>
    <asset:stylesheet rel="stylesheet" type="text/css" href="css/main.css"/>

</head>

<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
                <span class="login100-form-title p-b-26">
                    Connectez vous
                </span>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <span class="login100-form-title p-b-48">
                    <i class="zmdi zmdi-font"></i>
                </span>

                <div class="wrap-input100 validate-input" data-validate="Valid email is: a@b.c">
                    <input class="input100" type="text" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none">
                    <span class="focus-input100" data-placeholder="Email"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <span class="btn-show-pass">
                        <i class="zmdi zmdi-eye"></i>
                    </span>
                    <input class="input100" type="password" name="${passwordParameter ?: 'password'}" id="password"/>
                    <span class="focus-input100" data-placeholder="Password"></span>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            Connexion
                        </button>
                    </div>
                </div>

                <div class="text-center p-t-115">

                </div>
            </form>
        </div>
    </div>
</div>

<asset:javascript src="vendor/jquery/jquery-3.2.1.min.js"/>
<!--===============================================================================================-->
<asset:javascript src="vendor/animsition/js/animsition.min.js"/>
<!--===============================================================================================-->
<asset:javascript src="vendor/bootstrap/js/popper.js"/>
<asset:javascript src="vendor/bootstrap/js/bootstrap.min.js"/>
<!--===============================================================================================-->
<asset:javascript src="vendor/select2/select2.min.js"/>
<!--===============================================================================================-->
<asset:javascript src="vendor/daterangepicker/moment.min.js"/>
<asset:javascript src="vendor/daterangepicker/daterangepicker.js"/>
<!--===============================================================================================-->
<asset:javascript src="vendor/countdowntime/countdowntime.js"/>
<!--===============================================================================================-->
<asset:javascript src="js/main.js"/>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function (event) {
        document.forms['loginForm'].elements['username'].focus();
    });

    function passwordDisplayToggle() {
        var toggleEl = document.getElementById("passwordToggler");
        var eyeIcon = '\u{1F441}';
        var xIcon = '\u{2715}';
        var passEl = document.getElementById("password");
        if (passEl.type === "password") {
            toggleEl.innerHTML = xIcon;
            passEl.type = "text";
        } else {
            toggleEl.innerHTML = eyeIcon;
            passEl.type = "password";
        }
    }
</script>

</body>
</html>
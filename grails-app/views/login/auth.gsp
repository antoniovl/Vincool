<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mainly CSS -->
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="animate.css"/>
    <asset:stylesheet src="style.min.css"/>
    <asset:stylesheet src="plugins/social-buttons/social-buttons.css"/>
    <asset:stylesheet src="css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <asset:stylesheet src="css/plugins/bootstrapSocial/bootstrap-social.css" rel="stylesheet"/>


    <!-- Mainly scripts -->
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="plugins/metisMenu/jquery.metisMenu.js"/>
    <asset:javascript src="plugins/slimscroll/jquery.slimscroll.min.js"/>

</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <asset:image src="nearsoft.png" alt="laptop"/>
        </div>

        <h3><g:message code='springSecurity.login.header'/></h3>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>


        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="m-t" autocomplete="off"
              role="form">
            <div class="form-group">
                <input name="${usernameParameter ?: 'username'}" id="username" type="text" class="form-control"
                       placeholder="<g:message code='springSecurity.login.username.label'/>:" required="">
            </div>

            <div class="form-group">
                <input name="${passwordParameter ?: 'password'}" id="password" type="password" class="form-control"
                       placeholder="<g:message code='springSecurity.login.password.label'/>" required="">
            </div>

            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me"
                       <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </p>
            <input class="btn btn-primary block full-width m-b" type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    (function () {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>

</html>

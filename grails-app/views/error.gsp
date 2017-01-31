<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>500 Error</title>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="animate.css"/>
    <asset:stylesheet src="style.min.css"/>
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>

</head>

<body class="gray-bg">

<div class="middle-box text-center animated fadeInDown">
    <h1>500</h1>

    <h3 class="font-bold">Internal Server Error</h3>


    <div class="error-desc">
        The server encountered something unexpected that didn't allow it to complete the request. We apologize.<br/>
        You can go back to main page: <br/><a href="/" class="btn btn-primary m-t">Home</a>
    </div>
</div>
<g:if env="development">
    <g:if test="${Throwable.isInstance(exception)}">
        <g:renderException exception="${exception}"/>
    </g:if>
    <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
        <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}"/>
    </g:elseif>
    <g:else>
        <ul class="errors">
            <li>An error has occurred</li>
            <li>Exception: ${exception}</li>
            <li>Message: ${message}</li>
            <li>Path: ${path}</li>
        </ul>
    </g:else>
</g:if>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>

</html>

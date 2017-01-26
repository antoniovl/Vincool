<!DOCTYPE html>
<html>

    <head>

        <!-- Mainly CSS -->
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
        <asset:stylesheet src="animate.css"/>
        <asset:stylesheet src="style.min.css"/>

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
                    <h1 class="logo-name">NS</h1>
                </div>
                <h3>Welcome to Nearsoft Apprentice</h3>
                <p>Learn the basics of software development from some of the best engineers of Nearsoft.</p>
                <p>Singin to start learning.</p>
                <form class="m-t" role="form" action="index.html">
                    <a class="btn btn-block btn-social btn-google" >
                        <oauth2:connect provider="google" id="google-connect-link" class="fa fa-google"> Sign in with Google</oauth2:connect>
                    </a>
                    <a class="btn btn-block btn-social btn-google" >
                        <span class="fa fa-google"></span> Sign in with Google
                    </a>

                </form>
                <p class="m-t"><small>Nearsoft were the magic begins &copy; 2014</small></p>
            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
                function fix_height(){
                    var h = $("#tray").height();
                    $("#preview").attr("height", (($(window).height()) - h) + "px");
                }
                $(window).resize(function(){ fix_height(); }).resize();
                //$("#preview").contentWindow.focus();
            });
        </script>
    </body>

</html>

<!doctype html>
<html lang="en" class="no-js">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <asset:link rel="icon" href="favicon.ico"/>

        <title><g:layoutTitle default="Vincool"/></title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

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

        <!-- Custom and plugin javascript -->
        <asset:javascript src="inspinia.js"/>
        <asset:javascript src="plugins/pace/pace.min.js"/>

        <!-- jQuery UI custom -->
        <asset:javascript src="jquery-ui.custom.min.js"/>

        <!-- iCheck -->
        <asset:stylesheet src="plugins/iCheck/custom.css"/>
        <asset:javascript src="plugins/iCheck/icheck.min.js"/>

        <g:layoutHead/>

    </head>

    <body>

        <div id="wrapper">

            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element"> <span>
                                <asset:image src="profile_small.jpg" class="img-circle"/>
                            </span>
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">David Williams</strong>
                                    </span> <span class="text-muted text-xs block">Art Director <b class="caret"></b></span> </span> </a>
                                <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                    <li><a href="profile.html">Profile</a></li>
                                    <li><a href="contacts.html">Contacts</a></li>
                                    <li><a href="mailbox.html">Mailbox</a></li>
                                    <li class="divider"></li>
                                    <li><a href="login.html">Logout</a></li>
                                </ul>
                            </div>
                            <div class="logo-element">
                                IN+
                            </div>
                        </li>
                        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                            <li class="controller">
                                <g:link controller="${c.logicalPropertyName}"><i class="fa fa-th-large"></i><span class="nav-label">${c.name}</span></g:link>
                            </li>
                        </g:each>
                    </ul>

                </div>
            </nav>

            <g:layoutBody/>

        </div>

    </body>

</html>

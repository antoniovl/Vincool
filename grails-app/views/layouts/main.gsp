<!doctype html>
<html lang="en" class="no-js">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!--Social -->
    <meta property="og:title" content="Nearsoft Appretince">
    <meta property="og:description" content="Learn the basics of software development.">
    <meta property="og:url" content="https://d43419fa.ngrok.io/">
    <meta property="og:image" content="https://nearsoft.com/admin/wp-content/themes/Nearsoftv1/img/nearsoft-symbol.png"/>
    <meta property="og:type" content="website"/>
    <meta name="twitter:title" content="Nearsoft Appretince">
    <meta name="twitter:description" content="Learn the basics of software development.">
    <meta name="twitter:image" content="https://nearsoft.com/admin/wp-content/themes/Nearsoftv1/img/nearsoft-symbol.png">
    <meta name="twitter:card" content="photo">
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
                    <div class="dropdown profile-element"><span>
                        <img height="48px" width="48px" src="${session.profilePictureUrl}" class="img-circle"/>
                    </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"><span class="block m-t-xs"><strong
                                    class="font-bold">${session.name}</strong>
                            </span>
                                <!--span class="text-muted text-xs block">Art Director <b class="caret"></b></span-->
                            </span></a>
                        <!--ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">Profile</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                            <li><a href="mailbox.html">Mailbox</a></li>
                            <li class="divider"></li>
                            <li><a href="login.html">Logout</a></li>
                        </ul-->
                    </div>

                    <div class="logo-element">
                        NS
                    </div>
                </li>
                <li class="controller">
                    <g:link controller="profile"><i class="fa fa-user"></i><span
                            class="nav-label">Profile</span></g:link>
                </li>
                <sec:ifAllGranted roles='ROLE_ADMIN'>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                        <g:if test="${!(['Login', 'Logout', 'SpringSecurityOAuth2'].contains(c.name))}">
                            <li class="controller">
                                <g:link controller="${c.logicalPropertyName}"><i class="fa fa-th-large"></i><span
                                        class="nav-label">${c.name}</span></g:link>
                            </li>
                        </g:if>
                    </g:each>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles='ROLE_INSTRUCTOR'>
                    <li class="controller">
                        <g:link controller="program" action="index"><i class="fa fa-list"></i><span
                                class="nav-label">Programa Completo</span></g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="calendar" action="index"><i class="fa fa-calendar-o"></i><span
                                class="nav-label">Calendario</span></g:link>
                    </li>

                    <li class="controller">
                        <g:link controller="event" action="index"><i class="fa fa-book"></i><span
                                class="nav-label">Mis sesiones</span></g:link>
                    </li>

                    <li class="controller">
                        <g:link controller="notification" action="get"><i class="fa fa-book"></i><span
                                class="nav-label">Notificaciones</span></g:link>
                    </li>

                </sec:ifAllGranted>
                <sec:ifAllGranted roles='ROLE_STUDENT'>
                    <li class="controller">
                        <g:link controller="program" action="index"><i class="fa fa-list"></i><span
                                class="nav-label">Programa Completo</span></g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="calendar" action="index"><i class="fa fa-calendar-o"></i><span
                                class="nav-label">Calendario</span></g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="event" action="index"><i class="fa fa-book"></i><span
                                class="nav-label">Mis Eventos</span></g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="notification" action="get"><i class="fa fa-book"></i><span
                                class="nav-label">Notificaciones</span></g:link>
                    </li>
                </sec:ifAllGranted>

            </ul>

        </div>
    </nav>
    <g:layoutBody/>

</div>

</body>

</html>

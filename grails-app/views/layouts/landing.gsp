<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--Social -->

    <!-- Add Your favicon here -->
    <asset:link rel="icon" href="favicon.ico"/>

    <title>Nearsoft Apprentice</title>

    <!-- Bootstrap core CSS -->
    <asset:link href="landing_page/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Animation CSS -->
    <asset:link href="landing_page/css/animate.min.css" rel="stylesheet"/>

    <asset:link href="landing_page/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <asset:javascript src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"/>
    <asset:javascript src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"/>
    <![endif]-->

    <!-- Custom styles for this template -->
    <asset:link href="landing_page/css/style.css" rel="stylesheet"/>
    <asset:javascript src="landing_page/js/jquery-2.1.1.js"/>
    <asset:javascript src="landing_page/js/pace.min.js"/>
    <asset:javascript src="landing_page/js/bootstrap.min.js"/>

    <g:layoutHead/>
</head>
<body id="page-top">
<div class="navbar-wrapper">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/#page-top">Home</a></li>
                    <li><a  href="/#program">El Programa</a></li>
                    <li><a href="/#team">Los Mentores</a></li>
                    <li><a  href="/#next">Proximas clases</a></li>
                    <li><a href="/#testimonials">Testimonios</a></li>
                    <li><g:link controller="calendar" >Calendario</g:link></li>
                    <sec:ifNotLoggedIn><li><a class="page-scroll" href="/login">Login</a></li></sec:ifNotLoggedIn>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div id="inSlider" class="carousel carousel-fade" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#inSlider" data-slide-to="0" class="active"></li>
        <li data-target="#inSlider" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
            </div>
            <!-- Set background for slide in css -->
            <div class="header-back one"></div>

        </div>
        <div class="item">
            <div class="container">
            </div>
            <!-- Set background for slide in css -->
            <div class="header-back two"></div>
        </div>
    </div>
    <a class="left carousel-control" href="#inSlider" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#inSlider" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<g:layoutBody/>



<section id="contact" class="gray-section contact" style="margin-top: 0px;">
    <div class="container">
        <div class="row m-b-lg">
            <div class="col-lg-12 text-center">
                <div class="navy-line"></div>
                <h1>Contactanos</h1>
            </div>
        </div>
        <div class="row m-b-lg">
            <div class="col-lg-3 col-lg-offset-2">
                <address>
                    <strong><span class="navy">Hermosillo</span></strong><br/>
                    Blvd. Antonio Quiroga 21<br/>
                    Col. El Llano<br/>
                    Hermosillo, Sonora,<br/>
                    México 83210<br/>
                    <i class="fa fa-phone"></i> +52 (662) 216-7401
                </address>
            </div>
            <div class="col-lg-3">
                <address>
                    <strong><span class="navy">Ciudad de Mexico</span></strong><br/>
                    San Luis Potosí 196 int. 401<br/>
                    Col. Roma Norte<br/>
                    Del. Cuauhtémoc<br/>
                    Mexico, D.F. 06700<br/>
                    <i class="fa fa-phone"></i> +52 (55) 6388-6650
                </address>
            </div>
            <div class="col-lg-3">
                <address>
                    <strong><span class="navy">Chihuahua</span></strong><br/>
                    Calle 2da 2016<br/>
                    Col. Centro<br/>
                    Chihuahua, Chihuahua,<br/>
                    México 31000<br/>
                    <i class="fa fa-phone"></i> +52 (614) 259-3974
                </address>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <a href="mailto:test@email.com" class="btn btn-primary">Envianos un correo</a>
                <p class="m-t-sm">
                    O siguenos en nuestras redes sociales
                </p>
                <ul class="list-inline social-icon">
                    <li><a href="https://twitter.com/nearsoftjobs"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li><a href="https://www.facebook.com/nearsoftjobs/"><i class="fa fa-facebook"></i></a>
                    </li>

                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center m-t-lg m-b-lg">
                <p><strong>&copy; 2015 Nearsoft Inc.</strong><br/> </p>
            </div>
        </div>
    </div>
</section>

<asset:javascript src="landing_page/js/classie.js"/>
<asset:javascript src="landing_page/js/cbpAnimatedHeader.js"/>
<asset:javascript src="landing_page/js/wow.min.js"/>
<asset:javascript src="landing_page/js/inspinia.js"/>
</body>
</html>

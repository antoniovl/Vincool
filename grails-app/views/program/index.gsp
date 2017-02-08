<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="landing">
</head>

<body id="page-top">

<section id="next" class="timeline gray-section" style="margin-top: 0px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="navy-line"></div>

                <h1>Programa Completo</h1>
            </div>
        </div>

        <div class="row features-block">

            <div class="col-lg-12">
                <div id="vertical-timeline" class="vertical-container light-timeline center-orientation">
                    <g:each in="${nextClasses}">
                        <div class="vertical-timeline-block">
                            <div class="vertical-timeline-icon navy-bg">
                                <i class="fa fa-briefcase"></i>
                            </div>

                            <div class="vertical-timeline-content">
                                <h2>${it.eventCategory}</h2>

                                <p>${it.description}
                                </p>
                                <g:link controller="event" action="show" id="${it.id}"
                                        class="btn btn-xs btn-primary">Mas informacion</g:link>
                                <span class="vertical-date"><g:formatDate date="${it.date.toDate()}"/></span>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>

        </div>
    </div>

</section>
</body>
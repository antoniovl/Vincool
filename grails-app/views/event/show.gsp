<g:applyLayout name="simple">
    <content tag="head">
        <asset:link rel="stylesheet" type="text/css" href="jssocials/jssocials.css"/>
        <asset:link rel="stylesheet" type="text/css" href="jssocials/jssocials-theme-classic.css"/>
        <meta property="og:title" content="Nearsoft Apprentice ${event.office} '${event.eventCategory.subCategory}'">
        <meta property="og:description"
              content="Join us this ${event.date} at ${event.time.toString('HH:mm')} for the ${event.type} class '${event.eventCategory.subCategory}' : ${event.description} ">
        <meta property="og:url" content="${request.getRequestURL()}">
        <meta property="og:image"
              content="https://nearsoft.com/admin/wp-content/themes/Nearsoftv1/img/nearsoft-symbol.png"/>
        <meta property="og:type" content="website"/>
        <meta name="twitter:title" content="Nearsoft Apprentice">
        <meta name="twitter:description" content="Learn the basics of software development.">
        <meta name="twitter:image"
              content="https://nearsoft.com/admin/wp-content/themes/Nearsoftv1/img/nearsoft-symbol.png">
        <meta name="twitter:card" content="photo">
    </content>
    <content tag="boxTitle">
        <h3>Session Detail</h3>
    </content>
    <content tag="boxContent">
        <br/>
        <br/>
        <br/>
        <section class="container features" style="margin-top: 0px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center" >
                        <div class="navy-line" style="margin: 20px auto 0;"></div>
                        <h1 class="font-bold m-b-xs">${event.eventCategory.subCategory} - <span
                                class="navy">${event.type}</span></h1>
                    </div>
                </div>
                <br/>

                <div class="row">
                    <div class="col-lg-9 col-md-8 col-xs-12">
                        <h1 style="margin: 10px 0px 5px; text-transform: uppercase;"
                            class="product-main-price"><g:formatDate date="${event.date.toDate()}"/> - <g:formatDate
                                date="${event.time.toDateTimeToday().toDate()}" type="time" style="SHORT"/></h1>
                    </div>

                    <div class="col-lg-3 col-md-4 col-xs-12">
                        <sec:ifAllGranted roles='ROLE_STUDENT'>
                            <g:if test="${isEnrolled}">
                                <g:set var="enrollButtonMessage"
                                       value="${message(code: "default.disenroll.button.label", default: "Cancel enrollment")}"/>
                                <g:set var="enrollButtonClass" value="${"btn pull-right btn-danger"}"/>
                                <g:set var="enrollFormAction" value="${"disenroll"}"/>
                            </g:if>
                            <g:else>
                                <g:set var="enrollButtonMessage"
                                       value="${message(code: "default.enroll.button.label", default: "Enroll in this event")}"/>
                                <g:set var="enrollButtonClass" value="${"btn pull-right btn-primary"}"/>
                                <g:set var="enrollFormAction" value="${"enroll"}"/>
                            </g:else>

                            <g:form name="enrollForm" controller="attendee" action="${enrollFormAction}"
                                    id="${event.id}" method="POST">
                                <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton"
                                                value="${enrollButtonMessage}" style="margin: 10px 0px 5px; width: 100%;"/>
                            </g:form>
                        </sec:ifAllGranted>

                        <sec:ifNotLoggedIn>
                            <g:set var="enrollButtonMessage"
                                   value="${message(code: "default.enroll.button.label", default: "Enroll in this event")}"/>
                            <g:set var="enrollButtonClass" value="${"btn pull-right btn-primary"}"/>
                            <g:set var="enrollFormAction" value="${"enroll"}"/>
                            <g:form name="enrollForm" controller="attendee" action="${enrollFormAction}"
                                    id="${event.id}" method="POST">
                                <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton"
                                                value="${enrollButtonMessage}" style="margin: 10px 0px 5px; width: 100%;"/>
                            </g:form>
                        </sec:ifNotLoggedIn>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h3><g:message code="default.session.description.label" default="Event description"/></h3>

                        <div class="text-muted">
                            ${event.description}
                        </div>

                        <h3><g:message code="default.instructor.label" default="Instructor"/></h3>

                        <div class="text-muted">
                            ${event.instructor.name}
                        </div>

                        <sec:ifAnyGranted roles='ROLE_INSTRUCTOR,ROLE_ADMIN'>

                            <h3><g:message code="default.eventCategory.label" default="Event Category"/></h3>

                            <div class="text-muted">
                                ${event.eventCategory.category}
                            </div>

                            <h3><g:message code="default.batch.label" default="Batch"/></h3>

                            <div class="text-muted">
                                ${event.batch}
                            </div>

                        </sec:ifAnyGranted>

                        <h3><g:message code="default.office.location.label" default="Location"/></h3>

                        <div class="text-muted">
                            ${event.office.location}
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <iframe width="100%" height="250" frameborder="0" style="border:0"
                                src="https://www.google.com/maps/embed/v1/place?q=${event.office.location}&key=AIzaSyDTheQkFI_mOE0ry4A4JnOqn0OSWV_cnPE" allowfullscreen></iframe>
                    </div>
                </div>

                <br/>

                <div class="row">
                    <div class="col-lg-3 col-md-4 col-xs-12">
                        <div class="text-left">
                            <div class="jssocials-shares">
                                <a href="mailto:${event.instructor.email}" class="btn btn-w-m btn-default jssocials-shares" style="width: 100%;"><i
                                        class="fa fa-envelope"></i> <g:message code="default.instructor.contact.label" default=" Contact with author"/>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-9 col-md-8 col-xs-12">
                        <div id="share" class="text-right">
                            <asset:javascript src="plugins/jssocials/jssocials.min.js"/>
                            <script>
                                $("#share").jsSocials({
                                    shares: ["facebook", "twitter", "linkedin", "googleplus"],
                                    text: "Nearsoft Apprentice: ${event.eventCategory.subCategory} ${event.description} ${event.time}",
                                    showCount: true,
                                    showLabel: false
                                });
                            </script>
                        </div>

                    </div>



                </div>
            </div>
        </section>
    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>
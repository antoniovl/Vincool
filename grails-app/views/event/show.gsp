<g:applyLayout name="simple">
    <content tag="head">
        <asset:link rel="stylesheet" type="text/css" href="jssocials/jssocials.css" />
        <asset:link rel="stylesheet" type="text/css" href="jssocials/jssocials-theme-classic.css" />
        <meta property="og:title" content="Nearsoft Apprentice ${eventDetails.office} '${eventDetails.eventCategory.subCategory}'">
        <meta property="og:description" content="Join us this ${eventDetails.date} at ${eventDetails.time.toString('HH:mm')} for the ${eventDetails.type} class '${eventDetails.eventCategory.subCategory}' : ${eventDetails.description} ">
        <meta property="og:url" content="${request.getRequestURL()}">
        <meta property="og:image" content="https://nearsoft.com/admin/wp-content/themes/Nearsoftv1/img/nearsoft-symbol.png"/>
        <meta property="og:type" content="website"/>
        <meta name="twitter:title" content="Nearsoft Apprentice">
        <meta name="twitter:description" content="Learn the basics of software development.">
        <meta name="twitter:image" content="https://nearsoft.com/admin/wp-content/themes/Nearsoftv1/img/nearsoft-symbol.png">
        <meta name="twitter:card" content="photo">
    </content>
    <content tag="boxTitle">
        <h3>Session Detail</h3>
    </content>
    <content tag="boxContent">
        <div class="ibox product-detail">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="font-bold m-b-xs">${eventDetails.eventCategory.subCategory} - (${eventDetails.type} class)</h1>
                    <hr/>

                    <div>
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
                                    id="${eventDetails.id}" method="POST">
                                <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton"
                                                value="${enrollButtonMessage}"/>
                            </g:form>
                        </sec:ifAllGranted>

                        <sec:ifNotLoggedIn>
                            <g:set var="enrollButtonMessage"
                                   value="${message(code: "default.enroll.button.label", default: "Enroll in this event")}"/>
                            <g:set var="enrollButtonClass" value="${"btn pull-right btn-primary"}"/>
                            <g:set var="enrollFormAction" value="${"enroll"}"/>
                            <g:form name="enrollForm" controller="attendee" action="${enrollFormAction}"
                                    id="${eventDetails.id}" method="POST">
                                <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton"
                                                value="${enrollButtonMessage}"/>
                            </g:form>
                        </sec:ifNotLoggedIn>
                        <h1 class="product-main-price">${eventDetails.date} at ${eventDetails.time}</h1>
                    </div>

                    <hr>

                    <h3><g:message code="default.session.description.label" default="Event description"/></h3>

                    <div class="text-muted">
                        ${eventDetails.description}
                    </div>

                    <h3><g:message code="default.instructor.label" default="Instructor"/></h3>

                    <div class="text-muted">
                        ${eventDetails.instructor.name}
                    </div>

                    <h3><g:message code="default.office.location.label" default="Location"/></h3>

                    <div class="text-muted">
                        ${eventDetails.office.location}
                    </div>

                    <sec:ifAnyGranted roles='ROLE_INSTRUCTOR,ROLE_ADMIN'>

                        <h3><g:message code="default.eventCategory.label" default="Event Category"/></h3>
                        <div class="text-muted">
                            ${eventDetails.eventCategory.category}
                        </div>

                        <h3><g:message code="default.batch.label" default="Batch"/></h3>
                        <div class="text-muted">
                            ${eventDetails.batch}
                        </div>

                    </sec:ifAnyGranted>

                    <div class="text-right">
                        <div class="btn-group">
                            <button class="btn btn-white btn-sm"><i class="fa fa-star"></i> Add to wishlist</button>
                            <button class="btn btn-white btn-sm"><i class="fa fa-envelope"></i> Contact with author
                            </button>
                        </div>
                    </div>
                    <div id="share">
                        <asset:javascript src="plugins/jssocials/jssocials.min.js"/>
                        <script>
                            $("#share").jsSocials({
                                shares: [ "facebook", "twitter", "linkedin", "googleplus"],
                                text: "Nearsoft Apprentice: ${eventDetails.eventCategory.subCategory} ${eventDetails.description} ${eventDetails.time}",
                                showCount: true,
                                showLabel: false
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>

    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>
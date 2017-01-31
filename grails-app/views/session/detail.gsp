<g:applyLayout name="simple">
    <content tag="boxTitle">
        <h3>Session Detail</h3>
    </content>
    <content tag="boxContent">
        <div class="ibox product-detail">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="font-bold m-b-xs"> ${sessionDetails.lesson.topic} - (${sessionDetails.type} CLASS)</h1>

                    <div>

                        <g:if test="${isEnrolled == true}">
                            <g:set var="enrollButtonMessage" value="${message(code: "default.disenroll.button.label", default: "Cancel enrollment")}"/>
                            <g:set var="enrollButtonClass" value="${"btn pull-right btn-danger"}"/>
                            <g:set var="enrollFormAction" value="${"disenroll"}"/>
                        </g:if>
                        <g:else>
                            <g:set var="enrollButtonMessage" value="${message(code: "default.enroll.button.label", default: "Enroll in this session")}"/>
                            <g:set var="enrollButtonClass" value="${"btn pull-right btn-primary"}"/>
                            <g:set var="enrollFormAction" value="${"enroll"}"/>
                        </g:else>

                        <g:form name="enrollForm" controller="student" action="${enrollFormAction}" id="${sessionDetails.id}" method="POST" >
                            <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton" value="${enrollButtonMessage}"/>
                        </g:form>

                        <h1 class="product-main-price">${sessionDetails.date} at ${sessionDetails.time} </h1>
                    </div>

                    <hr>

                    <h3><g:message code="default.session.description.label" default="Session description"/></h3>
                    <div class="text-muted">
                        ${sessionDetails.lesson.description}
                    </div>

                    <h3><g:message code="default.instructor.label" default="Instructor"/></h3>
                    <div class="text-muted">
                        ${sessionDetails.instructor.name}
                    </div>

                    <h3><g:message code="default.office.location.label" default="Location"/></h3>
                    <div class="text-muted">
                        ${sessionDetails.office.location}
                    </div>

                    <div class="text-right">
                        <div class="btn-group">
                            <button class="btn btn-white btn-sm"><i class="fa fa-star"></i> Add to wishlist </button>
                            <button class="btn btn-white btn-sm"><i class="fa fa-envelope"></i> Contact with author </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>

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
                        <button class="btn btn-primary pull-right"><g:message code="default.enroll.session.label" default="Enroll in this session"/></button>
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

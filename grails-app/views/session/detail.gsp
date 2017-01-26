<!DOCTYPE html>
<html>

    <head>
        <meta name="layout" content="main"/>
        <title>Session Detail</title>
    </head>

    <body>

        <div class="row animated fadeInDown">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <h2><span class="text-navy">Topic:</span></h2> ${sessionDetails.lesson.topic} - (${sessionDetails.type} CLASS) <br/>
                            <h2><span class="text-navy">Description:</span></h2> ${sessionDetails.lesson.description} <br/>
                            <h2><span class="text-navy">Instructor:</span></h2> ${sessionDetails.instructor.name} <br/>
                            <h2><span class="text-navy">Date:</span></h2> ${sessionDetails.date} at ${sessionDetails.time} <br/>
                            <h2><span class="text-navy">Place:</span></h2> ${sessionDetails.office.location} <br/>
                            <br/><g:submitButton name="enroll" value="Enroll in this session" class="btn btn-primary"/>
                        </div>
                    </div>
                </div>
        </div>

    </body>

</html>
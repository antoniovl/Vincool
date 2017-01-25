<!DOCTYPE html>
<html>

    <head>
        <meta name="layout" content="main"/>
        <title>Session Detail</title>
    </head>

    <body>
        <h2>Topic:</h2> ${sessionDetails.lesson.topic} - (${sessionDetails.type} CLASS) <br/>
        <h2>Description:</h2> ${sessionDetails.lesson.description} <br/>
        <h2>Instructor:</h2> ${sessionDetails.instructor.name} <br/>
        <h2>Date:</h2> ${sessionDetails.date} at ${sessionDetails.time} <br/>
        <h2>Place:</h2> ${sessionDetails.office.location} <br/>
        <br/><g:submitButton name="enroll" value="Enroll in this session"/>
    </body>

</html>
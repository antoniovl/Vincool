<!DOCTYPE html>
<html>

    <head>
        <meta name="layout" content="main"/>
        <title>Render Domain</title>
    </head>

    <body>
        <h2>Topic:</h2> ${sessionInstance.lesson.topic} (${sessionInstance.type} CLASS) <br/>
        <h2>Description:</h2> ${sessionInstance.lesson.description} <br/>
        <h2>Instructor:</h2> ${sessionInstance.instructor.name} <br/>
        <h2>Date:</h2> ${sessionInstance.date} at ${sessionInstance.time} <br/>
        <h2>Place:</h2> ${sessionInstance.office.officeCode} <br/>
    </body>

</html>
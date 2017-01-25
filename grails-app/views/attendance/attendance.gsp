<!DOCTYPE html>
<html>

<head>

    <meta name="layout" content="main"/>
    <title>Attendance for ${sessionName}</title>

</head>

<body>

<div id="wrapper">

    <div class="wrapper wrapper-content animated fadeInRight">
        <g:form action="save" id="${sessionId}" method="POST">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>${sessionName} </h5>
                        </div>

                        <div class="ibox-content">

                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Student's name</th>
                                    <th>Attendance</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${enrollments}">
                                    <tr>
                                        <td>${it.student.name}</td>
                                        <td>
                                            <div class="switch">
                                                <div class="onoffswitch">
                                                    <g:checkBox name="attendance_${it.student.id}"
                                                                value="${it.attendance}"
                                                                class="onoffswitch-checkbox"/>
                                                    <label class="onoffswitch-label" for="attendance_${it.student.id}">
                                                        <span class="onoffswitch-inner"></span>
                                                        <span class="onoffswitch-switch"></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-8">
                            <button class="btn btn-white" type="button">Cancel</button>
                            <button class="btn btn-primary" type="submit">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>

    </div>
</div>

</body>

</html>

<g:applyLayout name="simple">
    <content tag="boxTitle">
        <h5>Topic Name: ${sessionName}</h5> &nbsp;/ <a
            href="<g:createLink action="enroll" id="${sessionId}"/>" class="text-info">Enroll a student</a>
    </content>
    <content tag="boxContent">
        <g:form action="save" id="${sessionId}">
            <div class="row">
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

            <div class="row">
                <div class="col-sm-offset-9">
                    <button class="btn btn-white" type="button">Cancel</button>
                    <button class="btn btn-primary" type="submit">Save changes</button>
                </div>
            </div>
        </g:form>
    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>

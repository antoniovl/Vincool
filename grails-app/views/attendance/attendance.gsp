<g:applyLayout name="simple">
    <content tag="boxTitle">
        <h5>${sessionName}</h5>
    </content>
    <content tag="boxContent">
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
    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>

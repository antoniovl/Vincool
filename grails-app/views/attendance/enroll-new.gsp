<g:applyLayout name="simple">
    <content tag="boxTitle">

        <h5>Registered attendees</h5>

    </content>
    <content tag="boxContent">
        <g:if test="${attendees.size > 0}">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover dataTables-example">
                    <thead>
                    <tr>
                        <th>Attendees name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    <g:each in="${attendees}">
                        <tr class="gradeX">
                            <g:form action="enrollAttendee" id="${eventId}" method="POST">
                                <td>${it.name}</td>
                                <td>${it.email}</td>
                                <td><button class="btn btn-primary" type="submit" href="">Enroll</button>
                                </td>
                                <g:hiddenField name="studentId" value="${it.id}"/>
                            </g:form>
                        </tr>

                    </g:each>

                </tfoot>
                </table>
            </div>
        </g:if>
        <g:else>
            <div class="alert alert-info">
                All the registered attendees have been enrolled to ${eventname}
            </div>
        </g:else>

        <div class="row">
            <div class="col-sm-offset-9">
                <a href="<g:createLink action="get" id="${eventId}"/>"
                   class="btn btn-primary btn">Go back to event</a>
            </div>
        </div>

    </content>

    <content tag="breadcrumbs">
    </content>

    <!-- Data Tables -->
    <asset:javascript src="plugins/dataTables/jquery.dataTables.js"/>
    <asset:javascript src="plugins/dataTables/dataTables.bootstrap.js"/>
    <asset:javascript src="plugins/dataTables/dataTables.responsive.js"/>
    <asset:javascript src="plugins/dataTables/dataTables.tableTools.min.js"/>


    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $('.dataTables-example').DataTable({
                "dom": 'ftr'
            });

            $('input[type="search"]')[0].focus();

        });



    </script>
</g:applyLayout>

<g:applyLayout name="simple">
    <content tag="head">

        <asset:javascript src="plugins/dataTables/jquery.dataTables.js"/>
        <asset:javascript src="plugins/dataTables/dataTables.bootstrap.js"/>
        <asset:javascript src="plugins/dataTables/dataTables.responsive.js"/>
        <asset:javascript src="plugins/dataTables/dataTables.tableTools.min.js"/>

        <!-- Page-Level Scripts -->
        <script>
            $(document).ready(function () {
                $('.dataTables-example').DataTable({
                    "dom": 'frt'
                });

                $('input[type="search"]')[0].focus();

            });



        </script>

    </content>
    <content tag="boxTitle">

        <h5>Registered attendees</h5>

    </content>
    <content tag="boxContent">
        <g:if test="${attendees.size > 0}">
            <div class="table-responsive">
                <table class="table table-striped table-hover dataTables-example">
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
                                <td><button class="btn btn-outline btn-sm btn-primary" type="submit"
                                            href="">Enroll</button>
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
                   class="btn btn-outline btn-primary btn">Go back to event</a>
            </div>
        </div>

    </content>

    <content tag="breadcrumbs">
        <li><a href="<g:createLink controller="attendance" action="get" id="${eventId}"/>">Events</a></li>
    </content>

</g:applyLayout>

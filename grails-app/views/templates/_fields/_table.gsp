<div class="table-responsive">
    <table class="table table-striped table-hover ">
        <thead>
        <tr>
            <g:each in="${domainProperties}" var="p" status="i">
                <g:set var="propTitle">${domainClass.propertyName}.${p.name}.label</g:set>
                <g:sortableColumn property="${p.name}" title="${message(code: propTitle, default: p.naturalName)}"/>
            </g:each>
            <th><g:message code="defaul.table.actions.label" default="Actions"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr>
                <g:each in="${domainProperties}" var="p" status="j">
                    <td>${bean[p.name]}</td>
                </g:each>
                <td>

                    <g:link method="GET" resource="${bean}" class="btn btn-outline btn-default btn-sm">
                        <i class="fa fa-eye"></i>
                        <g:message code="default.button.view.label" default="View"/>
                    </g:link>
                    <g:link action="edit" resource="${bean}" class="btn btn-outline btn-primary btn-sm">
                        <i class="fa fa-pencil-square"></i>
                        <g:message code="default.button.edit.label" default="Edit"/>
                    </g:link>
                    <g:if test="${bean instanceof vincool.Event}">
                        <g:link controller="attendance" action="get" id="${bean.id}"
                                class="btn btn-outline btn-success btn-sm">
                            <i class="fa fa-list-alt"></i>
                            <g:message code="event.button.attendance.label" default="Attendance"/>
                        </g:link>
                        <g:link controller="attendance" action="enroll" id="${bean.id}"
                                class="btn btn-outline btn-success btn-sm">
                            <i class="fa fa-plus-square"></i>
                            <g:message code="event.button.enroll.label" default="Enroll"/></g:link>
                    </g:if>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

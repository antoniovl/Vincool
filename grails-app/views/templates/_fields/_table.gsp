<table class="table table-striped">
    <thead>
    <tr>
        <g:each in="${domainProperties}" var="p" status="i">
            <g:set var="propTitle">${domainClass.propertyName}.${p.name}.label</g:set>
            <g:sortableColumn property="${p.name}" title="${message(code: propTitle, default: p.naturalName)}"/>
        </g:each>
        <td></td>
    </tr>
    </thead>
    <tbody>
    <g:each in="${collection}" var="bean" status="i">
        <tr>
            <g:each in="${domainProperties}" var="p" status="j">
                <td><f:display bean="${bean}" property="${p.name}" displayStyle="${displayStyle ?: 'table'}"/></td>
            </g:each>
            <td>
                <div class="btn-group">
                    <g:link method="GET" resource="${bean}" class="btn btn-default btn-sm"><g:message
                            code="default.button.view.label" default="View"/></g:link><g:link action="edit" resource="${bean}" class="btn btn-primary btn-sm"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

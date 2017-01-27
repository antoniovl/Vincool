<g:applyLayout name="simple">
    <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
    <content tag="boxTitle">
        <h5><g:message code="default.show.label" args="[entityName]" /></h5>
    </content>
    <content tag="boxContent">
        <g:if test="\${flash.message}">
            <div class="message" role="status">\${flash.message}</div>
        </g:if>
        <f:display bean="${propertyName}" />
        <g:form resource="\${this.${propertyName}}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="btn btn-default" action="edit" resource="\${this.${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <input class="btn btn-primary" type="submit" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>

    </content>
    <content tag="breadcrumbs">
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </content>
</g:applyLayout>

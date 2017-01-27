<g:applyLayout name="simple">
    <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
    <content tag="boxTitle">
        <h5><g:message code="default.edit.label" args="[entityName]" /></h5>

        <div class="ibox-tools">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-plus"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                      args="[entityName]"/></g:link>
                </li>
            </ul>
        </div>
    </content>
    <content tag="boxContent">
        <g:if test="\${flash.message}">
            <div class="message" role="status">\${flash.message}</div>
        </g:if>
        <g:hasErrors bean="\${this.${propertyName}}">
            <ul class="errors" role="alert">
                <g:eachError bean="\${this.${propertyName}}" var="error">
                    <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form resource="\${this.${propertyName}}" method="PUT" class="form-horizontal">
            <g:hiddenField name="version" value="\${this.${propertyName}?.version}" />
            <div class="form-group">
                <f:all bean="${propertyName}"/>
            </div>

            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-2">
                    <button class="btn btn-white" type="submit">Cancel</button>
                    <input class="btn btn-primary" type="submit" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
                </div>

            </div>
        </g:form>

    </content>
    <content tag="breadcrumbs">
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </content>
</g:applyLayout>

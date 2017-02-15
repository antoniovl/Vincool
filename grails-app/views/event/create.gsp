<g:applyLayout name="simple">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
    <content tag="boxTitle">
        <h5><g:message code="default.create.label" args="[entityName]" /></h5>

    </content>
    <content tag="boxContent">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.event}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.event}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form action="save"  class="form-horizontal" enctype="multipart/form-data">
            <div class="form-group">
                <f:all bean="event"/>
            </div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-2">
                    <button class="btn btn-white btn-outline" type="submit">Cancel</button>
                    <input class="btn btn-primary btn-outline" type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </div>
        </g:form>

    </content>
    <content tag="breadcrumbs">
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </content>
</g:applyLayout>

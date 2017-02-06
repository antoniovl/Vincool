<%@ page import="grails.util.GrailsNameUtils" %>

<g:if test="${bean.getClass().constrainedProperties[property].isDisplay()}">
    <div class="form-group">
        <g:set var="propTitle">${GrailsNameUtils.getPropertyName(bean.getClass().getSimpleName())}.${property}.label</g:set>
        <label class="col-sm-2 control-label">${message(code: propTitle, default: grails.util.GrailsNameUtils.getNaturalName(property))}</label>
        <div class="col-sm-10">
            <f:widget bean="${bean}" property="${property}" value="${value}" class="form-control"/>
        </div>
    </div>

    <div class="hr-line-dashed"></div>
</g:if>
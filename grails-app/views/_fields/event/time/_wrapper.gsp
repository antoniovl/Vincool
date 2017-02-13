<%@ page import="grails.util.GrailsNameUtils" %>
<div class="form-group">
    <g:set var="propTitle">${bean.getClass().getSimpleName()}.${property}.label</g:set>
    <label class="col-sm-2 control-label">${message(code: propTitle, default: grails.util.GrailsNameUtils.getNaturalName(property))}</label>
    <div class="col-sm-10">
        <input type="time" name="time" value="${value}" required="" id="time"/>
    </div>
</div>
<div class="hr-line-dashed"></div>

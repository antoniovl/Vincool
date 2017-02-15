<%@ page import="grails.util.GrailsNameUtils" %>

<content tag="head">
    <asset:stylesheet src="plugins/jasny/jasny-bootstrap.min.css"/>
    <asset:javascript src="plugins/jasny/jasny-bootstrap.min.js"/>
</content>

<div class="form-group">
    <g:set var="propTitle">${bean.getClass().getSimpleName()}.${property}.label</g:set>
    <label class="col-sm-2 control-label">${message(code: propTitle, default: grails.util.GrailsNameUtils.getNaturalName(property))}</label>

    <div class="col-sm-10">
        ${value}----
        <div class="fileinput fileinput-new" data-provides="fileinput">
            <span class="btn btn-default btn-file"><span class="fileinput-new"><g:message code="select.file"
                                                                                          default="Select file"/></span>
                <span class="fileinput-exists"><g:message code="change"/></span><input type="file" name="picture"/>
            </span>
            <span class="fileinput-filename"></span>
            <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">×</a>
        </div>
    </div>
</div>

<div class="hr-line-dashed"></div>

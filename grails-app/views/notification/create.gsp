<g:applyLayout name="simple">
    <content tag="boxTitle">
        <h5>Create Notification</h5>
    </content>
    <content tag="boxContent">
        <g:form  action="save" controller="notification">
            <div class="form-group">
                <label class="col-sm-2 control-label">Message</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="message" value="" required="" id="message" />
                </div>
            </div>
            <input type="hidden" class="form-control" name="id" value="${id}" required="" id="id" />
            <input type="hidden" class="form-control" name="type" value="${type}" required="" id="type" />
            <button class="btn btn-outline btn-primary" type="submit">Create</button>
        </g:form>
    </content>
</g:applyLayout>
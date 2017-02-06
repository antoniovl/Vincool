<g:applyLayout name="simple">
    <content tag="head">
        <asset:javascript src="plugins/fullcalendar/moment.min.js"/>
        <asset:stylesheet href="plugins/fullcalendar/fullcalendar.css"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.min.js"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.print.css" media="print"/>
    </content>
    <content tag="boxTitle">
        Profile
    </content>
    <content tag="boxContent">
        <div class="row animated fadeInRight">
            <div class="col-md-12">
                <div class="ibox float-e-margins">

                    <div class="col-md-3">
                        <img src="${session.profilePictureUrl}" class="img-circle circle-border" height="250px" width="250px" alt="profile">
                    </div>

                    <div class="col-md-9">

                        <g:form controller="profile" action="update" method="PUT">

                            <br>
                            <label id="nameLabel">
                                <g:if test="${session.name == null}">
                                    <h3 id="nameValue"><strong>Click to add your name</strong></h3>
                                </g:if>
                                <g:else>
                                    <h3 id="nameValue"><strong>${session.name}</strong></h3>
                                </g:else>
                            </label>
                            <g:textField id="nameInput" name="name" class="form-control"/>
                            <br>

                            <sec:ifAllGranted roles='ROLE_STUDENT'>
                                <p>
                                <h5><i class="fa fa-briefcase"></i> Work</h5>
                                <label id="workLabel">
                                    <g:if test="${user.currentCompany == null}">
                                        <h5 id="workValue">Click to add a company</h5>
                                    </g:if>
                                    <g:else>
                                        <h5 id="workValue">${user.currentCompany}</h5>
                                    </g:else>
                                </label>
                                </p>
                                <g:textField id="workInput" name="currentCompany" class="form-control"/>

                                <p>
                                <h5><i class="fa fa-graduation-cap"></i> School</h5>
                                <label id="schoolLabel">
                                    <g:if test="${user.school == null}">
                                        <h5 id="schoolValue">Click to add a school</h5>
                                    </g:if>
                                    <g:else>
                                        <h5 id="schoolValue">${user.school}</h5>
                                    </g:else>
                                </label>
                                </p>
                                <g:textField id="schoolInput" name="school" class="form-control"/>

                                <p>
                                <h5><i class="fa fa-user"></i> About me</h5>
                                <label id="aboutMeLabel">
                                    <g:if test="${user.description == null}">
                                        <h5 id="aboutMeValue">Click to tell us about you</h5>
                                    </g:if>
                                    <g:else>
                                        <h5 id="aboutMeValue">${user.description}</h5>
                                    </g:else>
                                </label>
                                </p>
                                <g:textArea id="aboutMeInput" name="description" cols="80" rows="8" class="form-control"/>
                            </sec:ifAllGranted>

                            <br>
                            <div class="user-button">
                                <div class="row">
                                    <div class="col-md-12">
                                        <g:link controller="home" class="btn btn-white btn-outline">
                                            Cancel
                                        </g:link>
                                        <button type="submit" name="submit" value="Update info" class="btn btn-primary btn-outline">
                                            <i class="fa fa-user"></i> Update info
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </g:form>

                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {

                function labelClick(label, labelValue, input) {
                    label.hide();
                    input.val(labelValue.text());
                    input.show().focus();
                    return;
                }

                function inputFocusOut(label, labelValue, input) {
                    labelValue.text(input.val());
                    input.hide();
                    label.show();
                }

                var nameInput = $('#nameInput');
                var nameLabel = $('#nameLabel');
                var nameValue = $('#nameValue');

                nameInput.hide();

                nameLabel.click(function () {
                    labelClick(nameLabel, nameValue, nameInput);
                });

                nameInput.focusout(function() {
                    inputFocusOut(nameLabel, nameValue, nameInput);
                });

                var workInput = $('#workInput');
                var workLabel = $('#workLabel');
                var workValue = $('#workValue');

                workInput.hide();

                workLabel.click(function () {
                    labelClick(workLabel, workValue, workInput);
                });

                workInput.focusout(function() {
                    inputFocusOut(workLabel, workValue, workInput);
                });

                var schoolInput = $('#schoolInput');
                var schoolLabel = $('#schoolLabel');
                var schoolValue = $('#schoolValue');

                schoolInput.hide();

                schoolLabel.click(function () {
                    labelClick(schoolLabel, schoolValue, schoolInput);
                });

                schoolInput.focusout(function() {
                    inputFocusOut(schoolLabel, schoolValue, schoolInput);
                });

                var aboutMeInput = $('#aboutMeInput');
                var aboutMeLabel = $('#aboutMeLabel');
                var aboutMeValue = $('#aboutMeValue');

                aboutMeInput.hide();

                aboutMeLabel.click(function () {
                    labelClick(aboutMeLabel, aboutMeValue, aboutMeInput);
                });

                aboutMeInput.focusout(function() {
                    inputFocusOut(aboutMeLabel, aboutMeValue, aboutMeInput);
                });

            });
        </script>
</content>
</g:applyLayout>

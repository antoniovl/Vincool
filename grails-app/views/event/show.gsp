<g:applyLayout name="simple">

    <content tag="head">

    </content>

    <content tag="boxTitle">
        <h3>Edit Event</h3>
    </content>

    <content tag="boxContent">
        <div class="row">
            <div class="col-lg-12">
                <div class="m-b-md">
                    <a href="#" class="btn btn-white btn-xs pull-right">Edit project</a>
                    <h2>${event.eventCategory.subCategory}</h2>
                </div>
                <dl class="dl-horizontal">
                    <dt>Status:</dt> <dd><span class="label label-primary">Active</span></dd>
                </dl>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5">
                <dl class="dl-horizontal">
                    <dt>Category:</dt> <dd>${event.eventCategory.category}</dd>
                    <dt>Type:</dt> <dd>${event.type}</dd>
                    <dt>Description:</dt> <dd>${event.description}</dd>
                </dl>
            </div>
            <div class="col-lg-7" id="cluster_info">
                <dl class="dl-horizontal" >

                    <dt>Location:</dt> <dd>${event.office}</dd>
                    <dt>Date:</dt> <dd>${event.date} at ${event.time}</dd>
                    <dt>Calendar Color:</dt> <dd>${event.eventCategory.color}</dd>
                    <dt>Attendees:</dt>
                    <dd class="project-people">
                        <g:each in="${eventDetails.attendeesPictures}" var="url" >
                            <img alt="image" class="img-circle" src="${url}">
                        </g:each>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <dl class="dl-horizontal">
                    <dt>Assistance Percentage:</dt>
                    <dd>
                        <div class="progress progress-striped active m-b-sm">
                            <div style="width: ${eventDetails.assistancePercentage}%;" class="progress-bar"></div>
                        </div>
                        <small><strong>${eventDetails.assistancePercentage}%</strong> of the enrolled attendees assisted to this event.</small>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="row m-t-sm">
            <div class="col-lg-12">
                <div class="panel blank-panel">
                    <div class="panel-heading">
                        <div class="panel-options">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-1" data-toggle="tab">Enrollments</a></li>
                                <li class=""><a href="#tab-2" data-toggle="tab">Resources</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-1">
                                <div class="feed-activity-list">
                                    <div class="feed-element">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a2.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2h ago</small>
                                            <strong>Mark Johnson</strong> posted message on <strong>Monica Smith</strong> site. <br>
                                            <small class="text-muted">Today 2:10 pm - 12.06.2014</small>
                                            <div class="well">
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                                Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a3.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2h ago</small>
                                            <strong>Janet Rosowski</strong> add 1 photo on <strong>Monica Smith</strong>. <br>
                                            <small class="text-muted">2 days ago at 8:30am</small>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">5h ago</small>
                                            <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                            <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
                                                <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> Love</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a5.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2h ago</small>
                                            <strong>Kim Smith</strong> posted message on <strong>Monica Smith</strong> site. <br>
                                            <small class="text-muted">Yesterday 5:20 pm - 12.06.2014</small>
                                            <div class="well">
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                                Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/profile.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">23h ago</small>
                                            <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                            <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a7.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">46h ago</small>
                                            <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                            <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane" id="tab-2">

                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Title</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Comments</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <span class="label label-primary"><i class="fa fa-check"></i> Completed</span>
                                        </td>
                                        <td>
                                            Create project in webapp
                                        </td>
                                        <td>
                                            12.07.2014 10:10:1
                                        </td>
                                        <td>
                                            14.07.2014 10:16:36
                                        </td>
                                        <td>
                                            <p class="small">
                                                Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label label-primary"><i class="fa fa-check"></i> Accepted</span>
                                        </td>
                                        <td>
                                            Various versions
                                        </td>
                                        <td>
                                            12.07.2014 10:10:1
                                        </td>
                                        <td>
                                            14.07.2014 10:16:36
                                        </td>
                                        <td>
                                            <p class="small">
                                                Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label label-primary"><i class="fa fa-check"></i> Sent</span>
                                        </td>
                                        <td>
                                            There are many variations
                                        </td>
                                        <td>
                                            12.07.2014 10:10:1
                                        </td>
                                        <td>
                                            14.07.2014 10:16:36
                                        </td>
                                        <td>
                                            <p class="small">
                                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which
                                            </p>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label label-primary"><i class="fa fa-check"></i> Reported</span>
                                        </td>
                                        <td>
                                            Latin words
                                        </td>
                                        <td>
                                            12.07.2014 10:10:1
                                        </td>
                                        <td>
                                            14.07.2014 10:16:36
                                        </td>
                                        <td>
                                            <p class="small">
                                                Latin words, combined with a handful of model sentence structures
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label label-primary"><i class="fa fa-check"></i> Accepted</span>
                                        </td>
                                        <td>
                                            The generated Lorem
                                        </td>
                                        <td>
                                            12.07.2014 10:10:1
                                        </td>
                                        <td>
                                            14.07.2014 10:16:36
                                        </td>
                                        <td>
                                            <p class="small">
                                                The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label label-primary"><i class="fa fa-check"></i> Sent</span>
                                        </td>
                                        <td>
                                            The first line
                                        </td>
                                        <td>
                                            12.07.2014 10:10:1
                                        </td>
                                        <td>
                                            14.07.2014 10:16:36
                                        </td>
                                        <td>
                                            <p class="small">
                                                The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                                            </p>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </content>

    <content tag="breadcrumbs">
    </content>

</g:applyLayout>
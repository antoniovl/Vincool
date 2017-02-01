<g:applyLayout name="simple">
    <content tag="head">
        <asset:javascript src="plugins/fullcalendar/moment.min.js"/>
        <asset:stylesheet href="plugins/fullcalendar/fullcalendar.css"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.min.js"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.print.css" media="print"/>
    </content>
    <content tag="boxTitle">
        Our Calendar
    </content>
    <content tag="boxContent">
        <div class="row animated fadeInDown">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <h2>Our Calendar</h2> Select the office location you are insterested in: <br/>
                        <br/><g:select name="office_selector" from="${offices}" optionKey="officeCode"
                                       optionValue="name"/>
                        <br/><br/> Click on each event to see details and enroll.
                    </div>
                </div>
            </div>
    <div class="col-lg-9">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div id="calendar"></div>
            </div>
        </div>
    </div>
    </div>

    <script>
        $(document).ready(function () {

            var calendar = $('#calendar');
            var officeSelector = $("#office_selector");

            <g:applyCodec encodeAs="none">
            var source = ${source};
            </g:applyCodec>

            officeSelector.change(function () {
                calendar.fullCalendar('removeEvents');
                calendar.fullCalendar('addEventSource', source[officeSelector.val()]);
            });

            calendar.fullCalendar({

                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: false,
                droppable: false,
                events: source[officeSelector.val()]

            });
        });
    </script>
    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>

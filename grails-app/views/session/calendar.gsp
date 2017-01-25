<!doctype html>
<html>

    <head>

        <meta name="layout" content="main"/>
        <title>Our Calendar</title>

        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

        <!-- Full Calendar -->
        <asset:javascript src="plugins/fullcalendar/moment.min.js"/>
        <asset:stylesheet href="plugins/fullcalendar/fullcalendar.css"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.min.js"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.print.css" media="print"/>

    </head>

    <body>

        <div class="row animated fadeInDown">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <h2>Our Calendar</h2> Select the office location you are insterested in and click in each class event to see details and enroll.
                    </div>
                </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Available Apprentice locations</h5>
                    </div>
                    <div class="ibox-content">
                        <div id='external-events'>
                            <p>Select an office.</p>
                            <g:select name="office_selector" from="${offices}" optionKey="id" optionValue="officeCode"/>
                        </div>
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

            $(document).ready(function() {

                /* initialize the calendar
                -----------------------------------------------------------------*/

                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    editable: false,
                    droppable: false,
                    <g:applyCodec encodeAs="none">
                        events: ${events},
                    </g:applyCodec>

                });

            });

        </script>

    </body>

</html>

package vincool

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.web.mapping.LinkGenerator

@Secured(['permitAll'])
class CalendarController {

    static defaultAction = "index"
    static allowedMethods = [index: "GET", detail: "GET"]

    private LinkGenerator grailsLinkGenerator
    def springSecurityService
    def roleUserService

    def index() {
        def events = Event.findAllByBatchInList(Batch.findAllByIsActive(true))
        def offices = Office.all

        def source = [:]
        offices.each { office ->
            source[office.officeCode] = [].withDefault{ [:] }
        }

        def eventsEnrolledMap = [:]
        if(roleUserService.isCurrentUserAStudent()) {
            def eventsEnrolled = Enrollment.findAllByAttendee(springSecurityService.getCurrentUser())
            eventsEnrolled.each { enrollment ->
                eventsEnrolledMap[enrollment.event] = enrollment.attendee;
            }
        }

        def color
        events.each{ event ->
            color = event.eventCategory.color
            if(eventsEnrolledMap[event] != null) { color = "gray" }
            source[event.office.officeCode]
                    .add([id: event.id,
                          title: event.eventCategory.subCategory,
                          start: event.date,
                          allDay: false,
                          color: color,
                          url: grailsLinkGenerator.link(controller: "calendar", action: "detail", id: event.id, absolute: true)])
        }

        [source: source as JSON, offices: offices]
    }

    def detail(Long id) {

        def event = Event.get(id)
        if (event == null) {
            redirect(action: "index")
        }

        def isEnrolled = false

        if(roleUserService.isCurrentUserAStudent()) {
            isEnrolled = Enrollment.findByAttendeeAndEvent(springSecurityService.getCurrentUser(), event) != null
        }

        [eventDetails: event, isEnrolled: isEnrolled]
    }

}

package vincool

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.web.mapping.LinkGenerator

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    static scaffold = Event
    static transient LinkGenerator grailsLinkGenerator

    def springSecurityService

    def calendar() {
        def offices = Office.all

        def source = [:]
        offices.each { office ->
            source[office.officeCode] = [].withDefault{ [:] }
        }

        def eventsEnrolledMap = [:]
        if(isCurrentUserAStudent()) {
            def eventsEnrolled = Enrollment.findAllByAttendee(springSecurityService.getCurrentUser())
            eventsEnrolled.each { enrollment ->
                eventsEnrolledMap[enrollment.event] = enrollment.attendee;
            }
        }

        def color
        def events = Event.findAllByBatchInList(Batch.findAllByIsActive(true))
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

        if(isCurrentUserAStudent()) {
            isEnrolled = Enrollment.findByAttendeeAndEvent(springSecurityService.getCurrentUser(), event) != null
        }

        [eventDetails: event, isEnrolled: isEnrolled]
    }

    private boolean isCurrentUserAStudent() {
        if (springSecurityService.isLoggedIn()) {
            def roles = springSecurityService.getPrincipal().getAuthorities()
            def rolesNames = roles.collect { it.getAuthority() }
            if (rolesNames.contains("ROLE_STUDENT")) { return true }
        }
        return false
    }
}


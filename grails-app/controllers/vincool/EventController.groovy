package vincool

import grails.converters.JSON
import grails.web.mapping.LinkGenerator
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    static scaffold = Event

    static transient LinkGenerator grailsLinkGenerator

    def springSecurityService

    def calendar() {
        def events = Event.findAllByBatchInList(Batch.findAllByIsActive(true))
        def offices = Office.all

        def source = [:]
        offices.each { office ->
            source[office.officeCode] = [].withDefault{ [:] }
        }
        events.each{ event ->
            source[event.office.officeCode]
                .add([id: event.id,
                      title: event.eventCategory.subCategory,
                      start: event.date,
                      allDay: false,
                      url: grailsLinkGenerator.link(controller: "event", action: "detail", id: event.id, absolute: true)])

        }

        [source: source as JSON, offices: offices]
    }

    def detail(Long id) {

        def event = Event.get(id)
        if (event == null) {
            redirect(action: "calendar")
        }

        def isEnrolled = false

        if(springSecurityService.isLoggedIn()) {
            def roles = springSecurityService.getPrincipal().getAuthorities()

            def rolesNames = roles.collect { it.getAuthority() }

            if(rolesNames.contains("ROLE_STUDENT")) {
                isEnrolled = Enrollment.findByAttendeeAndEvent(springSecurityService.getCurrentUser(), event) != null
            }
        }

        [eventDetails: event, isEnrolled: isEnrolled]
    }

}


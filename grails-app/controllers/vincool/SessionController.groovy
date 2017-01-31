package vincool

import grails.converters.JSON
import grails.web.mapping.LinkGenerator
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class SessionController {

    static scaffold = Session

    static transient LinkGenerator grailsLinkGenerator

    def springSecurityService

    def calendar() {
        def sessions = Session.findAllByBatchInList(Batch.findAllByIsActive(true))
        def offices = Office.all

        def source = [:]
        offices.each { office ->
            source[office.officeCode] = [].withDefault{ [:] }
        }

        def sessionsEnrolledMap = [:]
        if(isCurrentUserAStudent()) {
            def sessionsEnrolled = Enrollment.findAllByStudent(springSecurityService.getCurrentUser())
            sessionsEnrolled.each { session ->
                sessionsEnrolledMap[session.session] = session.student;
            }
        }

        def color
        sessions.each{ session ->
            color = "orange"
            if(sessionsEnrolledMap[session] != null) { color = "gray" }
            source[session.office.officeCode]
                .add([id: session.id,
                      title: session.lesson.topic,
                      start: session.date,
                      allDay: false,
                      color: color,
                      url: grailsLinkGenerator.link(controller: "session", action: "detail", id: session.id, absolute: true)])
        }

        [source: source as JSON, offices: offices]
    }

    def detail(Long id) {

        def session = Session.get(id)
        if (session == null) {
            redirect(action: "calendar")
        }

        def isEnrolled = false

        if(isCurrentUserAStudent()) {
            isEnrolled = Enrollment.findByStudentAndSession(springSecurityService.getCurrentUser(), session) != null
        }

        [sessionDetails: session, isEnrolled: isEnrolled]
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


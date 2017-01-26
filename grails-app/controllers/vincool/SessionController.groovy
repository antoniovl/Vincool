package vincool

import grails.converters.JSON
import grails.web.mapping.LinkGenerator
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SessionController {

    static scaffold = Session

    static transient LinkGenerator grailsLinkGenerator

    def calendar() {

        def sessions = Session.findAllByBatchInList(Batch.findAllByIsActive(true))
        def offices = Office.all

        def source = [:]
        offices.each { office ->
            source[office.officeCode] = [].withDefault{ [:] }
        }

        sessions.each{ session ->
            source[session.office.officeCode]
                .add([id: session.id,
                      title: session.lesson.topic,
                      start: session.date,
                      allDay: false,
                      url: grailsLinkGenerator.link(controller: "session", action: "detail", id: session.id, absolute: true)])

        }

        [source: source as JSON, offices: offices]
    }

    def detail(Long id) {
        def session = Session.get(id)

        if (session == null) {
            redirect(action: "calendar")
        }

        [sessionDetails: session]
    }

}


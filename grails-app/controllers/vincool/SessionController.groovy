package vincool

import grails.plugin.springsecurity.annotation.Secured

class SessionController {

    static scaffold = Session

    @Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
    def showCalendar() {
        render(view: "calendar")
    }

}

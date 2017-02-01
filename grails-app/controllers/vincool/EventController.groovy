package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    static scaffold = Event

}


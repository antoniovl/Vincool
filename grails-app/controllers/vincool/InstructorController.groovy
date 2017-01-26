package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class InstructorController {

    static scaffold = Instructor

}

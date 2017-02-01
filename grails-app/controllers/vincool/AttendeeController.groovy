package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AttendeeController {

    static scaffold = Attendee

    def springSecurityService
    def enrollmentService

    @Secured(['ROLE_STUDENT'])
    def enroll(Long id) {
        def student = (Attendee) springSecurityService.currentUser
        enrollmentService.enroll(student.id, id, false)
        redirect(controller: "calendar", action: "detail", id: id)
    }

    @Secured(['ROLE_STUDENT'])
    def disenroll(Long id) {
        def student = (Attendee) springSecurityService.currentUser
        enrollmentService.disenroll(student.id, id)
        redirect(controller: "calendar", action: "detail", id: id)
    }

}

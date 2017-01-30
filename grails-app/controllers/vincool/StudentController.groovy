package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StudentController {

    static scaffold = Student

    def springSecurityService
    def enrollmentService

    @Secured(['ROLE_STUDENT'])
    def enroll(Long id) {
        def student = (Student) springSecurityService.currentUser
        enrollmentService.enroll(student.id, id)
        redirect(controller: "session", action: "detail", id: id)
    }

    @Secured(['ROLE_STUDENT'])
    def disenroll(Long id) {
        def student = (Student) springSecurityService.currentUser
        enrollmentService.disenroll(student.id, id)
        redirect(controller: "session", action: "detail", id: id)
    }

}

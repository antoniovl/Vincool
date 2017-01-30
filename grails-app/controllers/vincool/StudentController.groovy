package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StudentController {

    static scaffold = Student

    def springSecurityService

    @Secured(['ROLE_STUDENT'])
    def enroll(Long id) {
        def student = (Student) springSecurityService.currentUser
        new Enrollment(student: student, session: Session.findById(id), attendance: false).save(flush: true)
        redirect(controller: "session", action: "calendar")
    }

}

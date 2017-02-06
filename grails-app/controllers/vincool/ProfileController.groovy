package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
class ProfileController {

    static allowedMethods = [index: "GET", update: "PUT"]
    def springSecurityService
    def roleUserService

    def index() {

        def user
        def userId = springSecurityService.getCurrentUserId()

        if (roleUserService.isCurrentUserAnAttendee()) {
            user = Attendee.findById(userId)
        } else if (roleUserService.isCurrentUserAInstructor()) {
            user = Instructor.findById(userId)
        } else {
            user = SecUser.findById(userId)
        }

        [user: user]
    }

    def update() {
        def user
        def userId = springSecurityService.getCurrentUserId()

        if (roleUserService.isCurrentUserAnAttendee()) {

            user = Attendee.findById(userId)

            if (params.name) {
                user.name = params.name as String
            }
            if (params.school) {
                user.school = params.school as String
            }
            if (params.currentCompany) {
                user.currentCompany = params.currentCompany as String
            }
            if (params.description) {
                user.description = params.description as String
            }

        } else if (roleUserService.isCurrentUserAInstructor()) {

            user = Instructor.findById(userId)
            if (params.name) {
                user.name = params.name as String
            }

        } else {

            user = SecUser.findById(userId)
        }

        user.save(flush: true)
        redirect(action: "index")
    }

}

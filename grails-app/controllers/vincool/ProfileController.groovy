package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
class ProfileController {

    static allowedMethods = [update: "PATCH", index: "GET"]
    def springSecurityService
    def roleUserService

    def index() {

        def user
        def userId = springSecurityService.getCurrentUserId()

        if(roleUserService.isCurrentUserAStudent()) {
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

        if(roleUserService.isCurrentUserAStudent()) {

            user = Attendee.findById(userId)

            if(params.name != ""){ user.setName((String)params.name) }
            if(params.school != ""){ user.setName((String)params.school) }
            if(params.currentCompany != ""){ user.setName((String)params.currentCompany) }
            if(params.description != ""){ user.setName((String)params.description) }

        } else if (roleUserService.isCurrentUserAInstructor()) {

            user = Instructor.findById(userId)
            if(params.name != ""){ user.setName((String)params.name) }

        } else {

            user = SecUser.findById(userId)
        }

        user.save(flush: true)
        redirect(action: "index")
    }

}

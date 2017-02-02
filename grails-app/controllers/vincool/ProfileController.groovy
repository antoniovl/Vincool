package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
class ProfileController {

    static allowedMethods = [update: "PATCH", index: "GET"]
    def springSecurityService

    def index() {

        def user
        def userId = springSecurityService.getCurrentUserId()

        if(isCurrentUserAStudent()) {
            user = Attendee.findById(userId)
        } else if (isCurrentUserAInstructor()) {
            user = Instructor.findById(userId)
        } else {
            user = SecUser.findById(userId)
        }

        [user: user]
    }

    def update() {
        def user
        def userId = springSecurityService.getCurrentUserId()

        if(isCurrentUserAStudent()) {

            user = Attendee.findById(userId)

            if(params.name != ""){ user.setName((String)params.name) }
            if(params.school != ""){ user.setName((String)params.school) }
            if(params.currentCompany != ""){ user.setName((String)params.currentCompany) }
            if(params.description != ""){ user.setName((String)params.description) }

        } else if (isCurrentUserAInstructor()) {

            user = Instructor.findById(userId)
            if(params.name != ""){ user.setName((String)params.name) }

        } else {

            user = SecUser.findById(userId)
        }

        user.save(flush: true)
        redirect(action: "index")
    }

    private String getRoles() {
        if (springSecurityService.isLoggedIn()) {
            def roles = springSecurityService.getPrincipal().getAuthorities()
            return roles.collect { it.getAuthority() }
        }
    }

    private boolean isCurrentUserAStudent() {
        return getRoles().contains("ROLE_STUDENT")
    }

    private boolean isCurrentUserAnAdmin() {
        return getRoles().contains("ROLE_ADMIN")
    }

    private boolean isCurrentUserAInstructor() {
        return getRoles().contains("ROLE_INSTRUCTOR")
    }

}

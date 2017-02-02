package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
class ProfileController {

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

    def update() { }

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

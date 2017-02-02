package vincool

import grails.transaction.Transactional

@Transactional
class RoleUserService {

    def springSecurityService

    private String getRoles() {
        if (springSecurityService.isLoggedIn()) {
            def roles = springSecurityService.getPrincipal().getAuthorities()
            return roles.collect { it.getAuthority() }
        }
    }

    boolean isCurrentUserAStudent() {
        return getRoles().contains("ROLE_STUDENT")
    }

    boolean isCurrentUserAnAdmin() {
        return getRoles().contains("ROLE_ADMIN")
    }

    boolean isCurrentUserAInstructor() {
        return getRoles().contains("ROLE_INSTRUCTOR")
    }

}

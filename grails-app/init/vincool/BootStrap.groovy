package vincool

import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole

class BootStrap {

    def init = { servletContext ->
        new SecRole("ROLE_STUDENT").save(flush: true)
        new SecRole("ROLE_INSTRUCTOR").save(flush: true)
        def secRole = new SecRole("ROLE_ADMIN").save(flush: true)
        def secUser = new SecUser("PedroAdmin", "12345abcd" ).save(flush: true)
        SecUserSecRole.create (secUser, secRole)
    }
    def destroy = {
    }
}

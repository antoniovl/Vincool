package vincool

import vincool.auth.SecUser

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SecUserController {
    static scaffold = SecUser

}

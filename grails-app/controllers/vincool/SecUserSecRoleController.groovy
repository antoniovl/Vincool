package vincool

import vincool.auth.SecUserSecRole
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SecUserSecRoleController {

    static scaffold = SecUserSecRole
}

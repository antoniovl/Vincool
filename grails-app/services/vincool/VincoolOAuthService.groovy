package vincool

import grails.transaction.Transactional
import vincool.auth.OAuthID
import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole

@Transactional
class VincoolOAuthService {

    def createUser(String socialID, providerName, password) {

        def user
        def secRole

        if (socialID.endsWith("@nearsoft.com")) {
            secRole = SecRole.findByAuthority("ROLE_INSTRUCTOR")
            user =  new Instructor()
        }else{
            secRole = SecRole.findByAuthority("ROLE_STUDENT")
            user = new Student()
        }
        user.email = socialID
        user.username = socialID
        user.password= password

        def oAuthID = new OAuthID()
        oAuthID.provider = providerName
        oAuthID.accessToken = socialID
        oAuthID.save(flush: true)

        user.addTooAuthIDs(oAuthID)
        user.save(flush: true)

        def secUserSecRole = new SecUserSecRole( user, secRole)
        secUserSecRole.save(flush: true)

        return user
    }
}

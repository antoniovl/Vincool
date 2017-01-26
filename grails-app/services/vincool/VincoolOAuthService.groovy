package vincool

import grails.transaction.Transactional
import vincool.auth.OAuthID
import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole

@Transactional
class VincoolOAuthService {

    def createUser(String socialID, providerName) {

        def user
        def secRole

        if (socialID.endsWith("@nearsoft.com")) {
            secRole = SecRole.findByAuthority("ROLE_INSTRUCTOR")
            user =  new Instructor()
        }else{
            secRole = SecRole.findByAuthority("ROLE_STUDENT")
            user = new Student()
        }
        user.setEmail(socialID)

        def oAuthID = new OAuthID()
        oAuthID.provider = providerName
        oAuthID.accessToken = socialID
        oAuthID.save(flush: true)

        def secUser = new SecUser( socialID, socialID )
        secUser.addTooAuthIDs(oAuthID)
        secUser.save(flush: true)

        def secUserSecRole = new SecUserSecRole( secUser, secRole)
        secUserSecRole.save(flush: true)

        return secUser
    }
}

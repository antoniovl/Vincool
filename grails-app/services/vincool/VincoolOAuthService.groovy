package vincool

import grails.transaction.Transactional
import vincool.auth.OAuthID
import vincool.auth.SecRole
import vincool.auth.SecUserSecRole

@Transactional
class VincoolOAuthService {

    def grailsApplication

    def createUser(String socialID, providerName, password) {

        def user
        def secRole

        if (socialID.endsWith(grailsApplication.config.vincool.instructorDomain)) {
            secRole = SecRole.findByAuthority("ROLE_INSTRUCTOR")
            user =  new Instructor()
        }else{
            secRole = SecRole.findByAuthority("ROLE_STUDENT")
            user = new Attendee()
        }
        user.email = socialID
        user.username = socialID
        user.password= password

        def oAuthID = new OAuthID()
        oAuthID.provider = providerName
        oAuthID.accessToken = socialID

        user.addTooAuthIDs(oAuthID)
        user.save(flush: true, failOnError: true)

        def secUserSecRole = new SecUserSecRole( user, secRole)
        secUserSecRole.save(flush: true, failOnError: true)

        return user
    }
}
package vincool

import grails.transaction.Transactional
import org.springframework.social.google.api.userinfo.GoogleUserInfo
import vincool.auth.OAuthID
import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole

@Transactional
class VincoolOAuthService {

    def grailsApplication

    def createUser(GoogleUserInfo userInfo, providerName, accesToken) {

        def user
        def secRole

        if (userInfo.email.endsWith(grailsApplication.config.vincool.instructorDomain)) {
            secRole = SecRole.findByAuthority("ROLE_INSTRUCTOR")
            user =  new Instructor()
        }else{
            secRole = SecRole.findByAuthority("ROLE_STUDENT")
            user = new Student()
        }

        user.username = userInfo.email
        user.password= accesToken
        user.name = userInfo.name
        user.email = userInfo.email
        user.gender = userInfo.gender
        user.lastName = userInfo.lastName
        user.firstName = userInfo.firstName
        user.profilePictureUrl = userInfo.profilePictureUrl

        def oAuthID = new OAuthID()
        oAuthID.provider = providerName
        oAuthID.accessToken = userInfo.email

        user.addTooAuthIDs(oAuthID)
        user.save(flush: true, failOnError: true)

        def secUserSecRole = new SecUserSecRole( user, secRole)
        secUserSecRole.save(flush: true, failOnError: true)

        return user
    }
}

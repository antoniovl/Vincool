package vincool

import grails.plugin.springsecurity.oauth2.token.OAuth2SpringToken
import org.springframework.security.core.context.SecurityContextHolder
import vincool.auth.SecUser

class LoginController {

    public static final String SPRING_SECURITY_OAUTH_TOKEN = 'springSecurityOAuthToken'

    def springSecurityOauth2BaseService
    def vincoolOAuthService

    def index(){
        render(view: "login")
    }

    def signin(){

        OAuth2SpringToken token = (OAuth2SpringToken) session[SPRING_SECURITY_OAUTH_TOKEN]

        def user = vincoolOAuthService.createUser( token.socialId, token.providerName )
        springSecurityOauth2BaseService.updateOAuthToken(token, user)
        session.removeAttribute SPRING_SECURITY_OAUTH_TOKEN
        SecurityContextHolder.context.authentication = token

        redirect(controller: "session", action: "calendar")
    }
}

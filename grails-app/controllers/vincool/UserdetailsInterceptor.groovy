package vincool


class UserdetailsInterceptor {

    UserdetailsInterceptor() {
        matchAll()
    }
    def springSecurityService

    boolean before() {
        def currentUser = springSecurityService.getCurrentUser()
        if(currentUser) {
            session.userDetails = currentUser
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}

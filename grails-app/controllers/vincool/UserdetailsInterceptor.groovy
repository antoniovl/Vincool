package vincool


class UserdetailsInterceptor {

    UserdetailsInterceptor() {
        matchAll()
    }
    def springSecurityService

    boolean before() {
        def currentUser = springSecurityService.getCurrentUser()
        if(currentUser) {
            if(currentUser.properties["profilePictureUrl"]) {
                session.profilePictureUrl = currentUser.profilePictureUrl
            } else {
                session.profilePictureUrl = '/assets/profile_small.jpg';
            }
            if(currentUser.properties["name"]) {
                session.name = currentUser.name
            } else {
                session.name = 'Admin'
            }
            session.userDetails = currentUser
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}

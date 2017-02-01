package vincool

class HomeController {
    def springSecurityService

    def index() {
        if (springSecurityService.isLoggedIn()) {
            render(view: "index")
        } else {
            render(view: "/landing")
        }
    }
}

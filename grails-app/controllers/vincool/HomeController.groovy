package vincool

class HomeController {
    def roleUserService

    def index() {
        if (roleUserService.isCurrentUserAStudent()) {
            forward controller: "event"
        } else if (roleUserService.isCurrentUserAInstructor()) {
            forward controller: "event"
        } else if (roleUserService.isCurrentUserAnAdmin()) {
            render(view: "index")
        } else {
            render(view: "/landing")
        }

    }
}

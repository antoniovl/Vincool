package vincool

class SessionController {

    static scaffold = Session

    def showCalendar() {
        def all = Session.all
        def sessions = {
            def hobbies = ["basketball", "photography"]
        }
        render(view: "calendar", model: [name: "Maricel"])
    }

}

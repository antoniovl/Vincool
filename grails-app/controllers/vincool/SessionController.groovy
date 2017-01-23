package vincool

class SessionController {

    static scaffold = Session

    def showCalendar() {
        render(view: "calendar")
    }

}

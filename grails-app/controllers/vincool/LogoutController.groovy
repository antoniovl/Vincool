package vincool

class LogoutController {

    def index(){
        session.invalidate()
        redirect(uri:'/')
    }
}

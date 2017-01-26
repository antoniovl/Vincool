package vincool

import vincool.auth.SecUser

class Instructor extends SecUser{

    String name
    String email

    static constraints = {
        name blank: true
    }

    static mapping = {
        version false
    }
}

package vincool

import vincool.auth.SecUser

class Instructor extends SecUser{

    String name
    String email

    static constraints = {
        name blank: true, nullable: true
        email()
    }

    static mapping = {
        version false
    }

    String toString(){
        name
    }
}

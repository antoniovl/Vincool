package vincool

import vincool.auth.SecUser

class Instructor extends SecUser{

    static constraints = {

    }

    static mapping = {
        version false
    }

    String toString(){
        name
    }

}

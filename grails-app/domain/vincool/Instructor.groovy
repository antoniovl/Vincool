package vincool

import vincool.auth.SecUser

class Instructor extends SecUser{

    String name
    String email
    String gender
    String firstName
    String lastName
    String profilePictureUrl

    static constraints = {
        name blank: true, nullable: true
        gender nullable: true
        firstName nullable: true
        lastName nullable: true
        profilePictureUrl nullable: true
        email()
    }

    static mapping = {
        version false
    }

    String toString(){
        name
    }
}

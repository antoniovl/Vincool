package vincool

import vincool.auth.SecUser

class Attendee extends SecUser{

    Integer age
    String name
    String gender
    String school
    String currentCompany
    String description
    String email
    String firstName
    String lastName
    String profilePictureUrl


    static constraints = {
        name blank: true, nullable: true
        age blank: true, min: 0, nullable: true
        school blank: true, nullable: true
        currentCompany blank: true, nullable: true
        email email: true, blank: false
        gender nullable: true
        firstName nullable: true
        lastName nullable: true
        profilePictureUrl nullable: true
        description blank: true, nullable: true
    }

    static mapping = {
        version false
    }
    String toString(){
        name
    }
}

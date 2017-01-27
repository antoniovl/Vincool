package vincool

import vincool.auth.SecUser

class Student extends SecUser{

    String name
    Integer age
    String school
    String currentCompany
    String email

    static constraints = {
        name blank: true, nullable: true
        age blank: true, min: 0, nullable: true
        school blank: true, nullable: true
        currentCompany blank: true, nullable: true
        email email: true, blank: false
    }

    static mapping = {
        version false
    }
    String toString(){
        name
    }
}

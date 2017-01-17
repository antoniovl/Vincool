package vincool

class Student {

    String name
    Integer age
    String school
    String currentCompany
    String email

    static constraints = {
        name blank: false
        age blank: false, min: 0
        school blank: false
        currentCompany blank: true, nullable: true
        email email: true, blank: false
    }

    static mapping = {
        version false
    }
}

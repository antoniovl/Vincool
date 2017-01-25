package vincool

class Enrollment {

    Student student
    Session session
    boolean attendance

    static constraints = {
        student unique: 'session'
    }

    static mapping = {
        version false
    }
}

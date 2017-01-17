package vincool

class Assistance {

    Student student
    Session session

    static constraints = {
        student unique: 'session'
    }

    static mapping = {
        version false
    }
}

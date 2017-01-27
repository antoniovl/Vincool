package vincool

class Enrollment {

    Student student
    Session session
    boolean attendance

    static constraints = {
        student unique: 'session'
        session()
        attendance()
    }

    static mapping = {
        version false
    }

    String toString(){
        "" + student + " : "+session +" : "+session?.lesson
    }
}

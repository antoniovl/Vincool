package vincool

class Session {

    enum Type {
        PRACTICAL, THEORETICAL
    }

    Type type
    Date date
    Lesson lesson
    Instructor instructor
    Office office
    Resources resources

    static constraints = {
    }

    static mapping = {
        version false
    }
}

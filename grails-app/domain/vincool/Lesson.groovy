package vincool

class Lesson {

    String topic
    String description

    static constraints = {
        topic blank: false
        description blank: false
    }

    static mapping = {
        version false
    }
}

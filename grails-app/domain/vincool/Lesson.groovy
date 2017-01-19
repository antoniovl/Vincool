package vincool

class Lesson {

    String topic
    String description

    static belongsTo = [syllabus: Syllabus]

    static constraints = {
        topic blank: false
        description blank: false
    }

    static mapping = {
        version false
    }
}

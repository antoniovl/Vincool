package vincool

class Lesson {

    String topic
    String description

    static hasMany = [resources: Resource]

    static belongsTo = [session: Session]

    static constraints = {
        topic blank: false
        description blank: false
    }

    static mapping = {
        version false
    }
}

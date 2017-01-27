package vincool

class Lesson {

    String topic
    String description

    static hasMany = [resources: Resource]

    static constraints = {
        topic blank: false
        description blank: false
    }

    static mapping = {
        version false
    }
    String toString(){
        topic
    }
}

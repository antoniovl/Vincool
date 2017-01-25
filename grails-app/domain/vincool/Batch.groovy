package vincool

class Batch {

    //TODO add active attribute to mark syllabus as deprecated

    String edition
    Boolean isActive

    static hasMany = [sessions : Session]

    static constraints = {
        edition blank: false, unique: true
    }

    static mapping = {
        version false
    }
}

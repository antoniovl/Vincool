package vincool

class Batch {

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

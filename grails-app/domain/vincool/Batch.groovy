package vincool

class Batch {

    String edition
    Boolean isActive

    static hasMany = [sessions : Session]

    static constraints = {
        edition blank: false, unique: true
        isActive()
    }

    static mapping = {
        version false
    }

    String toString(){
        edition
    }
}

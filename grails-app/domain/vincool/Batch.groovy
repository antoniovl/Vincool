package vincool

class Batch {

    String edition
    Boolean isActive

    static hasMany = [sessions : Event]

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

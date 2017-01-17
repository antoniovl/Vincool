package vincool

class Instructor {

    String name

    static constraints = {
        name blank: false
    }

    static mapping = {
        version false
    }
}

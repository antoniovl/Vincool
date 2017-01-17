package vincool

class Resources {

    String slides
    String repo

    static constraints = {
        slides url: true, blank: false
        repo url: true, blank: false
    }

    static mapping = {
        version false
    }
}

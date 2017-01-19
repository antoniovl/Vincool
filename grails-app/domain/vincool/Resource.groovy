package vincool

class Resource {

    String url
    String description

    static constraints = {
        url url: true, blank: false
        description blank: false
    }

    static mapping = {
        version false
    }
}

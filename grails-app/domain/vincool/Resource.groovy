package vincool

class Resource {

    String name
    String url
    String description

    static belongsTo = [event: Event]

    static constraints = {
        name(blank: false)
        url url: true, blank: false
        description blank: false
    }

    static mapping = {
        version false
    }

    String toString(){
        name
    }
}

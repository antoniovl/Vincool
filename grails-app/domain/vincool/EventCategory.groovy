package vincool

class EventCategory {

    enum Category {
        APPRENTICE,
        MEETUP,
        WORKSHOP
    }

    Category category
    String subCategory
    String color

    static constraints = {
        subCategory blank: false
        color blank: false
    }

    static mapping = {
        version false
    }
    String toString(){
        category
    }
}

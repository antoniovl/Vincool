package vincool

class Enrollment {

    Attendee attendee
    Event event
    boolean attendance

    static constraints = {
        attendee unique: 'event'
        event()
        attendance()
    }

    static mapping = {
        version false
    }

    String toString(){
        "" + attendee + " : "+event +" : "+event?.eventCategory
    }
}

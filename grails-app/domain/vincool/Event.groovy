package vincool

import org.joda.time.LocalDate
import org.joda.time.LocalTime

class Event {

    String type
    LocalDate date
    LocalTime time
    Instructor instructor
    Office office
    EventCategory eventCategory
    String description

    static hasMany = [resources: Resource]
    static belongsTo = [batch: Batch]

    static constraints = {
        eventCategory()
        instructor()
        date()
        time()
        type()
        office()
    }

    static mapping = {
        version false
    }

    String toString(){
        description
    }
}

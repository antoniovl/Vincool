package vincool

import org.joda.time.LocalDate
import org.joda.time.LocalTime

class Session {

    enum Type {
        PRACTICAL, THEORETICAL
    }

    Type type
    LocalDate date
    LocalTime time
    Lesson lesson
    Instructor instructor
    Office office

    static constraints = {
    }

    static mapping = {
        version false
    }
}

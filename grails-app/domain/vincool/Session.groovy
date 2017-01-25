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
    Instructor instructor
    Office office

    static hasMany = [lessons: Lesson]

    static belongsTo = [batch: Batch]

    static constraints = {
    }

    static mapping = {
        version false
    }
}

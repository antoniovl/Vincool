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
    Lesson lesson

    static belongsTo = [batch: Batch]

    static constraints = {
        lesson()
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
        type
    }
}

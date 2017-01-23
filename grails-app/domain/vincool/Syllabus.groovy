package vincool

class Syllabus {

    String edition
    static hasMany = [lessons : Lesson]

    static constraints = {
        edition blank: false, unique: true
    }

    static mapping = {
        version false
    }
}

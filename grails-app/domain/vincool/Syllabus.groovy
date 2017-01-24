package vincool

class Syllabus {

    //TODO add active attribute to mark syllabus as deprecated

    String edition
    static hasMany = [lessons : Lesson]

    static constraints = {
        edition blank: false, unique: true
    }

    static mapping = {
        version false
    }
}

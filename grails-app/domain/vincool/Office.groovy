package vincool

class Office {

    String officeCode
    String location
    String phoneNumber

    static constraints = {
        officeCode blank: false, unique: true
        location blank: false
        phoneNumber blank: false
    }

    static mapping = {
        version false
    }
}

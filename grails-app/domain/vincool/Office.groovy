package vincool

class Office {

    String officeCode
    String location
    String phoneNumber

    static constraints = {
        officeCode blank: false, unique: true
        phoneNumber blank: false
        location blank: false
    }

    static mapping = {
        version false
    }

    String toString(){
        officeCode
    }
}

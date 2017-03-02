package vincool

import vincool.auth.SecUser

class Notification {

    String message
    SecUser user
    Boolean seen

    static mapping = {
        seen defaultValue: false
    }
}
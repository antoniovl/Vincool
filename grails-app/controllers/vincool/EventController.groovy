package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    def springSecurityService
    static scaffold = Event

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
    def index() {
        def userDetails = session.userDetails
        def events, eventCount
        if (userDetails instanceof Attendee) {
            events = Event.createCriteria().list(params) {
                enrollments {
                    attendee {
                        eq('id', userDetails.id)
                    }
                }
            }
            eventCount = Event.createCriteria().count() {
                enrollments {
                    attendee {
                        eq('id', userDetails.id)
                    }
                }
            }
        } else if (userDetails instanceof Instructor) {
            events = Event.findAllByInstructor(userDetails, params)
            eventCount = Event.countByInstructor(userDetails, params)
        } else if (userDetails instanceof SecUser) {
            events = Event.list(params)
            eventCount = Event.count()
        }
        respond events, model: [eventCount: eventCount]
    }

}


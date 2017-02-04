package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    def roleUserService
    static scaffold = Event

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
    def index() {
        def userDetails = session.userDetails
        def events, eventCount

        if (roleUserService.isCurrentUserAnAdmin()) {
            events = Event.list(params)
            eventCount = Event.count()
        } else if (roleUserService.isCurrentUserAInstructor()) {
            events = Event.findAllByInstructor(userDetails, params)
            eventCount = Event.countByInstructor(userDetails, params)
        } else if (roleUserService.isCurrentUserAStudent()) {

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
        }
        respond events, model: [eventCount: eventCount]
    }

}


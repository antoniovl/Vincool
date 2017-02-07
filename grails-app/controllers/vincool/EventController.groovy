package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    def springSecurityService
    def roleUserService
    static scaffold = Event

    final MAX_ATTENDEES_PICTURES = 5

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
        } else if (roleUserService.isCurrentUserAnAttendee()) {

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

    @Secured(['permitAll'])
    def show(Long id) {

        def event = Event.get(id)
        def view = "detail"

        if (!springSecurityService.loggedIn) {

            if (event == null) {
                redirect(controller: "calendar", action: "index")
            }

            render([view: "detail", model: [event: event, isEnrolled: false]])

        } else if (roleUserService.currentUserAnAttendee) {

            if (event == null) {
                redirect(controller: "calendar", action: "index")
            }

            def isEnrolled = Enrollment.findByAttendeeAndEvent(springSecurityService.currentUser, event) != null

            render([view: "detail", model: [event: event, isEnrolled: isEnrolled]])

        } else {

            if (event == null) {
                redirect(action: "index")
            }

            def enrollments = Enrollment.findAllByEvent(event)
            def attendeesPictures = enrollments.take(MAX_ATTENDEES_PICTURES).collect { it.attendee.profilePictureUrl }
            def assistance = 0

            for (enrollment in enrollments) {
                if(enrollment.attendance) {
                    assistance++
                }
            }

            def assistancePercentage = 0
            if (!enrollments.isEmpty()){
                assistancePercentage = ((assistance/enrollments.size())*100).intValue()
            }

            def eventDetails = [attendeesPictures: attendeesPictures, assistancePercentage: assistancePercentage]
            render([view: "show", model: [event: event, eventDetails: eventDetails]])
        }

    }

}


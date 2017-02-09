package vincool

import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController {

    def springSecurityService
    def roleUserService
    def assetResourceLocator
    static scaffold = Event

    final MAX_ATTENDEES_PICTURES = 10

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

    def resource(Long id) {

        def event = Event.findById(id)
        render([view: "resource", model: [event: event]])
        /*if (roleUserService.currentUserAInstructor) {
            def instructorEvents = Event.findAllByInstructor(springSecurityService.currentUser)
            def event = Event.findById(id)
            print("HOLA: " + instructorEvents)
            if (instructorEvents.contains(event)) {
                ownsEvent = true
                print("WTF ---------- ")
            }
            return
        }
        redirect(controller: "resource", action: "create")*/
    }

    @Secured(['permitAll'])
    def show(Long id) {

        def event = Event.get(id)
        def view = "detail"

        if (!springSecurityService.loggedIn) {

            if (event == null) {
                redirect(controller: "calendar", action: "index")
                return
            }

            render([view: "detail", model: [event: event, isEnrolled: false]])

        } else if (roleUserService.currentUserAnAttendee) {

            if (event == null) {
                redirect(controller: "calendar", action: "index")
                return
            }

            def isEnrolled = Enrollment.findByAttendeeAndEvent(springSecurityService.currentUser, event) != null

            render([view: "detail", model: [event: event, isEnrolled: isEnrolled]])

        } else {

            if (event == null) {
                redirect(action: "index")
                return
            }

            def ownsEvent = true
            if (roleUserService.currentUserAInstructor) {
                def instructorEvents = Event.findAllByInstructor(springSecurityService.currentUser)
                if (!instructorEvents.contains(event)) {
                    ownsEvent = false
                }
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
                assistancePercentage = ((assistance / enrollments.size()) * 100).intValue()
            }

            def eventDetails = [enrollments: enrollments,
                                attendeesPictures: attendeesPictures,
                                assistancePercentage: assistancePercentage,
                                ownsEvent: ownsEvent]
            render([view: "show", model: [event: event, eventDetails: eventDetails]])
        }

    }

}


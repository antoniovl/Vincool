package vincool

import grails.transaction.Transactional

@Transactional
class EnrollmentService {

    def enroll(Long attendeeId, Long eventId, boolean attendance) {

        def attendee = Attendee.findById(attendeeId)
        def event = Event.findById(eventId)

        if(Enrollment.findByAttendeeAndEvent(attendee, event) == null) {
            new Enrollment(attendee: attendee, event: event, attendance: attendance).save(flush: true, failOnError: true)
        }
    }

    def disenroll(Long attendeeId, Long eventId) {

        def attendee = Attendee.findById(attendeeId)
        def event = Event.findById(eventId)

        def enrollment = Enrollment.findByAttendeeAndEvent(attendee, event)
        if(enrollment != null) {
            enrollment.delete(flush: true, failOnError: true)
        }
    }
}

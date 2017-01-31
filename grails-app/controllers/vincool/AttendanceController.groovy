package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AttendanceController {

    static scaffold = Enrollment
    static allowedMethods = [get: "GET", save: "POST", enrollAttendee: "POST", enroll: "GET"]
    def enrollmentService

    def get(Long id) {

        def event = Event.findById(id)
        def enrollments = Enrollment.findAllByEvent(event)

        render(view: "attendance", model: [enrollments: enrollments, eventName: event.eventCategory.subCategory, eventId: event.id])
    }

    def save(Long id) {

        def event = Event.findById(id)
        def enrollments = Enrollment.findAllByEvent(event)

        for (enrollment in enrollments) {
            enrollment.attendance = params["attendance_${enrollment.attendee.id}"] == 'on'
            enrollment.save(flush: true)
        }

        redirect(action: "get", id: id)

    }

    def enroll(Long id) {
        def event = Event.findById(id)

        def notEnrolled = Attendee.createCriteria().list {
            sqlRestriction(" not exists(select 1 from enrollment e where e.attendee_id = this_.id)")
        }

        render(view: "enroll-new", model: [attendees: notEnrolled, eventName: event.eventCategory.subCategory, eventId: event.id])

    }

    def enrollAttendee(Long id) {
        def studentId = Long.parseLong(params["studentId"])

        enrollmentService.enroll(studentId, id, true)

        redirect(action: "enroll", id: id)

    }


}


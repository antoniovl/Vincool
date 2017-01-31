package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AttendanceController {

    static scaffold = Enrollment
    static allowedMethods = [get: "GET", save: "POST", enrollStudent: "POST", enroll: "GET"]
    def enrollmentService

    def get(Long id) {

        def session = Session.findById(id)
        def enrollments = Enrollment.findAllBySession(session)

        render(view: "attendance", model: [enrollments: enrollments, sessionName: session.lesson.topic, sessionId: session.id])
    }

    def save(Long id) {

        def session = Session.findById(id)
        def enrollments = Enrollment.findAllBySession(session)

        for (enrollment in enrollments) {
            enrollment.attendance = params["attendance_${enrollment.student.id}"] == 'on'
            enrollment.save(flush: true)
        }

        redirect(action: "get", id: id)

    }

    def enroll(Long id) {
        def session = Session.findById(id)

        def notEnrolled = Student.createCriteria().list {
            sqlRestriction(" not exists(select 1 from enrollment e where e.student_id = this_.id)")
        }

        render(view: "enroll-new", model: [students: notEnrolled, sessionName: session.lesson.topic, sessionId: session.id])

    }

    def enrollStudent(Long id) {
        def studentId = Long.parseLong(params["studentId"])

        enrollmentService.enroll(studentId, id, true)

        redirect(action: "enroll", id: id)

    }


}


package vincool

class AttendanceController {

    static scaffold = Enrollment
    static allowedMethods = [get: "GET", save: "POST"]

    def get(Long id) {

        def session = Session.findById(id)
        def enrollments = Enrollment.findAllBySession(session)

        render(view: "attendance", model: [enrollments: enrollments, sessionName: session.lesson.topic, sessionId: session.id])
    }

    def save(Long id) {

        def session = Session.findById(id)
        def enrollments = Enrollment.findAllBySession(session)


        for(enrollment in enrollments) {
            enrollment.attendance = params["attendance_${enrollment.student.id}"] == 'on'
            enrollment.save(flush: true)
        }

        redirect(action: "get", id: id)

    }
}


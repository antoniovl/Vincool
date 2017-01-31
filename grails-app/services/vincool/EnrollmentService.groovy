package vincool

import grails.transaction.Transactional

@Transactional
class EnrollmentService {

    def enroll(Long studentId, Long sessionId, boolean attendance) {

        def student = Student.findById(studentId)
        def session = Session.findById(sessionId)

        if(Enrollment.findByStudentAndSession(student, session) == null) {
            new Enrollment(student: student, session: session, attendance: attendance).save(flush: true, failOnError: true)
        }
    }

    def disenroll(Long studentId, Long sessionId) {

        def student = Student.findById(studentId)
        def session = Session.findById(sessionId)

        def enrollment = Enrollment.findByStudentAndSession(student, session)
        if(enrollment != null) {
            enrollment.delete(flush: true, failOnError: true)
        }
    }
}

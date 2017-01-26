package vincool

import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class BootStrap {

    def init = { servletContext ->
        new
                SecRole("ROLE_STUDENT").save(flush: true)
        new SecRole("ROLE_INSTRUCTOR").save(flush: true)
        def secRole = new SecRole("ROLE_ADMIN").save(flush: true)
        def secUser = new SecUser("PedroAdmin", "12345abcd" ).save(flush: true)
        SecUserSecRole.create (secUser, secRole)

        new Student(name: "Luis Daniel", age: 22, school: "ESCOM", currentCompany: "Nearsoft", email: "lalducin@nearsoft.com").save()
        new Student(name: "Erick Reyna", age: 23, school: "UPVT", currentCompany: "Nearsoft", email: "ereyna@nearsoft.com").save()

        new Office(officeCode: "CDMX", location: "San Luis Potosí 196 int. 401 Col. Roma Norte Del. Cuauhtémoc Ciudad de México 06700", phoneNumber:  "+52 (55) 6388-6650").save()
        new Office(officeCode: "HMO", location: "Blvd. Antonio Quiroga 21 Col. El Llano Hermosillo, Sonora, México 83210", phoneNumber:  "+52 (662) 216-7401").save()

        new Instructor(name: "Israel Gómez").save()

        new Batch(edition: "Apprentice CDMX 2016 B", isActive: false).save()
        new Lesson(topic: "Introductory Topics", description: "VCS and C, C++, Java").save()
        new Lesson(topic: "Data Structures and Big O Notation ", description: "Arrays, lists and sets").save()
        new Lesson(topic: "SOLID I", description: "Single Responsibility Principle").save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2016-11-10"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("CDMX"), lesson: Lesson.get(1), batch: Batch.findByEdition("Apprentice CDMX 2016 B")).save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2016-11-17"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("CDMX"), lesson: Lesson.get(2), batch: Batch.findByEdition("Apprentice CDMX 2016 B")).save()
        new Session(type: Session.Type.THEORETICAL, date: LocalDate.parse("2016-11-24"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("CDMX"), lesson: Lesson.get(3), batch: Batch.findByEdition("Apprentice CDMX 2016 B")).save()

        new Batch(edition: "Apprentice CDMX 2017 A", isActive: true).save()
        new Lesson(topic: "Introductory Topics", description: "VCS and Python, Java, Javascript").save()
        new Lesson(topic: "Data Structures and Big O Notation I", description: "Arrays and Lists").save()
        new Lesson(topic: "Data Structures and Big O Notation II", description: "Sets and Hash Tables").save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2017-01-7"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("CDMX"), lesson: Lesson.get(4), batch: Batch.findByEdition("Apprentice CDMX 2017 A")).save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2017-01-14"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("CDMX"), lesson: Lesson.get(5), batch: Batch.findByEdition("Apprentice CDMX 2017 A")).save()
        new Session(type: Session.Type.THEORETICAL, date: LocalDate.parse("2017-01-21"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("CDMX"), lesson: Lesson.get(6), batch: Batch.findByEdition("Apprentice CDMX 2017 A")).save()

        new Batch(edition: "Apprentice HMO 2017 A", isActive: true).save()
        new Lesson(topic: "Introductory Topics", description: "VCS and Python, Java, Javascript").save()
        new Lesson(topic: "Data Structures and Big O Notation I", description: "Arrays and Lists").save()
        new Lesson(topic: "Data Structures and Big O Notation II", description: "Sets and Hash Tables").save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2017-01-5"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("HMO"), lesson: Lesson.get(7), batch: Batch.findByEdition("Apprentice HMO 2017 A")).save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2017-01-12"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("HMO"), lesson: Lesson.get(8), batch: Batch.findByEdition("Apprentice HMO 2017 A")).save()
        new Session(type: Session.Type.THEORETICAL, date: LocalDate.parse("2017-01-19"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("HMO"), lesson: Lesson.get(9), batch: Batch.findByEdition("Apprentice HMO 2017 A")).save()

        new Resource(url: "http://www.slides.com", description: "Slides about Arrays and Lists", lesson: Lesson.first()).save()
        new Resource(url: "http://www.repo.com", description: "Repo with exercises about Arrays and Lists", lesson: Lesson.first()).save()

        new Enrollment(session: Session.findById(1), student: Student.findById(1), attendance: true).save()
        new Enrollment(session: Session.findById(1), student: Student.findById(2), attendance: false).save()

    }
    def destroy = {
    }
}
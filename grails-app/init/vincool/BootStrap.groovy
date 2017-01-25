package vincool

import org.joda.time.LocalDate
import org.joda.time.LocalTime

class BootStrap {

    def init = { servletContext ->

        new Student(name: "Luis Daniel", age: 22, school: "ESCOM", currentCompany: "Nearsoft", email: "lalducin@nearsoft.com").save()
        new Student(name: "Erick Reyna", age: 23, school: "UPVT", currentCompany: "Nearsoft", email: "ereyna@nearsoft.com").save()

        new Office(officeCode: Office.OfficeCode.CDMX, state: "Ciudad de México", city: "Ciudad de México", street: "San Luis Potosí",
                number: 196, zipCode: "06700", phoneNumber:  "+52 (55) 6388-6650").save()

        new Batch(edition: "Apprentice 2017 A").save()

        new Lesson(topic: "Introductory Topics", description: "VCS and Python, Java, Javascript", syllabus: Batch.first()).save()
        new Lesson(topic: "Data Structures and Big O Notation I", description: "Arrays and Lists", syllabus: Batch.first()).save()
        new Lesson(topic: "Data Structures and Big O Notation II", description: "Sets and Hash Tables", syllabus: Batch.first()).save()

        new Resource(url: "http://www.slides.com", description: "Slides about Arrays and Lists", lesson: Lesson.first()).save()
        new Resource(url: "http://www.repo.com", description: "Repo with exercises about Arrays and Lists", lesson: Lesson.first()).save()

        new Instructor(name: "Israel Gómez").save()

        new Session(type: Session.Type.PRACTICAL,date: LocalDate.now(),time: LocalTime.now(), lesson: Lesson.findById(1), instructor: Instructor.first(), office: Office.first()).save()
        new Session(type: Session.Type.PRACTICAL,date: LocalDate.parse("2017-01-26"),time: LocalTime.now(), lesson: Lesson.findById(2), instructor: Instructor.first(), office: Office.first()).save()
        new Session(type: Session.Type.PRACTICAL,date: LocalDate.parse("2017-01-30"),time: LocalTime.now(), lesson: Lesson.findById(3), instructor: Instructor.first(), office: Office.first()).save()

    }
    def destroy = {
    }
}

package vincool

import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class BootStrap {

    def init = { servletContext ->
        new SecRole("ROLE_STUDENT").save()
        new SecRole("ROLE_INSTRUCTOR").save()
        def secRole = new SecRole("ROLE_ADMIN").save()
        def secUser = new SecUser("PedroAdmin", "12345abcd" ).save()
        SecUserSecRole.create (secUser, secRole)

        def luisDaniel = new Student(username: "luisdaniel", password: "pass", email: "lalducin@nearsoft.com", name: "Luis Daniel", age: 22, school: "ESCOM", currentCompany: "Nearsoft").save()
        def erickReyna = new Student(username: "erikueen", password: "pass", email: "ereyna@nearsoft.com", name: "Erick Reyna", age: 23, school: "UPVT", currentCompany: "Nearsoft").save()
        new Student(username: "jlozano", password: "pass",  email: "jlozano@nearsoft.com", name: "Javier Lozano", age: 21, school: "UPIITA", currentCompany: "Nearsoft").save()
        new Student(username: "aibarra", password: "pass", email: "aibarra@nearsoft.com", name: "Antonio Ibarra", age: 19, school: "ESCOM", currentCompany: "Nearsoft").save()

        new Office(officeCode: "CDMX", location: "San Luis Potosí 196 int. 401 Col. Roma Norte Del. Cuauhtémoc Ciudad de México 06700", phoneNumber:  "+52 (55) 6388-6650").save()
        new Office(officeCode: "HMO", location: "Blvd. Antonio Quiroga 21 Col. El Llano Hermosillo, Sonora, México 83210", phoneNumber:  "+52 (662) 216-7401").save()

        new Instructor(username: "igomez", password: "pass", email: "igomez@nearsoft.com", name: "Israel Gómez").save()

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

        def introductoryTopics = new Lesson(topic: "Introductory Topics", description: "VCS and Python, Java, Javascript").save()
        def dataStructures1 = new Lesson(topic: "Data Structures and Big O Notation I", description: "Arrays and Lists").save()
        def dataStructures2 =  new Lesson(topic: "Data Structures and Big O Notation II", description: "Sets and Hash Tables").save()

        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2017-01-5"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("HMO"), lesson: introductoryTopics, batch: Batch.findByEdition("Apprentice HMO 2017 A")).save()
        new Session(type: Session.Type.PRACTICAL, date: LocalDate.parse("2017-01-12"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("HMO"), lesson: dataStructures1, batch: Batch.findByEdition("Apprentice HMO 2017 A")).save()
        new Session(type: Session.Type.THEORETICAL, date: LocalDate.parse("2017-01-19"), time: LocalTime.now(), instructor: Instructor.first(),
                office: Office.findByOfficeCode("HMO"), lesson: dataStructures2, batch: Batch.findByEdition("Apprentice HMO 2017 A")).save()

        new Resource(name:"Slides", url: "http://www.slides.com", description: "Slides about Arrays and Lists", lesson: Lesson.first()).save()
        new Resource(name: "Repo", url: "http://www.repo.com", description: "Repo with exercises about Arrays and Lists", lesson: Lesson.first()).save()

        new Enrollment(session: Session.findById(1), student: luisDaniel, attendance: true).save()
        new Enrollment(session: Session.findById(1), student: erickReyna, attendance: false).save()

    }
    def destroy = {
    }
}

package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class LessonController {

    static scaffold = Lesson

}

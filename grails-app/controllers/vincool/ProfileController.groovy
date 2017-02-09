package vincool

import grails.io.IOUtils
import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
class ProfileController {

    static allowedMethods = [index: "GET", update: "PUT"]
    def springSecurityService
    def roleUserService
    def cloudinaryService

    def index() {

        def user
        def userId = springSecurityService.getCurrentUserId()

        if (roleUserService.isCurrentUserAnAttendee()) {
            user = Attendee.findById(userId)
        } else if (roleUserService.isCurrentUserAInstructor()) {
            user = Instructor.findById(userId)
        } else {
            user = SecUser.findById(userId)
        }

        [user: user]
    }

    def update() {

        def user = springSecurityService.getCurrentUser()

        def profilePicture = request.getPart("picture")

        if (profilePicture) {
            def fileName = org.apache.commons.io.FilenameUtils.getName(user.profilePictureUrl)
            def publicId = org.apache.commons.io.FilenameUtils.removeExtension(fileName)

            def data = IOUtils.copyToByteArray(profilePicture.getInputStream())
            def uploadResult = cloudinaryService.update(publicId, data)

            user.profilePictureUrl = uploadResult.url

        }

        if (params.name) {
            user.name = params.name as String
        }

        if (params.twitter) {
            user.twitter = params.twitter as String
        }

        if (params.linkedin) {
            user.linkedin = params.linkedin as String
        }

        if (params.github) {
            user.github = params.github as String
        }

        if (params.description) {
            user.description = params.description as String
        }

        if (roleUserService.isCurrentUserAnAttendee()) {

            if (params.school) {
                user.school = params.school as String
            }

            if (params.currentCompany) {
                user.currentCompany = params.currentCompany as String
            }

        }

        user.save(flush: true)
        redirect(action: "index")
    }

}

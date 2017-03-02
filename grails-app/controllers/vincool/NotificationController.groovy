package vincool

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import vincool.auth.SecUser

@Secured(['ROLE_ADMIN'])
class NotificationController {

    static scaffold = Notification
    def notificationService

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
    def pull(){
        def userDetails = session.userDetails
        render Notification.findAllByUser( SecUser.findById(userDetails.id) ) as JSON
    }

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
    def get(){
        def userDetails = session.userDetails
        render(view: "inbox", model: [notifications: Notification.findAllByUser( SecUser.findById(userDetails.id) )])
    }

    def create(){
        render(view: "create", model: [id: params.id, type: params.type])
    }

    def save(){
        if ( params.type == Attendee.class.simpleName ||
             params.type == Instructor.class.simpleName ){
            notificationService.createByUser( params.message, SecUser.findAllById(params.id) )
        } else if (params.type == Event.class.simpleName){
            notificationService.createNotificationByEventId(params.message, params.id)
        } else if (params.type == Batch.class.simpleName){
            notificationService.createNotificationByBatchId(params.message, params.id)
        } else if (params.type == Office.class.simpleName){
            notificationService.createNotificationByOfficeId(params.message, params.id)
        }
        redirect(action: "index")
    }
}
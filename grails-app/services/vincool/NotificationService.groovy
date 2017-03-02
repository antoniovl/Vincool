package vincool

import grails.transaction.Transactional

@Transactional
class NotificationService {

    def createByUser(String message, users) {
        users.each { user ->
            Notification notification = new Notification();
            notification.message = message
            notification.seen = false
            notification.user = user
            notification.save(flush: true, failOnError: true)
        }
    }

    def createNotificationByEventId( String message, eventId ){
        List<Enrollment>  enrollments =
                Enrollment.findAllByEvent( Event.findById( eventId ) )
        enrollments.each { enrollment ->
            createByUser(message, enrollment.attendee)
        }
    }

    def createNotificationByBatchId( String message, batchId ){
        Batch batch = Batch.findAllById( batchId )
        List<Enrollment>  enrollments = batch.events
        enrollments.each { enrollment ->
            createByUser(message, enrollment.attendee)
        }
    }

    def createNotificationByOfficeId(String message, officeId){
        Office office = Office.findById( officeId )
        List<Event> events = Event.findAllByOffice( office )
        events.each { event ->
            createNotificationByEventId(message, event)
        }
    }

}

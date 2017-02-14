package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class ProgramController {

    def index() {
        render(view: "index", model: [nextClasses: Event.findAllByBatch(Batch.findByIsActive(true), [ sort: "date", order: "asc"])])
    }
}

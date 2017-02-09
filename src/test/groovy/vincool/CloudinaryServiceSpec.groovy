package vincool

import grails.test.mixin.TestFor
import spock.lang.Specification
import vincool.cloudinary.CloudinaryService

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(CloudinaryService)
class CloudinaryServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }
}

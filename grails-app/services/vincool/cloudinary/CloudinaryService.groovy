package vincool.cloudinary

import com.cloudinary.Singleton
import grails.transaction.Transactional

@Transactional
class CloudinaryService {

    def grailsApplication
    def cloudinary
    def Map cloudinaryConfig

    Map<String, String> getCloudinaryOptions() {

        cloudinaryConfig = ['cloud_name': grailsApplication.config.grails.plugin.cloudinary.cloudName,
                            'api_key'   : grailsApplication.config.grails.plugin.cloudinary.apiKey,
                            'api_secret': grailsApplication.config.grails.plugin.cloudinary.apiSecret]

        return cloudinaryConfig
    }


    def upload(File file) {
        Map result = Singleton.getCloudinary().uploader().upload(file, getCloudinaryOptions())
        return fillCloudinaryUploadResult(result)
    }

    def upload(byte[] content) {
        Map<String, String> result = Singleton.getCloudinary().uploader().upload(content, getCloudinaryOptions())
        return fillCloudinaryUploadResult(result)
    }

    def delete(String imageId) {
        return Singleton.getCloudinary().uploader().destroy(imageId, getCloudinaryOptions()).result == 'ok'
    }

    def fillCloudinaryUploadResult(Map<String, String> cloudinaryResult) {
        cloudinaryResult ? new CloudinaryUploadResult(
                publicId: cloudinaryResult.'public_id',
                version: cloudinaryResult.version as Long,
                signature: cloudinaryResult.signature,
                width: cloudinaryResult.width as Integer,
                height: cloudinaryResult.height as Integer,
                format: cloudinaryResult.format,
                resourceType: cloudinaryResult.'resource_type',
                bytes: cloudinaryResult.bytes as Long,
                type: cloudinaryResult.type,
                url: cloudinaryResult.url,
                secureUrl: cloudinaryResult.'secure_url',
                createdAt: Date.parse('yyyy-MM-dd\'T\'HH:mm:ss', String.valueOf(cloudinaryResult.'created_at'))
        ) : null
    }



}

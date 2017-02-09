package vincool.cloudinary

import groovy.transform.ToString

@ToString(includeNames=true)
class CloudinaryUploadResult {

    String publicId
    long version
    String signature
    int width
    int height
    String format
    String resourceType
    Date createdAt
    long bytes
    String type
    String url
    String secureUrl

}

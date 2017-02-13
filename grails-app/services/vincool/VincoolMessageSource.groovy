package vincool

/**
 * Created by apimentel on 2/6/17.
 */

import org.grails.spring.context.support.PluginAwareResourceBundleMessageSource
import org.springframework.context.support.AbstractMessageSource

import java.text.MessageFormat

class VincoolMessageSource extends PluginAwareResourceBundleMessageSource {
    @Override
    protected String resolveCodeWithoutArguments(String code, Locale locale) {
        String message = super.resolveCodeWithoutArguments(code, locale);
        if (!message) {
            println code + "::" + locale
        }
        return message
    }

    @Override
    protected MessageFormat resolveCode(String code, Locale locale) {
        def message = super.resolveCode(code, locale);
        if (!message) {
            println code + "::" + locale
        }
        return message
    }
}
package com.auction.util;

import jakarta.servlet.http.HttpServletRequest;
import org.apache.commons.text.StringEscapeUtils;
import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public class HtmlUtils {
    // Strict HTML policy: allows only basic tags without attributes
    private static final PolicyFactory STRICT_HTML_POLICY = new HtmlPolicyBuilder()
            .allowElements("b", "i", "u", "p", "br", "ul", "ol", "li", "strong", "em", "blockquote")
            .toFactory();


    public static String sanitizeHtml(String input) {
        if (input == null) {
            return null;
        }
        return STRICT_HTML_POLICY.sanitize(input);
    }


    public static String escapeHtml(String input) {
        if (input == null) {
            return null;
        }
        return StringEscapeUtils.escapeHtml4(input);
    }


    public static String escapeForJavaScript(String input) {
        if (input == null) {
            return null;
        }
        return StringEscapeUtils.escapeEcmaScript(input);
    }


    public static String escapeForAttribute(String input) {
        if (input == null) {
            return null;
        }
        return StringEscapeUtils.escapeHtml4(input).replace("\"", "&quot;").replace("'", "&#39;");
    }


    public static String getParameter(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return value != null ? escapeHtml(value) : null;
    }


    public static String getSanitizedParameter(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return value != null ? sanitizeHtml(value) : null;
    }
}

<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Error - Auction System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header>
    <h1>Auction System</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/lots">Active Lots</a></li>
            <li><a href="${pageContext.request.contextPath}/lots?action=all">All Lots</a></li>
            <li><a href="${pageContext.request.contextPath}/lot?action=create">Create Lot</a></li>
        </ul>
    </nav>
</header>

<main>
    <div class="error-container">
        <h2>Error Occurred</h2>

        <div class="error-details">
            <c:choose>
                <c:when test="${not empty pageContext.exception}">
                    <p>We're sorry, but an error occurred while processing your request.</p>
                    <p><strong>Error Type:</strong> ${pageContext.exception.class.name}</p>
                    <p><strong>Message:</strong> ${pageContext.exception.message}</p>
                </c:when>
                <c:when test="${not empty requestScope.error}">
                    <p>${requestScope.error}</p>
                </c:when>
                <c:otherwise>
                    <p>We're sorry, but an unexpected error occurred while processing your request.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/lots" class="button">Return to Home</a>
        </div>
    </div>
</main>


</body>
</html>
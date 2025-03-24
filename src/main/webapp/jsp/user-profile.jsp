<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile - Auction System</title>
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
    <div class="user-profile">
        <h2>User Profile</h2>

        <div class="user-info">
            <p><strong>Username:</strong> ${user.username}</p>
            <p><strong>Email:</strong> ${user.email}</p>
        </div>

        <div class="user-lots">
            <h3>My Lots</h3>

            <c:choose>
                <c:when test="${empty userLots}">
                    <p>You haven't created any lots yet.</p>
                    <p><a href="${pageContext.request.contextPath}/lot?action=create" class="button">Create a Lot</a></p>
                </c:when>
                <c:otherwise>
                    <div class="lots-grid">
                        <c:forEach var="lot" items="${userLots}">
                            <div class="lot-card ${lot.active ? 'active' : 'inactive'}">
                                <h3><a href="${pageContext.request.contextPath}/lot?id=${lot.id}">${lot.title}</a></h3>
                                <p>${lot.description}</p>
                                <p>
                                    <c:if test="${lot.active}">
                                        <span class="status active">Active</span>
                                    </c:if>
                                    <c:if test="${!lot.active}">
                                        <span class="status inactive">Inactive</span>
                                    </c:if>
                                </p>
                                <p>Current Price: <fmt:formatNumber value="${lot.currentPrice}" type="currency"/></p>
                                <p>Bids: ${lot.bids.size()}</p>
                                <a href="${pageContext.request.contextPath}/lot?id=${lot.id}" class="button">View Details</a>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>


</body>
</html>
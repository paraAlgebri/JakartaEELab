<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>${title} - Auction System</title>
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
            <li>
                <form action="${pageContext.request.contextPath}/search" method="get">
                    <input type="text" name="keyword" placeholder="Search...">
                    <button type="submit">Search</button>
                </form>
            </li>
        </ul>
    </nav>
</header>

<main>
    <h2>${title}</h2>

    <c:choose>
        <c:when test="${empty lots}">
            <p>No lots available.</p>
        </c:when>
        <c:otherwise>
            <div class="lots-grid">
                <c:forEach var="lot" items="${lots}">
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
</main>

<c:if test="${not empty user}">
    <div class="user-info center">
        <a href="${pageContext.request.contextPath}/logout" class="logout-button">Logout</a>
    </div>
</c:if>

</body>
</html>
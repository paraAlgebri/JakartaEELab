<%@ tag description="Page template" pageEncoding="UTF-8" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="head" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - Auction System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <jsp:invoke fragment="head"/>
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
    <jsp:doBody/>
</main>

<footer>
    <p>&copy; Auction System</p>
</footer>
</body>
</html>
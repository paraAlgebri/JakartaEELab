<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <title>Create New Lot - Auction System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header>
    <h1>Auction System</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/lots">Active Lots</a></li>
            <li><a href="${pageContext.request.contextPath}/lots?action=all">All Lots</a></li>
            <li><a href="${pageContext.request.contextPath}/lot?action=create" class="active">Create Lot</a></li>
        </ul>
    </nav>
</header>

<main>
    <h2>Create New Lot</h2>


    <form class="lot-form" action="${pageContext.request.contextPath}/lot?action=create" method="post">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="5" required></textarea>
        </div>

        <div class="form-group">
            <label for="startPrice">Starting Price:</label>
            <input type="number" id="startPrice" name="startPrice" min="0.01" step="0.01" required>
        </div>

        <input type="hidden" name="userId" value="${userId}">

        <div class="form-actions">
            <button type="submit" class="button">Create Lot</button>
            <a href="${pageContext.request.contextPath}/lots" class="button secondary">Cancel</a>
        </div>
    </form>
</main>


</body>
</html>
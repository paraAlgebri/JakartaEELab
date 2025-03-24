<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    pageContext.setAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>${lot.title} - Auction System</title>
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
    <div class="lot-details">
        <h2>${lot.title}</h2>

        <div class="lot-status">
            <c:if test="${lot.active}">
                <span class="status active">Active</span>
            </c:if>
            <c:if test="${!lot.active}">
                <span class="status inactive">Inactive</span>
            </c:if>
        </div>

        <div class="lot-info">
            <p>${lot.description}</p>
            <p>Start Price: <fmt:formatNumber value="${lot.startPrice}" type="currency"/></p>
            <p>Current Price: <fmt:formatNumber value="${lot.currentPrice}" type="currency"/></p>

            <fmt:parseDate value="${lot.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedCreatedDate" type="both" />
            <p>Created: <fmt:formatDate value="${parsedCreatedDate}" pattern="dd.MM.yyyy HH:mm"/></p>

            <c:if test="${lot.startedAt != null}">
                <fmt:parseDate value="${lot.startedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedStartedDate" type="both" />
                <p>Auction Started: <fmt:formatDate value="${parsedStartedDate}" pattern="dd.MM.yyyy HH:mm"/></p>
            </c:if>

            <c:if test="${lot.endedAt != null}">
                <fmt:parseDate value="${lot.endedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedEndedDate" type="both" />
                <p>Auction Ended: <fmt:formatDate value="${parsedEndedDate}" pattern="dd.MM.yyyy HH:mm"/></p>
            </c:if>
        </div>

        <div class="lot-actions">
            <c:choose>
                <c:when test="${lot.ownerId eq userId}">
                    <!-- Owner actions -->
                    <p>You are the owner of this lot.</p>

                    <p>Share URL: <input type="text" readonly value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}${lot.generateShareUrl()}" /></p>

                    <div class="action-buttons">
                        <c:if test="${!lot.active}">
                            <a href="${pageContext.request.contextPath}/lot?action=start&id=${lot.id}&userId=${userId}" class="button">Start Auction</a>
                        </c:if>

                        <c:if test="${lot.active}">
                            <a href="${pageContext.request.contextPath}/lot?action=stop&id=${lot.id}&userId=${userId}" class="button">Stop Auction</a>
                        </c:if>

                        <a href="${pageContext.request.contextPath}/lot?action=delete&id=${lot.id}&userId=${userId}" class="button delete" onclick="return confirm('Are you sure you want to delete this lot?')">Delete Lot</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Bidder actions -->
                    <c:if test="${lot.active}">
                        <form action="${pageContext.request.contextPath}/lot" method="post" class="bid-form">
                            <input type="hidden" name="action" value="bid">
                            <input type="hidden" name="id" value="${lot.id}">
                            <input type="hidden" name="userId" value="${userId}">

                            <div class="form-group">
                                <label for="bidAmount">Your Bid (min: <fmt:formatNumber value="${lot.currentPrice + 1}" type="currency"/>):</label>
                                <input type="number" id="bidAmount" name="bidAmount" min="${lot.currentPrice + 1}" step="0.01" required>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="button">Place Bid</button>
                            </div>

                            <c:if test="${not empty error}">
                                <div class="error-message">
                                    <p>${error}</p>
                                </div>
                            </c:if>
                        </form>
                    </c:if>
                    <c:if test="${!lot.active}">
                        <p class="auction-closed">This auction is not active. You cannot place bids at this time.</p>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="bid-history">
            <h3>Bid History</h3>

            <c:choose>
                <c:when test="${empty lot.bids}">
                    <p>No bids have been placed on this lot yet.</p>
                </c:when>
                <c:otherwise>
                    <table class="bid-table">
                        <thead>
                        <tr>
                            <th>Amount</th>
                            <th>Date & Time</th>
                            <th>User</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="bid" items="${lot.bids}">
                            <tr>
                                <td><fmt:formatNumber value="${bid.amount}" type="currency"/></td>
                                <td>${bid.createdAt.format(dateFormatter)}</td>
                                <td>
                                    User ID: ${bid.userId}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>


</body>
</html>
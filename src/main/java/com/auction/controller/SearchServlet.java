package com.auction.controller;

import com.auction.model.Lot;
import com.auction.util.DataStorage;
import com.auction.util.HtmlUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String keyword = HtmlUtils.getParameter(request, "keyword");

        if (keyword != null && !keyword.trim().isEmpty()) {
            List<Lot> searchResults = DataStorage.searchLotsByKeyword(keyword);
            request.setAttribute("lots", searchResults);
            request.setAttribute("keyword", keyword);
            request.setAttribute("title", "Search Results for: " + keyword);
        } else {
            request.setAttribute("title", "Search");
        }

        request.setAttribute("userId", DataStorage.getFirstUserId());
        request.getRequestDispatcher("/jsp/search.jsp").forward(request, response);
    }
}
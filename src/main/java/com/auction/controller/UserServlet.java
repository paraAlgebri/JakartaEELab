package com.auction.controller;

import com.auction.model.Lot;
import com.auction.model.User;
import com.auction.util.DataStorage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("id");

        if (userId == null) {
            // Use test user
            userId = DataStorage.getFirstUserId();
        }

        User user = DataStorage.getUser(userId);
        if (user != null) {
            request.setAttribute("user", user);

            List<Lot> userLots = DataStorage.getUserLots(userId);
            request.setAttribute("userLots", userLots);

            request.getRequestDispatcher("/jsp/user-profile.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
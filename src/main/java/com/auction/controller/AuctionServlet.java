package com.auction.controller;

import com.auction.model.Lot;
import com.auction.util.DataStorage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AuctionServlet", urlPatterns = {"/lots", ""})
public class AuctionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        String userId = (String) session.getAttribute("userId");

        if ("all".equals(action)) {
            List<Lot> allLots = DataStorage.getAllLots();
            request.setAttribute("lots", allLots);
            request.setAttribute("title", "All Lots");
        } else {
            List<Lot> activeLots = DataStorage.getActiveLots();
            request.setAttribute("lots", activeLots);
            request.setAttribute("title", "Active Lots");
        }

        request.setAttribute("userId", userId);
        request.getRequestDispatcher("/jsp/lots.jsp").forward(request, response);
    }
}
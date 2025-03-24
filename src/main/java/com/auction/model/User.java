package com.auction.model;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class User {
    private final String id;
    private String username;
    private String email;
    private String password;
    private List<String> ownedLotIds;
    private List<String> bidLotIds;

    public User(String username, String email, String password) {
        this.id = UUID.randomUUID().toString();
        this.username = username;
        this.email = email;
        this.password = password;
        this.ownedLotIds = new ArrayList<>();
        this.bidLotIds = new ArrayList<>();
    }

    public String getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<String> getOwnedLotIds() {
        return ownedLotIds;
    }

    public List<String> getBidLotIds() {
        return bidLotIds;
    }

    public void addOwnedLot(String lotId) {
        this.ownedLotIds.add(lotId);
    }

    public void addBidLot(String lotId) {
        if (!this.bidLotIds.contains(lotId)) {
            this.bidLotIds.add(lotId);
        }
    }
}
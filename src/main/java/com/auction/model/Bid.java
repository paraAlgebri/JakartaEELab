package com.auction.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

public class Bid {
    private final String id;
    private final String userId;
    private final String lotId;
    private final BigDecimal amount;
    private final LocalDateTime createdAt;

    public Bid(String userId, String lotId, BigDecimal amount) {
        this.id = UUID.randomUUID().toString();
        this.userId = userId;
        this.lotId = lotId;
        this.amount = amount;
        this.createdAt = LocalDateTime.now();
    }

    // Getters
    public String getId() {
        return id;
    }

    public String getUserId() {
        return userId;
    }

    public String getLotId() {
        return lotId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}
package com.auction.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Lot {
    private final String id;
    private String title;
    private String description;
    private BigDecimal startPrice;
    private BigDecimal currentPrice;
    private final LocalDateTime createdAt;
    private LocalDateTime startedAt;
    private LocalDateTime endedAt;
    private final String ownerId;
    private boolean active;
    private List<Bid> bids;

    public Lot(String title, String description, BigDecimal startPrice, String ownerId) {
        this.id = UUID.randomUUID().toString();
        this.title = title;
        this.description = description;
        this.startPrice = startPrice;
        this.currentPrice = startPrice;
        this.ownerId = ownerId;
        this.createdAt = LocalDateTime.now();
        this.active = false;
        this.bids = new ArrayList<>();
    }


    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getStartPrice() {
        return startPrice;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getStartedAt() {
        return startedAt;
    }

    public LocalDateTime getEndedAt() {
        return endedAt;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public boolean isActive() {
        return active;
    }

    public List<Bid> getBids() {
        return bids;
    }

    public void startAuction() {
        this.active = true;
        this.startedAt = LocalDateTime.now();
    }

    public void stopAuction() {
        this.active = false;
        this.endedAt = LocalDateTime.now();
    }

    public boolean addBid(Bid bid) {
        if (!active) {
            return false;
        }
        if (bid.getAmount().compareTo(currentPrice) <= 0) {
            return false;
        }
        bids.add(bid);
        currentPrice = bid.getAmount();
        return true;
    }

    public String generateShareUrl() {
        return "/lot?id=" + id;
    }
}
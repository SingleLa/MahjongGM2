package com.rafotech.GM.DB.Model;

import java.util.Date;

public class RechargeLog {
    private Integer id;

    private Integer sellerid;

    private Integer buyid;

    private Integer isplayer;

    private Integer cardNum;

    private Integer awardNum;

    private Integer percentageNum;

    private Integer rechargeType;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }

    public Integer getBuyid() {
        return buyid;
    }

    public void setBuyid(Integer buyid) {
        this.buyid = buyid;
    }

    public Integer getIsplayer() {
        return isplayer;
    }

    public void setIsplayer(Integer isplayer) {
        this.isplayer = isplayer;
    }

    public Integer getCardNum() {
        return cardNum;
    }

    public void setCardNum(Integer cardNum) {
        this.cardNum = cardNum;
    }

    public Integer getAwardNum() {
        return awardNum;
    }

    public void setAwardNum(Integer awardNum) {
        this.awardNum = awardNum;
    }

    public Integer getPercentageNum() {
        return percentageNum;
    }

    public void setPercentageNum(Integer percentageNum) {
        this.percentageNum = percentageNum;
    }

    public Integer getRechargeType() {
        return rechargeType;
    }

    public void setRechargeType(Integer rechargeType) {
        this.rechargeType = rechargeType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
package com.rafotech.GM.DB.Model;

import java.util.Date;

public class User {
    private Integer id;

    private String userName;

    private String password;

    private Integer areaId;

    private Integer agentType;

    private String name;

    private Integer csid;

    private Integer createrid;

    private Integer card;

    private Integer cardBaseCount;

    private Integer cardAwardCount;

    private Integer cardCompensateCount;

    private Integer usecard;

    private Integer consumeCard;

    private String weixin;

    private Integer status;

    private Date updatetime;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getAgentType() {
        return agentType;
    }

    public void setAgentType(Integer agentType) {
        this.agentType = agentType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public Integer getCreaterid() {
        return createrid;
    }

    public void setCreaterid(Integer createrid) {
        this.createrid = createrid;
    }

    public Integer getCard() {
        return card;
    }

    public void setCard(Integer card) {
        this.card = card;
    }

    public Integer getCardBaseCount() {
        return cardBaseCount;
    }

    public void setCardBaseCount(Integer cardBaseCount) {
        this.cardBaseCount = cardBaseCount;
    }

    public Integer getCardAwardCount() {
        return cardAwardCount;
    }

    public void setCardAwardCount(Integer cardAwardCount) {
        this.cardAwardCount = cardAwardCount;
    }

    public Integer getCardCompensateCount() {
        return cardCompensateCount;
    }

    public void setCardCompensateCount(Integer cardCompensateCount) {
        this.cardCompensateCount = cardCompensateCount;
    }

    public Integer getUsecard() {
        return usecard;
    }

    public void setUsecard(Integer usecard) {
        this.usecard = usecard;
    }

    public Integer getConsumeCard() {
        return consumeCard;
    }

    public void setConsumeCard(Integer consumeCard) {
        this.consumeCard = consumeCard;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin == null ? null : weixin.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
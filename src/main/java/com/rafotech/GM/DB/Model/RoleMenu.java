package com.rafotech.GM.DB.Model;

public class RoleMenu {
    private Integer id;

    private Integer roleId;

    private Integer menueId;

    private Integer tQuery;

    private Integer tAdd;

    private Integer tUpdate;

    private Integer tDelete;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getMenueId() {
        return menueId;
    }

    public void setMenueId(Integer menueId) {
        this.menueId = menueId;
    }

    public Integer gettQuery() {
        return tQuery;
    }

    public void settQuery(Integer tQuery) {
        this.tQuery = tQuery;
    }

    public Integer gettAdd() {
        return tAdd;
    }

    public void settAdd(Integer tAdd) {
        this.tAdd = tAdd;
    }

    public Integer gettUpdate() {
        return tUpdate;
    }

    public void settUpdate(Integer tUpdate) {
        this.tUpdate = tUpdate;
    }

    public Integer gettDelete() {
        return tDelete;
    }

    public void settDelete(Integer tDelete) {
        this.tDelete = tDelete;
    }
}
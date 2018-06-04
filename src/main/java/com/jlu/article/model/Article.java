package com.jlu.article.model;

import java.util.Date;

public class Article {
    private Long id;

    private String name;

    private String abstractinfo;

    private String imagepath;

    private Date date;

    private Integer userid;

    private Long pv;

    private byte[] content;

    public String getContentString(){
        return new String(content);
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAbstractinfo() {
        return abstractinfo;
    }

    public void setAbstractinfo(String abstractinfo) {
        this.abstractinfo = abstractinfo == null ? null : abstractinfo.trim();
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath == null ? null : imagepath.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Long getPv() {
        return pv;
    }

    public void setPv(Long pv) {
        this.pv = pv;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }
}
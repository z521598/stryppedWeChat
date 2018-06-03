package com.jlu.user.model;


public class User {

    public final static String CURRENT_USER_NAME = "currentUser";

    private Integer id;

    private String email;

    private String name;

    private String password;

    private String profession;

    private String sex;

    private String username;

    private String publicname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession == null ? null : profession.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPublicname() {
        return publicname;
    }

    public User setPublicname(String publicname) {
        this.publicname = publicname;
        return this;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("User{");
        sb.append("id=").append(id);
        sb.append(", email='").append(email).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", profession='").append(profession).append('\'');
        sb.append(", sex='").append(sex).append('\'');
        sb.append(", username='").append(username).append('\'');
        sb.append(", publicname='").append(publicname).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
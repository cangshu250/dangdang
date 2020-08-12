package com.zzy.entity;

import java.util.Date;

public class User {
    private String id;
    private int age;
    private Date birthday;

    public User() {
    }

    public User(String id, int age, Date birthday) {

        this.id = id;
        this.age = age;
        this.birthday = birthday;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", age=" + age +
                ", birthday=" + birthday +
                '}';
    }
}

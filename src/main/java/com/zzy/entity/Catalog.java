package com.zzy.entity;

import java.io.Serializable;
import java.util.List;

public class Catalog implements Serializable {
    private String id;
    private String classname;
    private String pid;
    private int count;
    private List<Catalog> sonCatalogs;
    private Catalog parentCatalog;

    public List<Catalog> getSonCatalogs() {
        return sonCatalogs;
    }

    public void setSonCatalogs(List<Catalog> sonCatalogs) {
        this.sonCatalogs = sonCatalogs;
    }

    public Catalog getParentCatalog() {
        return parentCatalog;
    }

    public void setParentCatalog(Catalog parentCatalog) {
        this.parentCatalog = parentCatalog;
    }

    public Catalog() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Catalog{" +
                "id='" + id + '\'' +
                ", classname='" + classname + '\'' +
                ", pid='" + pid + '\'' +
                ", count=" + count +
                ", sonCatalogs=" + sonCatalogs +
                '}';
    }
}

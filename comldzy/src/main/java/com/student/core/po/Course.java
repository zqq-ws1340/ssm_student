package com.student.core.po;

import java.io.Serializable;

public class Course implements Serializable {
    private static final long serialVersionUID=1L;
   private String course_no;//课程编号
   private String course_name;//课程名称
    private String course_bh;//代号
   private int credit;//学分
   private  int classhour;//学时

    public String getCourse_no() {
        return course_no;
    }

    public void setCourse_no(String course_no) {
        this.course_no = course_no;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public int getClasshour() {
        return classhour;
    }

    public void setClasshour(int classhour) {
        this.classhour = classhour;
    }

    public String getCourse_bh() {
        return course_bh;
    }

    public void setCourse_bh(String course_bh) {
        this.course_bh = course_bh;
    }
}

package com.student.core.po;

import java.io.Serializable;

public class Student implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;//成绩id
    private String stundent_no;//学号
    private String student_name;//名字
    private String course_name;//课程名称
    private String course_no;//课程编号
    private String ordinary_scores;//平时成绩
    private String end_scores;//期末成绩
    private String total_scores;//总评成绩There is no getter for property named 'course_on' in 'class com.student.core.po.Student'
    private Integer start;//起始行
    private Integer rows;//所取行数

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStundent_no() {
        return stundent_no;
    }

    public void setStundent_no(String stundent_no) {
        this.stundent_no = stundent_no;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_no() {
        return course_no;
    }

    public void setCourse_no(String course_no) {
        this.course_no = course_no;
    }

    public String getOrdinary_scores() {
        return ordinary_scores;
    }

    public void setOrdinary_scores(String ordinary_scores) {
        this.ordinary_scores = ordinary_scores;
    }

    public String getEnd_scores() {
        return end_scores;
    }

    public void setEnd_scores(String end_scores) {
        this.end_scores = end_scores;
    }

    public String getTotal_scores() {
        return total_scores;
    }

    public void setTotal_scores(String total_scores) {
        this.total_scores = total_scores;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}

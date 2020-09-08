package com.student.core.dao;

import com.student.core.po.Course;

import java.util.List;

/*
* 课程表
* */
public interface CourseDao {
    public List<Course> selectCourse(String Stundent_no);
}

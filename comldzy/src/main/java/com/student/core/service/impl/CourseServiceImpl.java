package com.student.core.service.impl;

import com.student.core.dao.CourseDao;
import com.student.core.po.Course;
import com.student.core.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("courseService")
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;
    @Override
    public List<Course> findCourse(String  Stundent_no) {
        return courseDao.selectCourse(Stundent_no);
    }
}

package com.student.core.dao;

import com.student.core.po.Student;

import java.util.List;
/*
* Student接口
* */

public interface StudentDao {
    //学生列表
    public List<Student> selectStudentList(Student student);
    //学生总数
    public Integer selectStudentListCount(Student student);

    //添加学生信息
    public int createStudent(Student student);
    /*
    * 修改学生信息
    * */
    //通过id查询学生信息
    public Student getStudentById(Integer id);
    //更新学生信息
    public int updateStudent(Student student);
    //删除学生信息
    int deleteStudent(Integer id);
}

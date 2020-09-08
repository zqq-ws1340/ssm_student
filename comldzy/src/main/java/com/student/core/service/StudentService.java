package com.student.core.service;

import com.student.common.utils.Page;
import com.student.core.po.Student;
public interface StudentService {
    /*
     * 查询学生信息
     * */
    public Page<Student> findStudentList(Integer page, Integer rows , String studName,String Stundent_no);

    //添加学生信息
    public int createStudent(Student student);
    //通过id查询学生信息
    public Student getStudentById(Integer id);
    //修改学生信息
    public int updateStudent(Student student);
    //删除学生信息
    public int deleteStudent(Integer id);
}

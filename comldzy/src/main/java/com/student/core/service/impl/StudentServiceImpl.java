package com.student.core.service.impl;


import com.student.common.utils.Page;
import com.student.core.dao.StudentDao;
import com.student.core.po.Student;
import com.student.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
    //依赖注入
    @Autowired
    private StudentDao studentDao;


    @Override
    public Page<Student> findStudentList(Integer page, Integer rows, String studName, String Stundent_no) {
        //创建学生对象Sutdent
        Student student = new Student();
        //判断学生名字
        if(studName !=null && studName.length()>0){
            student.setStudent_name(studName);
        }
        //判断课程名称
        if(Stundent_no !=null && Stundent_no.length()>0){
            student.setCourse_name(Stundent_no);
        }

        //当前页
        student.setStart((page-1) *rows);
        //每页数
        student.setRows(rows);
        //查询学生列表
        List<Student> students = studentDao.selectStudentList(student);
        //查询学生列表总数
        Integer count = studentDao.selectStudentListCount(student);
        //创建page返回对象
        Page<Student> result= new Page<>();
        result.setPage(page);
        result.setRows(students);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }
    //添加学生信息
    @Override
    public int createStudent(Student student) {
        return this.studentDao.createStudent(student);
    }

    @Override
    public Student getStudentById(Integer id) {
        Student student = studentDao.getStudentById(id);
        return student;
    }

    @Override
    public int updateStudent(Student student) {
        return studentDao.updateStudent(student);
    }


    /*
    * 删除学生信息
    * */
    @Override
    public int deleteStudent(Integer id) {
        return studentDao.deleteStudent(id);
    }
}

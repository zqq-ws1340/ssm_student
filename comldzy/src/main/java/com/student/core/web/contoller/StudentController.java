package com.student.core.web.contoller;

import com.student.common.utils.Page;
import com.student.core.po.Course;
import com.student.core.po.Student;
import com.student.core.service.CourseService;
import com.student.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseService courseService;
    //课程名称


    /*
    * 查询学生信息
    * */
    @RequestMapping(value = "/student/list.action")
    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                       String studName, String Stundent_no, String course, Model model){
        //条件查询所有学生信息
        final Page<Student> students = studentService.findStudentList(page, rows, studName,Stundent_no);
        model.addAttribute("page",students);
        //学生信息模糊查询
        model.addAttribute("studName",studName);
        //课程名称
        List<Course> courses = courseService.findCourse(course);
        model.addAttribute("course",courses);
        return "customer";
    }
    //添加学生信息
    @RequestMapping(value = "/student/create.action")
    @ResponseBody
    public String studentCreate(Student student){
        int rows = studentService.createStudent(student);
        if (rows>0){
            return "OK";
            }else {
            return "FAIL";
        }
    }
    /*
    * 通过id查询学生信息
    * */
    @RequestMapping(value = "/student/getStudentById.action")
    @ResponseBody
    public Student getStudentById(Integer id){
        Student student = studentService.getStudentById(id);
        return student;
    }
    /*
    * 更新客户
    * */
    @RequestMapping(value = "/student/update.action")
    @ResponseBody
    public String studentUpdate(Student student){
        int rows = studentService.updateStudent(student);
        if (rows>0){
            return "OK";
        }else {
            return "FAIL";
        }

    }
    /*
    * 删除学生
    *
    * */
    @RequestMapping("/student/delete.action")
    @ResponseBody
    public String studentDelete(Integer id){
        int rows = studentService.deleteStudent(id);
        if(rows>0){
            return "OK";
        }else {
            return "FAIL";
        }
    }
}

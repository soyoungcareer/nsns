package com.kh.spring.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.member.service.StudentService;
import com.kh.spring.member.vo.Student;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;

    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired 
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//학생 정보 페이지
	@RequestMapping("stuinfo.st")
	public String selectStuInfo(Model model, HttpSession session) {  
		
		//로그인 세션의 학번을 가져와서 전달
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId(); 
		
		Student student = studentService.studentInfo(stuId);
		
		System.out.println(" student : " + student);
		
		model.addAttribute("student", student);
		
		return "student/studentInfo";
	}
	
	//학생 정보 업데이트 
	@RequestMapping("updateStudent.stu")
	public String updateStu(Student student, RedirectAttributes redirectAttributes) { 
		
		studentService.updateStu(student);
		
		redirectAttributes.addFlashAttribute("message", "학생정보 업데이트 성공");
		
		return "redirect:stuinfo.st";
	}
	
	@RequestMapping("email.em")
	public String emailPage(String data, Model model) { 
		
		model.addAttribute("data", data);
		
		System.out.println("data : " + data);
		
		return "student/email";
		
	}
	
	
	//이메일 인증번호 전송
	@ResponseBody
    @RequestMapping(value="mailCheck", method=RequestMethod.GET)
    public String mailCheckGET(String email) throws Exception{
        

        //인증번호(난수) 생성 
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        

        //이메일 보내기 
        String setFrom = "annie9434@gamil.com";
        String toMail = email;
        String title = "비밀번호 변경을 위한 인증번호 전송메일입니다.";
        String content = 
                "안녕하세요 낙성대학교 학사행정시스템입니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + " 입니다." + 
                "<br>" + 
                "해당 인증번호를 확인란에 기입해주세요.";
        
       try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
	
	@RequestMapping("inputPw.stu")
	public String inputPW() { 
		
		return "student/inputPW";
	}
	
	//비밀번호 업데이트 (암호화)
	@ResponseBody
	@RequestMapping(value="changePW.stu", produces="application/json; charset=utf-8")
	public String ChangePW(String stuPwd, HttpSession session) { 
		
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();  //세션에서 학번 조회해오기 (비밀번호를 바꾸기 위해)
		
		Student student = new Student();
		
		student.setStuId(stuId);
		
		String finalPwd = bCryptPasswordEncoder.encode(stuPwd); 
		
		student.setStuPwd(finalPwd);
		
		int result = studentService.ChangePW(student);
		
		return new GsonBuilder().create().toJson(result);
	}
	

}

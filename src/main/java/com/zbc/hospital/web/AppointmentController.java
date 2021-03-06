package com.zbc.hospital.web;


import com.zbc.hospital.pojo.Appointment;
import com.zbc.hospital.pojo.Doctor;
import com.zbc.hospital.pojo.User;
import com.zbc.hospital.service.AppointmentService;
import com.zbc.hospital.service.DoctorService;
import com.zbc.hospital.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;
/**
 * Created by zbc on 2017/11/26.
 */
@Controller
@RequestMapping("/appointment")
public class AppointmentController {

    @Autowired
    private DoctorService doctorService;
    @Autowired
    private AppointmentService appointmentService;

    @RequestMapping("/{did}")
    public String show(@PathVariable Long did, String dayInfo, Model model){
        Doctor doctor = doctorService.selectById(did);
        model.addAttribute("doctor",doctor);
        model.addAttribute("dayInfo",dayInfo);
        return "appointment_form";
    }

    //预约
    @RequestMapping("/submit")
    @ResponseBody
    public String commit(Appointment appointment, HttpSession session){
        appointment.setAid(CommonUtils.getId());
        appointment.setCreatetime(new Date());
        appointment.setUpdatetime(new Date());
        String resultData = "";
        User user = (User)session.getAttribute("user");

        if(user == null){
            resultData = "-2";
        }else {
            appointment.setUid(user.getUid());
            if(!appointment.getName().equals(user.getName())){
                resultData = "-1";
            }else {
                if( !appointmentService.save(appointment)  ){
                    resultData = "-3";
                }else{
                    resultData = String.valueOf(appointment.getAid());
                }
            }
        }
        return resultData;
    }
}

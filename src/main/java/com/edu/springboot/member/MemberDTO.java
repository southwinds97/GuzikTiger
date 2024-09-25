package com.edu.springboot.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {
    private String id;
    private String name;
    private String pass;
    private String hint;
    private String hintas;
    private String tel;
    private String email;
    private int postcode;
    private String addr;
    private String detailaddr;
    private String gen;
    private String birth;
    private String calendar;
    private int points;
    private Date regdate;
    private int user_level;
}

package com.edu.springboot.member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IMemberService {
    // 회원 로그인 처리 메서드
    MemberDTO login(@Param("id") String id, @Param("pass") String pass);

    // 회원가입 처리 메서드
    int insertMember(MemberDTO memberDTO);

    // 아이디 중복 체크 메서드
    int idCheck(String id);

    // 회원 정보 상세 조회 메서드
    MemberDTO viewMember(String id);
    
    // 회원 정보 수정 처리 메서드
    int updateMember(MemberDTO memberDTO);

    // 회원 탈퇴 처리 메서드
    int deleteMember(String id);
}
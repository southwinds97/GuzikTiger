package com.edu.springboot.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMyPageService {
    List<Map<String, Object>> wishListSelect(String memberId);
}
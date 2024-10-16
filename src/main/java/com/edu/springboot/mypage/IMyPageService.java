package com.edu.springboot.mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.order.OrderDTO;
import com.edu.springboot.product.ProductDTO;

@Mapper
public interface IMyPageService {
    // 위시리스트 조회
    List<Map<String, Object>> wishListSelect(WishListDTO wishListDTO);

    // 위시리스트 총 갯수
    int getWishListTotalCount(String memberId);

    // 위시리스트 중복 확인
    int wishListCheck(WishListDTO wishListDTO);

    // 위시리스트 추가
    int wishListAdd(WishListDTO wishListDTO);

    // 위시리스트 삭제
    int wishListDelete(int idx);

    // 위시리스트 선택 삭제
    int wishListSelectDelete(List<String> idxs);

    // 위시리스트 전체 삭제
    int wishListDeleteAll(String memberId);

    // 최근 본 상품 조회
    ArrayList<ProductDTO> recentViewSelect(String memberId);

    // 최근 본 상품 등록
    int recentViewInsert(Map<String, Object> param);

    // 주문내역 조회
    ArrayList<OrderDTO> orderSelect(String id);

    // 주문내역 상세 조회
    ArrayList<OrderDTO> orderDetailSelect(String order_id);

}
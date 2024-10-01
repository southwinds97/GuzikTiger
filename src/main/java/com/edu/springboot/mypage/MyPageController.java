package com.edu.springboot.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class MyPageController {

    @Autowired
    private IMyPageService dao;

    @RequestMapping("/myPage.do")
    public String myPage() {
        return "myPage";
    }

    // 위시리스트 조회
    @GetMapping("/wishList.do")
    public String wishList(HttpServletRequest req, HttpServletResponse res, Model model, WishListDTO wishListDTO) {
        String memberId = (String) req.getSession().getAttribute("id");

        if (memberId == null) {
            return "redirect:/login.do";
        }

        List<Map<String, Object>> wishListData = dao.wishListSelect(memberId);

        model.addAttribute("wishListData", wishListData);

        System.out.println(wishListData);

        return "wishList";
    }

    // 위시리스트 추가
    @PostMapping("/wishListAdd.do")
    @ResponseBody
    public Map<String, String> wishListInsert(HttpServletRequest req, HttpServletResponse res, Model model) {
        Map<String, String> resultMap = new HashMap<>();
        String member_id = (String) req.getSession().getAttribute("id");
        String product_id = req.getParameter("product_id");

        System.out.println("member_id: " + member_id);
        System.out.println("product_id: " + product_id);

        if (member_id == null) {
            resultMap.put("message", "로그인이 필요합니다.");
            resultMap.put("redirect", "/login.do");
            return resultMap;
        }

        WishListDTO wishListDTO = new WishListDTO();
        wishListDTO.setMember_id(member_id);
        wishListDTO.setProduct_id(product_id);

        // 중복 확인
        int check = dao.wishListCheck(wishListDTO);
        System.out.println("중복 확인 결과: " + check);
        if (check > 0) {
            resultMap.put("message", "이미 추가된 상품입니다.");
            return resultMap;
        } else {
            int result = dao.wishListAdd(wishListDTO);
            System.out.println("위시리스트 추가 결과: " + result);
            if (result > 0) {
                resultMap.put("message", "위시리스트에 추가되었습니다.");
            } else {
                resultMap.put("message", "위시리스트 추가에 실패했습니다.");
            }
            return resultMap;
        }
    }

    // 위시리스트 삭제
    @PostMapping("/deleteWishList.do")
    @ResponseBody
    public Map<String, String> deleteWishList(HttpServletRequest req, HttpServletResponse res, Model model) {
        Map<String, String> resultMap = new HashMap<>();
        int idx = Integer.parseInt(req.getParameter("idx"));
        String member_id = (String) req.getSession().getAttribute("id");

        System.out.println("idx: " + idx);

        try {
            int result = dao.wishListDelete(idx);

            System.out.println("위시리스트 삭제 결과: " + result);
            if (result > 0) {
                resultMap.put("message", "위시리스트에서 삭제되었습니다.");
            } else {
                res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resultMap.put("message", "위시리스트 삭제에 실패했습니다.");
            }
        } catch (Exception e) {
            res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resultMap.put("message", "서버 오류로 인해 위시리스트 삭제에 실패했습니다.");
        }
        return resultMap;
    }

    // 위시리스트 선택 삭제
    @PostMapping("/deleteWishListSelected.do")
    @ResponseBody
    public Map<String, String> deleteWishListSelected(HttpServletRequest req, HttpServletResponse res) {
        Map<String, String> resultMap = new HashMap<>();
        String[] idxs = req.getParameterValues("idxs[]");
        String member_id = (String) req.getSession().getAttribute("id");

        System.out.println("idxs: " + Arrays.toString(idxs));

        try {
            List<String> idxList = Arrays.asList(idxs);
            int result = dao.wishListSelectDelete(idxList);
            System.out.println("위시리스트 선택 삭제 결과: " + result);
            if (result > 0) {
                resultMap.put("message", "위시리스트에서 삭제되었습니다.");
            } else {
                res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resultMap.put("message", "위시리스트 삭제에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 로그 출력
            res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resultMap.put("message", "서버 오류로 인해 위시리스트 삭제에 실패했습니다.");
        }
        return resultMap;
    }

    // 위시리스트 전체 삭제
    @PostMapping("/deleteWishListAll.do")
    @ResponseBody
    public Map<String, String> deleteWishListAll(HttpServletRequest req, HttpServletResponse res) {
        Map<String, String> resultMap = new HashMap<>();
        String member_id = (String) req.getSession().getAttribute("id");

        try {
            int result = dao.wishListDeleteAll(member_id);
            System.out.println("위시리스트 전체 삭제 결과: " + result);
            if (result > 0) {
                resultMap.put("message", "위시리스트가 전체 삭제되었습니다.");
            } else {
                res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resultMap.put("message", "위시리스트 삭제에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 로그 출력
            res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resultMap.put("message", "서버 오류로 인해 위시리스트 삭제에 실패했습니다.");
        }
        return resultMap;
    }

    @RequestMapping("/recentView.do")
    public String recentView() {
        return "recentView";
    }

    @RequestMapping("/myPost.do")
    public String myPost() {
        return "myPost";
    }
}
package com.edu.springboot.mypage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.ParameterDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.order.OrderDTO;
import com.edu.springboot.product.ProductDTO;
import com.edu.springboot.qna.IQNAService;
import com.edu.springboot.qna.QNABoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.PagingUtil;

@Controller
public class MyPageController {

    @Autowired
    private IMyPageService dao;
    @Autowired
    private IQNAService qnadao;
    @Autowired
    private IMemberService memberDAO;

    @RequestMapping("/myPage.do")
    public String myPage(HttpServletRequest req, HttpServletResponse res, Model model, MemberDTO memberDTO) {
        // 회원정보 가져오기
        String id = (String) req.getSession().getAttribute("id");
        MemberDTO MDTO = memberDAO.viewMember(id);

        model.addAttribute("MDTO", MDTO);

        // 주문내역 가져오기
        ArrayList<OrderDTO> orderList = dao.orderSelect(id);

        // 총 주문내역 수
        int totalRecord = orderList.size();

        // 주문 내역 안에 상품 종류 수

        model.addAttribute("orderList", orderList);
        model.addAttribute("totalRecord", totalRecord);

        return "mypage/myPage";
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

        return "mypage/wishList";
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

    // 최근 본 상품 내역
    @RequestMapping("/recentView.do")
    public String selectRecentView(HttpServletRequest req, HttpServletResponse res, Model model,
            ProductDTO productDTO) {
        String memberId = (String) req.getSession().getAttribute("id");

        if (memberId == null) {
            return "redirect:/login.do";
        }

        ArrayList<ProductDTO> recentViewList = dao.recentViewSelect(memberId);
        for (ProductDTO dto : recentViewList) {
            String[] str = (dto.getOption_id_list().split(";"));
            dto.setOption_list(Arrays.asList(str));
        }
        model.addAttribute("recentViewList", recentViewList);

        return "mypage/recentView";
    }

    // @RequestMapping("/recentViewInsert.do")
    // public String insertRecentView(HttpServletRequest req, HttpServletResponse
    // res, Model model,
    // ProductDTO productDTO) {

    // dao.recentViewInsert(productDTO);
    // return "mypage/recentView";
    // }

    @RequestMapping("/myPost.do")
    public String myPost(Model model, HttpServletRequest req, QNABoardDTO qnaDTO) {
        String name = (String) req.getSession().getAttribute("name");
        ArrayList<QNABoardDTO> nameQnaList = qnadao.getnameQnaList(name);
        model.addAttribute("nameQnaList", nameQnaList);

        return "mypage/myPost";
    }

    // 주문내역 상세 조회
    @RequestMapping("/order_detailView.do")
    public String orderDetailView(HttpServletRequest req, HttpServletResponse res, Model model, OrderDTO orderDTO) {
        String order_id = req.getParameter("order_id");
        ArrayList<OrderDTO> orderDetailList = dao.orderDetailSelect(order_id);

        // 환불일자 계산
        if (!orderDetailList.isEmpty()) {
            OrderDTO order = orderDetailList.get(0);
            Date orderDate = (Date) order.getOrder_date();
            Date refundDate = new Date(orderDate.getTime() + 1000 * 60 * 60 * 24 * 1); // 주문일로부터 1일 후
            model.addAttribute("refundDate", refundDate);
        }

        model.addAttribute("orderDetailList", orderDetailList);

        return "mypage/order_detailView";
    }

}
package com.edu.springboot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.order.OrderDTO;
import com.edu.springboot.product.IProductService;
import com.edu.springboot.product.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.PagingUtil;

@Controller
public class MainController extends CommonController {

	@Autowired
	IProductService dao;

	// @Value("#{mypropsss['pageSize']}")
	private int pageSize = 5;

	// @Value("#{mypropsss['blockPage']}")
	private int blockPage = 5;

	@RequestMapping("/")
	public String productList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		String id = (String) req.getSession().getAttribute("id");
		String user_level = String.valueOf(req.getSession().getAttribute("user_level"));

		System.out.println("user_level : " + user_level);

		int totalCount = dao.getTotalCount(parameterDTO);
		model.addAttribute("totalCount", totalCount);
		int pageNum = (req.getParameter("pageNum") == null || req.getParameter("pageNum").equals(""))
				? 1
				: Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("totalCount", totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
		model.addAttribute("maps", maps);

		ArrayList<ProductDTO> lists = dao.getAllSelect(parameterDTO);
		model.addAttribute("allLists", lists);

		lists = dao.getProductNewList(parameterDTO);
		model.addAttribute("newLists", lists);

		lists = dao.getProductBestList(parameterDTO);
		model.addAttribute("bestLists", lists);

		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum,
				req.getContextPath() + "/productList.do?");
		model.addAttribute("id", id);
		model.addAttribute("user_level", user_level);
		model.addAttribute("pagingImg", pagingImg);

		return "home";
	}

	

	

}
package com.edu.springboot.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;

@Controller
public class ProductController {
	@Autowired
	IProductService dao;
			
	//@Value("#{mypropsss['pageSize']}")
	private int pageSize = 5;

	//@Value("#{mypropsss['blockPage']}")
	private int blockPage = 5;
	
	@RequestMapping("/productNewList.do")
	public String productNewList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		int totalCount = dao.getTotalCount(parameterDTO);
		model.addAttribute("totalCount", totalCount);
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))
				? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum-1) * pageSize +1;
		int end = pageNum * pageSize;
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		Map<String, Object>maps = new HashMap<String , Object>();
		maps.put("totalCount",totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
		model.addAttribute("maps",maps);
		
		ArrayList<ProductDTO> lists = dao.getProductNewList(parameterDTO);
		model.addAttribute("lists", lists);
		
		String pagingImg = 
				PagingUtil.pagingImg(totalCount, pageSize,blockPage,pageNum, req.getContextPath()+"/productList.do?");
		model.addAttribute("pagingImg",pagingImg);
					
		return "main";
	}
	
	@RequestMapping("/productBestList.do")
	public String productBestList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		int totalCount = dao.getTotalCount(parameterDTO);
		model.addAttribute("totalCount", totalCount);
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))
				? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum-1) * pageSize +1;
		int end = pageNum * pageSize;
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		Map<String, Object>maps = new HashMap<String , Object>();
		maps.put("totalCount",totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
		model.addAttribute("maps",maps);
		
		ArrayList<ProductDTO> lists = dao.getProductBestList(parameterDTO);
		model.addAttribute("lists", lists);
		
		String pagingImg = 
				PagingUtil.pagingImg(totalCount, pageSize,blockPage,pageNum, req.getContextPath()+"/productList.do?");
		model.addAttribute("pagingImg",pagingImg);
					
		return "main";
	}
		

	
	@GetMapping("/productReg.do")
	public String boardWriteGet(Model model) {
		ArrayList<CodeListDTO> mainCateList = dao.mainCategoryList();
		ArrayList<CodeListDTO> subCateList = dao.subCategoryList();
		model.addAttribute("mainCateList", mainCateList);
		model.addAttribute("subCateList", subCateList);
		return "productReg";
	}
	
//	@PostMapping("/productReg.do")
//	public String productWritePost(Model model, HttpServletRequest req) {
//		
//		String name = req.getParameter("name");
//		String title = req.getParameter("title");
//		String content = req.getParameter("content");
//	//	int result = dao.write(name , title, content);
//	//	System.out.println("글쓰기 결과:" + result);
//		return "redirect:list.do";
//	}
	
//	@RequestMapping("/view.do")
//	public String boardView(Model model, BoardDTO boardDTO) {
//		dao.visitCntPlus(boardDTO.getIdx());
//		boardDTO = dao.view(boardDTO);
//		
//		boardDTO.setContent(boardDTO.getContent().replace("\r\n","<br/>"));
//		model.addAttribute("boardDTO", boardDTO);
//		return "view";
//	}
	
//	@GetMapping("/edit.do")
//	public String boardEditGet(Model model, BoardDTO boardDTO) {
//		boardDTO = dao.view(boardDTO);
//		model.addAttribute("boardDTO", boardDTO);
//		return "edit";
//	}
	
//	@PostMapping("/edit.do")
//	public String boardEditPost(BoardDTO boardDTO) {
//		int result= dao.edit(boardDTO);
//		System.out.println("글 수정결과:"+result);
//		return "redirect:view.do?idx="+boardDTO.getIdx();
//	}
	
//	@PostMapping("/delete.do")
//	public String boardDeletePost(HttpServletRequest req) {
//		int result = dao.delete(req.getParameter("idx"));
//		System.out.println("삭제결과:"+result);
//		return "redirect:list.do";
//	}
}
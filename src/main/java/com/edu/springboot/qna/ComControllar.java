package com.edu.springboot.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;


@Controller
public class ComControllar {
	
	@Autowired
	ICommentService dao;

    @RequestMapping("/comList.do")
    public String comList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
    	
    	int totalCount = dao.getTotalCount(parameterDTO);
    	int pageSize = 2;
    	int blockPage = 10;
    	int pageNum = (req.getParameter("pageNum") == null || req.getParameter("pageNum").equals(""))
    			? 1 : Integer.parseInt(req.getParameter("pageNum"));
    	int start = (pageNum-1) * pageSize + 1;
    	int end = pageNum * pageSize;
    	parameterDTO.setStart(start);
    	parameterDTO.setEnd(end);
    	
    	Map<String, Object> maps = new HashMap<String, Object>();
    	maps.put("totalCount", totalCount);
    	maps.put("pageSize", pageSize);
    	maps.put("pageNum", pageNum);
    	model.addAttribute("maps", maps);
    	
    	ArrayList<CommentDTO> comlists = dao.listCom(parameterDTO);
    	model.addAttribute("comlists", comlists);
    	System.out.println("Comlists:" + comlists);
    	
    	String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"/qnaList.do?");
    	model.addAttribute("pagingImg", pagingImg);
    	
        return "comList";
    }

    @GetMapping("/comWrite.do")
    public String comWriteGet(Model model) {
        return "comWrite";
    }
    
    
    @PostMapping("/comWrite.do")
    public String comWritePost(Model model, HttpServletRequest req, CommentDTO comDTO) {
    	 	
    	String board_idx = req.getParameter("board_idx");
    	String name = req.getParameter("name");
    	String comments = req.getParameter("comments");
    	
    	comDTO.setBoard_idx(board_idx);
    	comDTO.setName(name);
    	comDTO.setComments(comments);
    	
    	dao.write(comDTO);
    	
    	
        return "redirect:qnaView.do?idx="+board_idx;
    }
    
	/*
	 * @GetMapping("/comEdit.do") public String comEditGet(Model model, CommentdDTO
	 * comDTO) { qnaDTO = dao.view(qnaDTO); model.addAttribute("qnaDTO", qnaDTO);
	 * return "qnaEdit"; }
	 */
    
    @PostMapping("/comEdit.do")
    public String comEditPost(CommentDTO comDTO, HttpServletRequest req) {
    	
    	return "redirect:qnaView.do?idx="+ comDTO.getIdx();
    }
    
    @PostMapping("/comDelete.do")
    public String comDeletePost(HttpServletRequest req) {
    	int result = dao.delete(req.getParameter("idx"));
    	
    	return "redirect:qnaList.do";
    }
}


package com.edu.springboot.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;

@Controller
public class ComControllar {

	@Autowired
	ICommentService dao;

	@RequestMapping("/comList.do")
	public String comList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		// idx값을 가져온다.
		String idx = req.getParameter("idx");

		ArrayList<CommentDTO> comlists = dao.listCom(idx);
		model.addAttribute("comlists", comlists);
		System.out.println("Comlists:" + comlists);

		return "qna/comList"; // comList.jsp를 반환
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

		return "redirect:qnaView.do?idx=" + board_idx;
	}

	@GetMapping("/comEdit.do")
	public String getComment(@RequestParam("idx") String idx, Model model, CommentDTO comDTO) {
		CommentDTO comment = dao.getCommentEdit(idx);
		model.addAttribute("comment", comment);
		return "qna/comEdit"; // comEdit.jsp를 반환
	}

	@PostMapping("/comEdit.do")
	@ResponseBody
	public Map<String, String> comEdit(@RequestBody CommentDTO comment) {
		Map<String, String> response = new HashMap<>();
		try {
			dao.updateComment(comment);
			response.put("status", "success");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
		}
		return response;
	}

	@PostMapping("/comDelete.do")
	@ResponseBody
	public Map<String, String> comDelete(@RequestParam("idx") String idx) {
		Map<String, String> response = new HashMap<>();
		System.out.println("idx:" + idx);
		try {
			dao.deleteComment(idx);
			response.put("status", "success");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
		}
		return response;
	}
}

package com.edu.springboot.qna;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import utils.MyFunctions;
import utils.PagingUtil;

@Controller
public class QNAControllar {

	@Autowired
	IQNAService dao;
	ICommentService comDao;

	@RequestMapping("/qnaList.do")
	public String qnaList(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {

		int totalCount = dao.getTotalCount(parameterDTO);
		int pageSize = 10;
		int blockPage = 5;
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

		ArrayList<QNABoardDTO> lists = dao.listPage(parameterDTO);
		model.addAttribute("lists", lists);

		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum,
				req.getContextPath() + "/qnaList.do?");
		model.addAttribute("pagingImg", pagingImg);

		return "qna/qnaList";
	}

	@RequestMapping("/qnaView.do")
	public String qnaView(Model model, QNABoardDTO qnaDTO, CommentDTO comDTO) {
		qnaDTO = dao.view(qnaDTO);
		qnaDTO.setContent(qnaDTO.getContent().replace("\r\n", "<br/>"));
		model.addAttribute("qnaDTO", qnaDTO);
		model.addAttribute("board_idx", qnaDTO.getIdx());

		return "qna/qnaView";
	}

	@GetMapping("/qnaWrite.do")
	public String qnaWriteGet(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		String name = (String) req.getSession().getAttribute("name");

		if (id == null) {
			return "redirect:login.do";
		}

		model.addAttribute("id", id);
		model.addAttribute("name", name);
		return "qna/qnaWrite";
	}

	@PostMapping("/qnaWrite.do")
	public String qnaWritePost(Model model, HttpServletRequest req, QNABoardDTO qnaDTO) {

		try {
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:" + uploadDir);

			Part part = req.getPart("ofile");
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader=" + partHeader);
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"", "");
			String savedFileName = null;
			
			if (!originalFileName.isEmpty()) {
				part.write(uploadDir + File.separator + originalFileName);
				savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
			}

			qnaDTO.setOfile(originalFileName);
			qnaDTO.setSfile(savedFileName);
			
			System.out.println(qnaDTO);
			dao.write(qnaDTO);
		} catch (Exception e) {
			System.out.println("업로드 실패");
			e.printStackTrace();
		}

		return "redirect:qnaList.do";
	}

	@GetMapping("/qnaEdit.do")
	public String qnaEditGet(Model model, QNABoardDTO qnaDTO) {
		qnaDTO = dao.view(qnaDTO);
		model.addAttribute("qnaDTO", qnaDTO);
		return "qna/qnaEdit";
	}

	@PostMapping("/qnaEdit.do")
	public String qnaEditPost(QNABoardDTO qnaDTO, HttpServletRequest req) {
		try {
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:" + uploadDir);

			Part part = req.getPart("ofile");
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader=" + partHeader);
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"", "");
			String savedFileName = null;
			
			if (!originalFileName.isEmpty()) {
				part.write(uploadDir + File.separator + originalFileName);
				savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
			}


			qnaDTO.setOfile(originalFileName);
			qnaDTO.setSfile(savedFileName);
			System.out.println(qnaDTO);
			dao.edit(qnaDTO);
		} catch (Exception e) {
			System.out.println("업로드 실패");
			e.printStackTrace();
		}
		return "redirect:qnaView.do?idx=" + qnaDTO.getIdx();
	}

	@PostMapping("/delete.do")
	public String qnaDeletePost(HttpServletRequest req) {
		int result = dao.delete(req.getParameter("idx"));

		return "redirect:qnaList.do";
	}
}

package com.edu.springboot.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QNAControllar {

    @RequestMapping("/qnaList.do")
    public String qnaList() {
        return "qnaList";
    }

    @RequestMapping("/qnaView.do")
    public String qnaView() {
        return "qnaView";
    }

    @RequestMapping("/qnaWrite.do")
    public String qnaWrite() {
        return "qnaWrite";
    }
}

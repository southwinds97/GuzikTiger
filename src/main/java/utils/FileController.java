package utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@RestController
public class FileController {

    @Value("${file.upload-dir}")
    private String uploadDir;

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        try {
            String serverFileName = FileUploadUtil.uploadFile(file, uploadDir);
            return "파일 업로드 성공: " + serverFileName;
        } catch (IOException e) {
            e.printStackTrace();
            return "파일 업로드 실패: " + e.getMessage();
        }
    }

    @GetMapping("/download")
    public void downloadFile(@RequestParam("sfileName") String sfileName,
            @RequestParam("ofileName") String ofileName,
            @RequestParam("directory") String directory,
            HttpServletRequest req, HttpServletResponse resp) {
        try {
            FileDownloadUtil.downloadFile(sfileName, ofileName, directory, req, resp);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
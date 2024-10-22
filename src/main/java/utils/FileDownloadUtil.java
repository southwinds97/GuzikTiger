package utils;

import java.io.*;

import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class FileDownloadUtil {

    public void downloadFile(String sfileName, String ofileName, String directory, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 절대 경로를 직접 설정
        String absolutePath = new File(directory).getAbsolutePath();
        File file = new File(absolutePath, sfileName);

        // 디버깅 로그 추가
        System.out.println("Absolute Path: " + absolutePath);
        System.out.println("File Path: " + file.getAbsolutePath());

        if (!file.exists()) {
            throw new FileNotFoundException("파일을 찾을 수 없습니다: " + file.getAbsolutePath());
        }

        try (InputStream iStream = new FileInputStream(file);
             OutputStream oStream = resp.getOutputStream()) {

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            } else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length());

            // 출력 스트림에 파일 내용 출력
            byte[] b = new byte[1024];
            int readBuffer;
            while ((readBuffer = iStream.read(b)) != -1) {
                oStream.write(b, 0, readBuffer);
            }
        } catch (IOException e) {
            throw new IOException("파일 다운로드 중 오류가 발생했습니다.", e);
        }
    }
}
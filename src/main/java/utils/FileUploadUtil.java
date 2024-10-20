package utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class FileUploadUtil {

    public static String uploadFile(MultipartFile file, String uploadDir) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("파일이 비어 있습니다.");
        }

        // 원본 파일명과 서버에 저장될 파일명 생성
        String originalFileName = file.getOriginalFilename();
        String serverFileName = UUID.randomUUID().toString() + "_" + originalFileName;

        // 파일 저장 경로 설정
        Path path = Paths.get(uploadDir + File.separator + serverFileName);
        Files.copy(file.getInputStream(), path);

        return serverFileName;
    }
}
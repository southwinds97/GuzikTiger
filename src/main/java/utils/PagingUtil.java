package utils;

public class PagingUtil {
    
    public static String pagingImg(
        int totalRecordCount,
        int pageSize,
        int blockPage,
        int pageNum,
        String page) {
        
        String pagingStr = "<div class='paginate'>";
        
        //1.전체페이지 구하기
        int totalPage = (int)(Math.ceil(((double)totalRecordCount/pageSize)));
        
        /*2.현재페이지번호를 통해 이전 페이지블럭에
        해당하는 페이지를 구한다.
        */
        int intTemp = 
            (((pageNum-1) / blockPage) * blockPage) + 1;
        
        //3.처음페이지 바로가기 & 이전페이지블럭 바로가기
        if(intTemp != 1) {
            //첫번째 페이지 블럭에서는 출력되지 않음
            //두번째 페이지 블럭부터 출력됨.
            pagingStr += "<a href='"+page+"pageNum=1' class='first'></a>";
            pagingStr += "<a href='"+page+"pageNum="+(intTemp-blockPage)+"'></a>";
        }
        
        //페이지표시 제어를 위한 변수
        int blockCount = 1;
        pagingStr += "<ol>";
        /*
        4.페이지를 뿌려주는 로직 : blockPage의 수만큼 또는
            마지막페이지가 될때까지 페이지를 출력한다.
        */
        while(blockCount<=blockPage && intTemp<=totalPage)
        {
            if(intTemp==pageNum) {
                pagingStr += "<li class='xans-record'><a href='#' class='this'>"+intTemp+"</a></li>";
            }
            else {
                pagingStr += "<li class='xans-record'><a href='"+page+"pageNum="+intTemp+"'>"+intTemp+"</a></li>";
            }
            intTemp++;
            blockCount++;
        }
        pagingStr += "</ol>";
        
        //5.다음페이지블럭 & 마지막페이지 바로가기
        if(intTemp <= totalPage) {
            pagingStr += "<a href='"+page+"pageNum="+intTemp+"' class='next_button'></a>";
            pagingStr += "<a href='"+page+"pageNum="+totalPage+"' class='last'></a>";
        }
        
        pagingStr += "</div>";
        return pagingStr;
    }
}
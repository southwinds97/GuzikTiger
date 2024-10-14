package com.edu.springboot.mypage;

import lombok.Data;

@Data
public class WishListDTO {
    private int idx;
    private String member_id;
    private String product_id;
    private int start;
    private int end;
}

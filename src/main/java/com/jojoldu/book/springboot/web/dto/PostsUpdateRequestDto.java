package com.jojoldu.book.springboot.web.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
public class PostsUpdateRequestDto {
    private String title;
    private String content;

    @Builder
    public PostsUpdateRequestDto(Long id, String title, String content, String author) {
        this.title = title;
        this.content = content;
    }
}

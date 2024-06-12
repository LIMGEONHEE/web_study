package com.itwill.spring2.dto;

import java.time.LocalDateTime;

import com.itwill.spring2.repository.Post;

import lombok.Data;

@Data
// 업데이트 요청의 요청 파라미터들을 저장하기 위한 DTO
public class PostUpdateDto {
	
	private Integer id;
	private String title;
	private String content;
	private String author;

	
	public Post toEntity() {
		return Post.builder()
					.id(id)
					.title(title)
					.content(content)
					.author(author)
					.build();
	}
	
}

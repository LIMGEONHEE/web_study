package com.itwll.spring2.service;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.spring2.dto.CommentItemDto;
import com.itwill.spring2.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/application-context.xml"})
public class CommentServiceTest {

		@Autowired private CommentService commentService;
		
		@Test
		public void testReadyByPostId() {
			List<CommentItemDto>list = commentService.readByPostId(42);
			for (CommentItemDto dto : list) {
				log.debug(dto.toString());
			}
		}
}

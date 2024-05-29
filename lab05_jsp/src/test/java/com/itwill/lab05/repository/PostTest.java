package com.itwill.lab05.repository;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PostTest {
	private static final Logger log = LoggerFactory.getLogger(PostTest.class);
	
	private PostDao dao = PostDao.INSTANCE; // singleton 객체

	// JUnit 모듈에서 단위 테스트를 하기 위해서 호출하는 메서드.
	// (1) public void. (2) 아규먼트를 갖지 않음. 
//	@Test // 에너테이션만 지우면 이 메소드는 실행되지 않는다.
	public void test() {
		// Post 타입 객체 생성 - Builder 디자인 패턴.
		Post p = Post.builder()
				.title("테스트")
				.author("관리자")
				.id(1)
				.content("builder design pattern")
				.build();
		
		// assertNotNull(arg): arg가 null이 아니면 JUint 테스트 성공, null이면 테스트 실패.
		// assertNull(arg): arg가 null이면 단위 테스트 성공, null이 아니면 테스트 실패.
		Assertions.assertNotNull(p);
		log.debug("p = {}", p);
	}
	
//	@Test
	public void testPSelect() {
		Assertions.assertNotNull(dao); // PostDao 타입 객체가 null이 아니면 단위 테스트 성공.
		log.debug("dao = {}", dao);
		
		List<Post> result = dao.select();
		Assertions.assertEquals(4, result.size()); // assert: 주장하다. assertEquls(기대되는 값, 실제 값): 두 개의 값이 같으면 성공, 다르면 실패.
		for (Post p : result) {
			log.debug(p.toString());
		}
	}
	
//	@Test
	public void testInsert() {
		// PostDao.insert 메서드 단위 테스트
		Post post = Post.builder()
				.title("insert 테스트")
				.content("JDBC, Connection Pool test")
				.author("admin")
				.build();
		
		int result = dao.insert(post); // PostDao의 insert 메서드 호출.
		Assertions.assertEquals(1, result); 
		//-> insert 메서드의 리턴 값(삽입된 행의 개수)가 1이면 단위 테스트 성공.
	}
	
//	@Test
	public void testDelete() {
		// PostDao.delete 메서드 단위 테스트
		int result = dao.delete(2); // id(PK)가 있는 경우
		Assertions.assertEquals(1, result); 
		
		result = dao.delete(100); // id(PK)가 없는 경우
		Assertions.assertEquals(0, result); 
	}
	
	@Test
	public void testSelectById() {
		Post post = dao.select(1); // id=1(PK)가 테이블에 있는 경우
		Assertions.assertNotNull(post);
		log.debug(post.toString());
		
		post = dao.select(0); // id=0(PK)가 테이블에 없는 경우
		Assertions.assertNull(post);
	}
}
package com.itwill.lab05.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.lab05.datasource.DataSourceUtil;
import com.zaxxer.hikari.HikariDataSource;

// Dao(Data Access Object). 데이터베이스 CRUD.
public enum UserDao {
	INSTANCE;

	private static final Logger log = LoggerFactory.getLogger(UserDao.class);

	private final HikariDataSource ds = DataSourceUtil.getInstance().getDataSource();

	// users 테이블에 insert SQL 문장 & 메서드
	private static final String SQL_INSERT = "insert into users (userid, password, email) values(?, ?, ?)";

	public int insert(User user) {
		log.debug("insert({})", user);
		log.debug(SQL_INSERT);

		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(SQL_INSERT);
			stmt.setString(1, user.getUserid());
			stmt.setString(2, user.getPassward());
			stmt.setString(3, user.getEmail());
			result = stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResources(conn, stmt);
		}
		return result;
	}

	// finally 안쪽 부분 리팩토링
	private void closeResources(Connection conn, Statement stmt, ResultSet rs) {
		// DB 자원들을 해제하는 순서: 생성된 순서의 반대로. rs -> stmt -> conn
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 오버로딩
	private void closeResources(Connection conn, Statement stmt) {
		closeResources(conn, stmt, null);
	}
}
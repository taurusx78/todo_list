package todo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TodoDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public TodoDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			
			dataFactory = (DataSource)envContext.lookup("jdbc/mysql");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public int addTodo(TodoDto todo) {
		int result = 0;
		
		try {
			conn = dataFactory.getConnection();
			String query = "INSERT INTO todo(title, name, sequence) VALUES(?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, todo.getTitle());
			pstmt.setString(2, todo.getName());
			pstmt.setInt(3, todo.getSequence());
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<TodoDto> getTodos() {
		List<TodoDto> todos = new ArrayList<>();
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM todo ORDER BY regdate";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Long id = rs.getLong("id");
				String name = rs.getString("name");
				String regDate = rs.getString("regDate");
				int sequence = rs.getInt("sequence");
				String title = rs.getString("title");
				String type = rs.getString("type");
				TodoDto todo = new TodoDto(id, name, regDate, sequence, title, type);
				todos.add(todo);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return todos;
	}
	
	public int updateTodo(TodoDto todo) {
		int result = 0;
		
		try {
			conn = dataFactory.getConnection();
			String query = "UPDATE todo SET type=? WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, todo.getType());
			pstmt.setLong(2, todo.getId());
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}

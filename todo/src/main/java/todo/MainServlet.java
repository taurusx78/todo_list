package todo;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TodoDao dao = new TodoDao();
		List<TodoDto> todos = dao.getTodos();
		request.setAttribute("todos", todos);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("main.jsp");
		dispatch.forward(request, response);
	}
}
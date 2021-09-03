package todo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/type")
public class TodoTypeServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		String type = request.getParameter("type");
		
		TodoDao dao = new TodoDao();
		int update;

		if (type.equals("TODO")) {
			update = dao.updateTodo(new TodoDto(id, "DOING"));
		} else {
			update = dao.updateTodo(new TodoDto(id, "DONE"));
		}
		
		PrintWriter out = response.getWriter();

		if(update != 0) {
			out.print("success");
		}
	}
}
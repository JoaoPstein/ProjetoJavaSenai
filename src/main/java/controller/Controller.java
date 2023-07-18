package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dao;

import java.io.IOException;

@WebServlet(urlPatterns = { "/Controller", "/main", "/insert", "/select", "/update", "/delete", "/report" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Dao dao = new Dao();

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.print(action);
		if (action.equals("/main")) {
			List(request, response);
		}else if(action.equals("/insert")) {
			Create(request, response);
		}
		else {
			response.sendRedirect("index.html");
		}
	}

	protected void List(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("client.jsp");
	}

	protected void Create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}

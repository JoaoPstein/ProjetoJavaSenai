package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dao;
import model.JavaBeans;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = { "/controller", "/main", "/insert", "/select", "/update", "/delete", "/report" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Dao dao = new Dao();
	JavaBeans client = new JavaBeans();

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if (action.equals("/main")) {
			Clients(request, response);
		} else if (action.equals("/insert")) {
			Create(request, response);
		} else if (action.equals("/select")) {
			List(request, response);
		} else if (action.equals("/update")) {
			UpdateClient(request, response);
		} else if (action.equals("/delete")) {
			DeleteClient(request, response);
		} else {
			response.sendRedirect("index.html");
		}
	}

	protected void Clients(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<JavaBeans> list = dao.listClients();
		request.setAttribute("clients", list);
		RequestDispatcher rd = request.getRequestDispatcher("client.jsp");
		rd.forward(request, response);
	}

	protected void List(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		client.setId(request.getParameter("id"));
		dao.getClientByName(client);
		request.setAttribute("id", client.getId());
		request.setAttribute("name", client.getName());
		request.setAttribute("personType", client.getPersonType());
		request.setAttribute("address", client.getAddress());
		request.setAttribute("registration", client.getRegistration());
		request.setAttribute("enrollmentModality", client.getEnrollmentModality());
		RequestDispatcher rd = request.getRequestDispatcher("editar.jsp");
		rd.forward(request, response);
	}

	protected void Create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		client.setName(request.getParameter("name"));
		client.setPersonType(request.getParameter("personType"));
		client.setAddress(request.getParameter("address"));
		client.setRegistration(request.getParameter("registration"));
		client.setEnrollmentModality(request.getParameter("enrollmentModality"));

		dao.insertClient(client);
		response.sendRedirect("main");
	}

	protected void UpdateClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		client.setId(request.getParameter("id"));
		client.setName(request.getParameter("name"));
		client.setPersonType(request.getParameter("personType"));
		client.setAddress(request.getParameter("address"));
		client.setRegistration(request.getParameter("registration"));
		client.setEnrollmentModality(request.getParameter("enrollmentModality"));
		dao.updateClient(client);
		response.sendRedirect("main");
	}

	protected void DeleteClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		client.setId(request.getParameter("id"));
		dao.deleteClient(client);
		response.sendRedirect("main");
	}
}

package be.vdab.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index.htm")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<! doctype html>");
		out.println("<head><title>Pizza Luigi</title>");
		out.println("</head>");
		out.println("<body><h1>");
		int uur = LocalDateTime.now().getHour();
		out.println(uur>=6 && uur<=12?"Goedemorgen":uur>12 && uur<18?"Goedemiddag":"Goedenavond");
		out.println("</h1></body></html>");
	}

}
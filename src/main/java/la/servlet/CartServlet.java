package cart.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	try {
		String action = request.getParameter("action");
		if (action == null || action.length() == 0 || action.equals("show")) {
		gotoPage(request, response, "/cart.jsp");
		} else if (action.equals("add")) {
		int code = Integer.parseInt(request.getParameter("item_code"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		HttpSession session = request.getSession(true);
		CartBean cart = (CartBean)session.getAttribute("cart");
		if (cart == null) {
		cart = new CartBean();
		session.setAttribute("cart", cart);
		}
		ItemDAO dao = new ItemDAO();
		ItemDAO bean = dao.find.ByPrimaryKey(code);
		
		cart.addCart(bean, quantity);
		gotoPage(request, response, "/cart.jsp");
	}else if (action.equals(*delete)) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			request.setAttribute("message",
		"セッションが切れています。もう一度トップページより操作してください。")；
			gotoPage(requeat, response, "/errInternal.jsp");
			return;
		}
		CartBean cart = ((CartBean)session.getAttribute("cart");
		if(cart == null) {
			request.setAttribute("message", "正しく操作してください。");
			gotoPage(request, response, "/errInternal.jsp");
			return;
		}
		int code = Integer.parseInt(request.getParameter("item_code"));
		cart.deleteCart(code);
		gotoPage(request, response, "/cart.jsp");
	}else{
		request.setAttribute("message", "正しく操作してください。");
		gotoPage(request, response, "/errInternal.jsp");
	}	
} catch (DAOException e) {
		e.printStackTrace();
		request.setAttribute("message", "内部エラーが発生しました。")；
		gotoPage(request, response, "/errInternal.jsp");
		}
	}

private void gotoPage(HttpServletRequest request,
		HttpServletResponse response, String page) throws ServletException,
		IOException {
	RequestDispatcher rd = request.getRequestDispatcher(page);
	rd.forward(request, response);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

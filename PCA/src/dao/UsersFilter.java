package dao;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.String;
import java.util.StringTokenizer;

/**
 * 鐢ㄦ埛璁块棶鏉冮檺鐨勮繃婊ゅ櫒
 * 
 * @author viano
 */
public class UsersFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {// 璁剧疆璇锋眰鐨勫瓧绗︾紪鐮�
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Object o = session.getAttribute("ID");

		String url = req.getRequestURL().toString();
		String queryString = ((HttpServletRequest) request).getQueryString();
		String str = queryString;
//		System.out.println(url);
//		System.out.println(str);
		String ID = (String) req.getSession().getAttribute("ID");

		if (str != null) {

			if (queryString.equals("page=1") || queryString.equals("page=2") || queryString.equals("page=3")
					|| queryString.equals("page=4") || queryString.equals("page=5") || queryString.equals("page=6")
					|| queryString.equals("page=7")) {
				chain.doFilter(request, response);
				res.setHeader("Cache-Control", "no-store");
				res.setDateHeader("Expires", 0);
				res.setHeader("Pragma", "no-cache");
				res.flushBuffer();
			} else {
				request.setAttribute("alter", "2");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else if (!url.contains("index.jsp") && ID == null && url.contains(".jsp")) {
			request.setAttribute("alter", "2");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			chain.doFilter(request, response);
			res.setHeader("Cache-Control", "no-store");
			res.setDateHeader("Expires", 0);
			res.setHeader("Pragma", "no-cache");
			res.flushBuffer();
		}

	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}

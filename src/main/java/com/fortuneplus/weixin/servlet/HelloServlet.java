package com.fortuneplus.weixin.servlet;

import com.fortuneplus.weixin.po.AccessToken;
import com.fortuneplus.weixin.util.WeixinUtil;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;



public class HelloServlet extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
AccessToken accessToken = WeixinUtil.getAccessToken();
System.out.println("票据"+accessToken.getToken());
System.out.println("有效时间"+accessToken.getExpiresIn());

		// 微信加密签名
		String signature = req.getParameter("signature");
		// 随机字符串
		String echostr = req.getParameter("echostr");
		// 时间戳
		String timestamp = req.getParameter("timestamp");
		// 随机数
		String nonce = req.getParameter("nonce");

System.out.println("signature:" + signature);
System.out.println("echostr:" + echostr);
System.out.println("timestamp:" + timestamp);
System.out.println("nonce:" + nonce);




		resp.sendRedirect("/weixin/table.jsp");




		PrintWriter out = resp.getWriter();
//		if(CheckUtil.checkSignature(signature, timestamp, nonce)){
//			out.print(echostr);
		out.print("123");


	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		Map<String, String[]> map = req.getParameterMap();
		PrintWriter out = resp.getWriter();

		String option = req.getParameter("jijin");

		//get

		// post
		InputStream in = req.getInputStream();
//		System.out.println(IOUtils.toString(in));


		try {
			String message = "123";
			System.out.println(message);
			out.print("恭喜通过测试！\n");
			out.print("您的选择是：" + option);

		} finally{
			out.close();
		}
	}
}

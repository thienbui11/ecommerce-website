//package com.ecommerce.controller.shop.customer;
//
//import com.ecommerce.model.entity.Customer;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(name = "CustomerLoginServlet", value = "/forgotPassword")
//public class ForgotPasswordServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
//    }
//
//    /**
//     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        response.setContentType("text/html;charset=UTF-8");
//
//        try {
//            String emailAddress = request.getParameter("email");
//            String username = request.getParameter("username");
//
//            Customer customer = dao.checkAccountExistByUsernameAndEmail(username, emailAddress);
//            if(account == null) {
//                request.setAttribute("error", "Email hoac username sai!");
//            }
//            if(account != null) {
//                Email email =new Email();
//                email.setFrom("huynhminhduc01082001@gmail.com");
//                email.setFromPassword("wtxzwokuzbxmhodm");
//                email.setTo(emailAddress);
//                email.setSubject("Forgot Password Function");
//                StringBuilder sb = new StringBuilder();
//                sb.append("Dear ").append(username).append("<br>");
//                sb.append("You are used the forgot password. <br> ");
//                sb.append("Your password is <b>").append(account.getPass()).append(" </b> <br>");
//                sb.append("Regards<br>");
//                sb.append("Administrator");
//
//                email.setContent(sb.toString());
//                EmailUtils.send(email);
//
//                request.setAttribute("mess", "Mat khau da duoc gui den email cua ban!");
//
//
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
//    }
//}


package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            
            
//            fetching all the data

            String check = request.getParameter("check");
            if(check == null){
                out.println("Please check the Terms & Conditions.");
            }else{
                //fething rest of the data
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String about = request.getParameter("about");
                
                //creating new User object so to send that data to dao object
                User user = new User(name, email, password, about);
                
                //create a UserDao Object
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                if(dao.saveUser(user)){
                    out.println("Done");
                }else{
                    out.println("error");
                }
            }


        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

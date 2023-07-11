
package com.blog.servlets;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
//                fetching data
                int cid = Integer.parseInt(request.getParameter("cid"));
                String pTitle = request.getParameter("pTitle");
                String pContent = request.getParameter("pContent");
                Part part = request.getPart("pic");
                //getting current user id
                HttpSession session = request.getSession();
                User user = (User)session.getAttribute("currentUser");
                
                
////                out.println(cid);
////                out.println(pTitle);
////                out.println(pContent);
////                out.println(part.getSubmittedFileName());
//                
                
                
                Post p = new Post(pTitle, pContent, part.getSubmittedFileName(), null, cid, user.getId());
//                out.println("post created");
                
//                out.println(p.getpTitle());
//                out.println(p.getpContent());
//                out.println(p.getpPic());
//                out.println(p.getCatId());
//                out.println(p.getUserId());

                PostDao dao = new PostDao(ConnectionProvider.getConnection());
//                out.println("doa created");

                if(dao.savePost(p)){
                    String path = request.getServletContext().getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
//                    out.println(path);
                    Helper.saveFile(part.getInputStream(), path);
                    out.println("done");
                    
                    
                }else{
                    out.println("error");
                }
                
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
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

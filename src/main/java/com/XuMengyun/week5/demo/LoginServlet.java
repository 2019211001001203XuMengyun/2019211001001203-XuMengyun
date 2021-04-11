package com.XuMengyun.week5.demo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet(name = "LoginServlet",value = "/login")
public class LoginServlet extends HttpServlet {
    public Connection dbConn=null;
    @Override
    public void init() {

        try {
            Class.forName(getServletConfig().getServletContext().getInitParameter("driver"));
            dbConn = DriverManager.getConnection(getServletConfig().getServletContext().getInitParameter("url"), getServletConfig().getServletContext().getInitParameter("username"), getServletConfig().getServletContext().getInitParameter("password"));
            System.out.println(dbConn);
        } catch (Exception e) {
            System.out.println(e);
        }

        dbConn=(Connection)getServletContext().getAttribute("con");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String passwork = request.getParameter("passwork");
        Statement createDbStatement = null;
        PrintWriter writer = response.getWriter();
        boolean find = false;
        try {
            createDbStatement = dbConn.createStatement();
            String dbRequire = "select * from usertable where username='" + username + "' and passwork='" + passwork + "'";
            System.out.println(dbRequire);
            ResultSet resultDb = createDbStatement.executeQuery(dbRequire);
            if (resultDb.next()) {
                find = true;
          //      writer.println("Login success!!!");
           //     writer.println("welcome," + username);

                request.setAttribute("id",resultDb.getInt("id"));
                request.setAttribute("username",resultDb.getString("username"));
                request.setAttribute("passwork",resultDb.getString("passwork"));
                request.setAttribute("email",resultDb.getString("mail"));
                request.setAttribute("gender",resultDb.getString("sex"));
                request.setAttribute("birthdate",resultDb.getString("birth"));
                request.getRequestDispatcher("userInfo.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        if (!find)
           // writer.println("username or password Error!!!");
            request.setAttribute("massage","username or Password Error!!!");
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
    }

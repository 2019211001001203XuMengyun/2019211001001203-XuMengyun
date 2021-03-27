package com.XuMengyun.week3.demo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
//automatic -new --> servlet
@WebServlet(name = "RegisterServlet",value = "/register")
public class RegisterServlet extends HttpServlet {
    public Connection dbConn;
    public void init()  {
        try {
            Class.forName(getServletConfig().getServletContext().getInitParameter("driver"));
            dbConn= DriverManager.getConnection(getServletConfig().getServletContext().getInitParameter("url"),getServletConfig().getServletContext().getInitParameter("username"),getServletConfig().getServletContext().getInitParameter("password"));
            System.out.println(dbConn);
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String username=request.getParameter("username");
        String passwork=request.getParameter("passwork");
        String email=request.getParameter("email");
        String gender=request.getParameter("gender");
        String birthdate=request.getParameter("birthdate");
        PrintWriter writer=response.getWriter();
//     writer.println("<br>id:"+id);
//      writer.println("<br>username:"+username);
//        writer.println("<br>passwork:"+passwork);
//        writer.println("<br>email:"+email);
//       writer.println("<br>gender:"+gender);
//       writer.println("<br>birthdate:"+birthdate);
       System.out.println("gotted");
       System.out.println(birthdate);
        String[][] ret=new String[100][8];
        int cnt=0;
        try {
            System.out.println("try cn");
            Statement createDbStatement = dbConn.createStatement();
            String dbRequire1="insert into usertable values('"+id+"','"+username+"','"+passwork+"','"+email+"','"+gender+"','"+birthdate+"')";
            System.out.println(dbRequire1);
            createDbStatement.executeUpdate(dbRequire1);
            String dbRequire="select * from usertable";
            ResultSet resultDb=createDbStatement.executeQuery(dbRequire);
            while(resultDb.next()) {
                ret[cnt][0]=resultDb.getObject(1).toString().trim();
                ret[cnt][1]=resultDb.getObject(2).toString().trim();
                ret[cnt][2]=resultDb.getObject(3).toString().trim();
                ret[cnt][3]=resultDb.getObject(4).toString().trim();
                ret[cnt][4]=resultDb.getObject(5).toString().trim();
                ret[cnt++][5]=resultDb.getObject(6).toString().trim();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        writer.println("<table border=\"1\">");
        writer.println("<tr><td>id</td><td>username</td><td>passwork</td><td>email</td><td>gender</td><td>birthdate</td></tr>");
        for(int i=0;i<cnt;i++) {
//            writer.println("<tr><td>"+(i+1)+"</td>");
            writer.println("<tr>");
            for(int j=0;j<6;j++) {
                writer.println("<td>"+ret[i][j]+"</td>");
            }
            writer.println("</tr>");
        }
        writer.println("</table>");
    }
}
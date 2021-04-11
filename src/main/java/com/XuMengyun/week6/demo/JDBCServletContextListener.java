package com.XuMengyun.week6.demo;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
@WebListener()
public class JDBCServletContextListener implements ServletContextListener{
    public Connection dbConn;
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("i am in contextInitialized()");
        try {
            dbConn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("i am in contextDestroyed()");
        try {
            Class.forName(sce.getServletContext().getInitParameter("driver"));
            dbConn= DriverManager.getConnection(sce.getServletContext().getInitParameter("url"),sce.getServletContext().getInitParameter("username"),sce.getServletContext().getInitParameter("password"));
            System.out.println(dbConn);
        } catch (Exception e) {
            System.out.println("shown"+e);
        }
        sce.getServletContext().setAttribute("con",dbConn);
    }


}
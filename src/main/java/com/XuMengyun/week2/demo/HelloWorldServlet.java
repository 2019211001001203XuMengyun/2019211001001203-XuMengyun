package com.XuMengyun.week2.demo;


import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;
        import java.io.PrintWriter;


public class HelloWorldServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer=response.getWriter();
    writer .println("Name:XuMengyun");
    writer .println("Id:2019211001001203");
writer .println("email:1515093013@qq.com");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) {

    }
}
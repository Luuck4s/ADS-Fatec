/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author lucas
 */
public class Tasks {
    
    public static ArrayList<String> getTasks() throws Exception{
        ArrayList<String> list = new ArrayList();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM tasks");
        
        while(rs.next()){
            list.add(rs.getString("name"));
        }
        
        stmt.close();
        rs.close();
        con.close();
        
        return list;
    }
    
    public static void addTask(String taskName) throws Exception {
        ArrayList<String> list = new ArrayList();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("insert into tasks values('"+ taskName + "')");
    }
    
    public static void removeTask(String taskName) throws Exception {
        ArrayList<String> list = new ArrayList();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("delete from tasks where name = '"+ taskName + "'");
    }
}

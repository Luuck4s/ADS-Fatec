/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.Task;
import web.lucasDbListener;

/**
 *
 * @author lucas
 */
public class LucasTasks {

    public static ArrayList<Task> getTasks(String user) throws Exception {
        ArrayList<Task> list = new ArrayList();
        Connection con = lucasDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM lucas_tasks WHERE user = '" + user + "'");
        System.out.print(rs);
        while (rs.next()) {
            list.add(new Task(
                rs.getString("titulo"),
                rs.getInt("id"),
                rs.getString("user")
            ));
        }

        stmt.close();
        rs.close();
        con.close();

        return list;
    }

    public static void addTask(String taskName, String user) throws Exception {
        ArrayList<String> list = new ArrayList();
        Connection con = lucasDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("insert into lucas_tasks (id, titulo, user) values(null,'" + taskName + "','" + user + "')");
    }

    public static void removeTask(Integer id) throws Exception {
        ArrayList<String> list = new ArrayList();
        Connection con = lucasDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("delete from lucas_tasks WHERE id = " + id + "");
    }
}

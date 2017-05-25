package com.neo4j.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.neo4j.jdbc.Driver;
import org.neo4j.kernel.impl.nioneo.store.Record;
import org.neo4j.shell.Session;
public class Neo4jConnection {
	public static Connection conn = null;
	public static Connection getConn(){
		try {  
			conn = DriverManager.getConnection("jdbc:neo4j://localhost:7474/","neo4j","033532");  //创建连接
            conn.setAutoCommit(true);  
            } catch (SQLException e) {  
            e.printStackTrace();  
        }  
        return conn;  
    }  
	public void closeConn(){  
        try {  
            if (conn != null)  
                conn.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
          
    }  
}
	

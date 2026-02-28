package pt.com.ctrl.vault.controller.database.util;

import java.sql.*;

/**
 * Classe resonsavel por gerir conexao com a base de dados
 * @author aliceslombardi
 * @since 28/02/2026
 */
public class ConnectionFactory {
    
    private static final String URL =
            "jdbc:mysql://localhost:3306/ctrlvault?useSSL=false&serverTimezone=UTC";

    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver MySQL não encontrado.", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {

        try {
            if (rs != null) rs.close();
        } catch (SQLException ignored) {}

        try {
            if (stmt != null) stmt.close();
        } catch (SQLException ignored) {}

        try {
            if (conn != null) conn.close();
        } catch (SQLException ignored) {}
    }

    public static void close(Connection conn, 
                             java.sql.Statement stmt) {

        close(conn, stmt, null);
    }
    
}

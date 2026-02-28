package pt.com.ctrl.vault.repository;

import java.sql.*;
import pt.com.ctrl.vault.controller.database.util.ConnectionFactory;
import pt.com.ctrl.vault.model.Usuario;

/**
 * Classe resonsavel pela leitura e manipulacao dos dados de um usuario
 * @author aliceslombardi
 * @since 28/02/2026
 */
public class UsuarioRepository {

    public boolean existsByEmail(String email) {

        String sql = "SELECT COUNT(*) FROM tb_usuario WHERE email = ?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao verificar email", e);
        } finally {
            ConnectionFactory.close(conn, stmt, rs);
        }

        return false;
    }

    public void save(Usuario usuario) {

        String sql = """
                INSERT INTO tb_usuario 
                (nome, email, senha, id_tipo_usuario, ativo, data_criacao)
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setInt(4, usuario.getTipoUsuario().getId());
            stmt.setBoolean(5, usuario.getAtivo());
            stmt.setTimestamp(6, Timestamp.valueOf(usuario.getDataCriacao()));

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar usuário", e);
        } finally {
            ConnectionFactory.close(conn, stmt);
        }
    }
    
    public void saveTemporaryUser(Usuario usuario) {

        String sql = """
                INSERT INTO tb_usuario 
                (nome, email, senha, ativo, data_criacao)
                VALUES (?, ?, ?, ?, ?)
                """;

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setBoolean(4, usuario.getAtivo());
            stmt.setTimestamp(5, Timestamp.valueOf(usuario.getDataCriacao()));

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar usuário", e);
        } finally {
            ConnectionFactory.close(conn, stmt);
        }
    }
        
}

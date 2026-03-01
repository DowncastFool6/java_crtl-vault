package pt.com.ctrl.vault.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Classe para remover um usuario da sessao
 * @author aliceslombardi
 * @since 01/03/2026
 */
public class LogoutController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        removerUsuarioDaSessao(req);
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {   
    }
    
    private void removerUsuarioDaSessao(HttpServletRequest req){
        HttpSession session = req.getSession();
        session.removeAttribute("usuarioLogado");
    }
    
}

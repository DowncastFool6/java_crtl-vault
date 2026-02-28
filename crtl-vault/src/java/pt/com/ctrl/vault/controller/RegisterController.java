package pt.com.ctrl.vault.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pt.com.ctrl.vault.services.UsuarioService;

/**
 * Controller do resgistro de um novo usuario no sistema
 * @author aliceslombardi
 * @since 28/02/2026
 */
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/register/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        
        processRegister(nome, email, senha);

        req.setAttribute("mensagem", "Usuário registrado com sucesso!");
        req.getRequestDispatcher("/WEB-INF/register/register.jsp").forward(req, resp);
    }
    
    public String processRegister(String nome,
                                  String email,
                                  String senha) {
        
        UsuarioService service = new UsuarioService();
        service.processRegister(nome, email, senha);

        return "redirect:/login.htm";
    }
}

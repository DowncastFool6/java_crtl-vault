package pt.com.ctrl.vault.services;

import java.time.LocalDateTime;
import pt.com.ctrl.vault.repository.UsuarioRepository;
import pt.com.ctrl.vault.model.Usuario;

/**
 * Classe com logica de negocio referente ao usuario
 * @author aliceslombardi
 * @since 28/02/2026
 */
public class UsuarioService {
    
    private final UsuarioRepository repository = new UsuarioRepository();
    
        public String processRegister(String nome, String email, String senha) {

        if (nome == null || nome.isBlank()
                || email == null || email.isBlank()
                || senha == null || senha.isBlank()) {

            return "Campos obrigatórios não preenchidos";
        }

        if (repository.existsByEmail(email)) {
            return "Email já cadastrado";
        }

        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);
        usuario.setAtivo(true);
        usuario.setDataCriacao(LocalDateTime.now());

        repository.saveTemporaryUser(usuario);

        return "SUCESSO";
    }
    
}

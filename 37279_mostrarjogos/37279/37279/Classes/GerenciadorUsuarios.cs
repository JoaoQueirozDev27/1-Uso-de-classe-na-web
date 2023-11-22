using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class GerenciadorUsuarios
{
    public List<Usuario> ListaUsuariosJogo(int codigo)
    {
        Banco banco= new Banco();
        List<Usuario> usuarios = new List<Usuario>();
        string comando = $@"Select usu.*,avg(a.qt_avaliacao),(Select count(nm_email) from favorito  where nm_email_favoritado = a.nm_email)
                            as qtd from avaliacao a join usuario usu on(a.nm_email = usu.nm_email)
                            join biblioteca bi on(usu.nm_email = bi.nm_email)
                            where bi.cd_jogo = {codigo}
                            group by a.nm_email
                            order by avg(a.qt_avaliacao) Desc,qtd desc limit 0,5;";
        MySqlDataReader dados = banco.Consultar(comando);
        while (dados.Read())
        {
            Usuario usuario = new Usuario();
            usuario.Apelido = dados.GetString("nm_apelido");
            usuario.Avaliacao = dados.GetDouble("avg(a.qt_avaliacao)");
            usuario.Descricao = dados.GetString("ds_usuario");
            usuario.Email= dados.GetString("nm_email");
            usuarios.Add(usuario);
        }

        if (dados != null)
            if (dados.IsClosed)
                dados.Close();
        banco.Desconectar();
        return usuarios;
    }
}

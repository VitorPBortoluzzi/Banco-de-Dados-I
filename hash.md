# HASH
Guia: https://pythonhelp.wordpress.com/tag/hash/#:~:text=A%20fun%C3%A7%C3%A3o%20de%20hash%20gera,'%20e%20'teste12'%20).

    import hashlib
    print hashlib.md5('123').hexdigest()
    202cb962ac59075b964b07152d234b70


Como usar apropriadamente

    # -*- encoding:utf-8 -*-
    import bcrypt
    import sqlite3
 
    def valida_senha(senha_digitada, hash_senha):
        return bcrypt.hashpw(senha_digitada, hash_senha) == hash_senha
 
    def insere_usuario(conexao, usuario, senha):
        hash_senha = bcrypt.hashpw(senha, bcrypt.gensalt())
        conexao.execute('insert into USUARIOS values ("%s", "%s")' % (usuario, hash_senha))
        conexao.commit()
    
    def usuario_autenticado(conexao, usuario, senha):
        cursor = conexao.execute('select SENHA from USUARIOS where NOME = "%s"' % (usuario,))
        dados = cursor.fetchone()
        hash_senha = str(dados[0])
        return valida_senha(senha, hash_senha)
    
    # alguns testes
    if __name__=='__main__':
        conexao = sqlite3.connect('arquivo.db')
        insere_usuario(conexao, 'maria', 'teste')
        insere_usuario(conexao, 'joao', 'teste123')
        if usuario_autenticado(conexao, 'joao', 'teste123'):
            print 'joao está autenticado!'
        else:
            print 'Xiiiii...'
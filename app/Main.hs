import Repo.Usuarios

main :: IO ()
main = do
    u:xs <- criaUsuarioSeNaoExistir "davi"

    print u

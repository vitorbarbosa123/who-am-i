import Repo.Usuarios
import Repo.Personas

main :: IO ()
main = do
    p <- listPersonas
    print (map parseToStringArray p)

from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('mysql://root:Qvcom14sps@localhost/dbBigBen')

Base = declarative_base()

class Cliente(Base):
    __tablename__ = 'tb_cliente'

    id_cliente = Column(Integer, primary_key=True)
    nome_cliente = Column(String(50))
    fantasia_cliente = Column(String(50))
    estado_cliente = Column(Integer)
    tipo_cliente = Column(Integer)

Session = sessionmaker(bind=engine)
session = Session()

registros = session.query(Cliente).all()

for registro in registros:
    print(registro.id_cliente, registro.nome_cliente)

# Inserir um novo registro
# connection.execute(users_table.insert().values(name='Alice', age=25, email='alice@example.com'))

# Selecionar todos os registros
# result = connection.execute(users_table.select())
# for row in result:
#     print(row)

# Atualizar um registro
# connection.execute(users_table.update().where(users_table.c.id == 1).values(name='Bob'))

# Deletar um registro
# connection.execute(users_table.delete().where(users_table.c.id == 2))



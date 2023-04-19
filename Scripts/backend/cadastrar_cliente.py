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

novo_registro = Cliente(nome_cliente='Pessoa1',fantasia_cliente='Pessoa1' ,estado_cliente='1', tipo_cliente=1)

session.add(novo_registro)
session.commit()

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



from sqlalchemy import create_engine
from sqlalchemy import MetaData, Table, Column, Integer, String
engine = create_engine('mysql://root:Qvcom14sps@localhost/dbBigBen')



metadata = MetaData()

users_table = Table('users', metadata,
                    Column('id', Integer, primary_key=True),
                    Column('name', String(16)),
                    Column('age', Integer),
                    Column('email', String(16)),
                    )

metadata.create_all(engine)

connection = engine.connect()

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

connection.close()

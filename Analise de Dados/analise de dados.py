import pyrebase 
import pandas as pd
import numpy as np
import ast

#-----------------conexao
config = {
  "apiKey": "AIzaSyALd6xjlQyDJBKrbzEnLACXnWZIvmpa4do",
  "authDomain": "redesasupermercado.firebaseapp.com",
  "databaseURL": "https://redesasupermercado-default-rtdb.firebaseio.com",
  "projectId": "redesasupermercado",
  "storageBucket": "redesasupermercado.appspot.com",
  "messagingSenderId": "758574545886",
  "appId": "1:758574545886:web:606cc0883042722483bb4f",
  "measurementId": "G-38NEGKCEEF"
}

firebase = pyrebase.initialize_app(config)
database = firebase.database()

#--------------Read do Estoque
estoque = database.child("ReposicaoEstoque").get()

dicionario = dict(estoque.val())
dici = str(dicionario)
dici = dici.replace("[","")
dici = dici.replace("]","")
dicionario = ast.literal_eval(dici)

#-------------Read da Prateleira
prateleira = database.child("ReposicaoPrateleira").get()

dicionario2 = dict(estoque.val())
dici2 = str(dicionario2)
dici2 = dici2.replace("[","")
dici2 = dici2.replace("]","")
dicionario2 = ast.literal_eval(dici2)

#-------------Read da Caixa
caixa = database.child("SaidaCaixa").get()

dicionario3 = dict(caixa.val())
dici3 = str(dicionario3)
dici3 = dici3.replace("[","")
dici3 = dici3.replace("]","")
dicionario3 = ast.literal_eval(dici3)

#--------------------manipulação 
dfe = pd.concat({k: pd.DataFrame(v).T for k, v in dicionario.items()}, axis=0)
dfp = pd.concat({k: pd.DataFrame(v).T for k, v in dicionario2.items()}, axis=0)
dfc = pd.concat({k: pd.DataFrame(v).T for k, v in dicionario3.items()}, axis=0)
dfe = dfe.drop(columns=['data'])
dfp = dfp.drop(columns=['data'])
dfc = dfc.drop(columns=['data'])
dfe = dfe.reset_index()
dfp = dfp.reset_index()
dfc = dfc.reset_index()
dfe.rename( columns={'level_0' :'Produto','level_1' : 'Id'}, inplace=True )
dfp.rename( columns={'level_0' :'Produto','level_1' : 'Id'}, inplace=True )
dfc.rename( columns={'level_0' :'Produto','level_1' : 'Id'}, inplace=True )



#---------------------Pergunta 1

dfp['Count'] = dfp.groupby(['Produto'])['Id'].transform('count')
df1 = dfp
dfp = dfp.drop(columns=['Count'])
df1 = df1.drop(columns=['Id'])
df1 = df1.drop(columns=['quantidade'])
df1 =df1.drop_duplicates()
df1 = df1.sort_values(by=['Count'], ascending=False)
column = df1["Count"]
max_value = column.max()
df1aux = df1[df1.Count >= max_value]

print("\n------------------------------------------------------")
print("1 - Qual produto deve ter mais espaço nas prateleiras?")
for col_name in df1aux.Produto: 
    print(col_name)
print("------------------------------------------------------\n")


#-----------------------Pergunta 2


dfc['Count'] = dfc.groupby(['Produto'])['Id'].transform('count')
dfc = dfc.groupby(['Produto','Count'])['quantidade'].sum().reset_index()
df3= dfc
df3 = df3.drop(columns=['quantidade'])
df3 = df3.sort_values(by=['Count'], ascending=False)
column2 = df3["Count"]
max_value = column2.max()
df3aux = df3[df3.Count >= max_value]

print("\n------------------------------------------------------")
print("2 - Qual produto tem maior rotatividade?")
for col_name2 in df3aux.Produto: 
    print(col_name2)
print("------------------------------------------------------\n")



#----------------------Pergunta 3


dfp['Count'] = dfp.groupby(['Produto'])['Id'].transform('count')
dfp = dfp.groupby(['Produto','Count'])['quantidade'].sum().reset_index()
df2= dfp
df2['Estoque_minimo'] = (df2['quantidade']/df2['Count'])*7
df2['Estoque_minimo'] = df2['Estoque_minimo'].apply(np.ceil) 
df2 = df2.drop(columns=['Count'])
df2 = df2.drop(columns=['quantidade'])

print("\n------------------------------------------------------")
print("3 - Temos algum estoque mínimo recomendado? (Estoque minimo por produto)\n")
print(df2)
print("\n------------------------------------------------------\n")


#Qual produto deve ter mais espaço nas prateleiras. (O que mais sai, não em quantidade, mas em vezes)
#Qual produto tem maior rotatividade. (O sai do caixa))
#Temos algum estoque mínimo recomendado? (Quantidade somada, frequencia produtos*quantidade)




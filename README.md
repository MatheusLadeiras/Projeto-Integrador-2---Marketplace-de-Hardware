# Projeto-Integrador-2---Marketplace-de-Hardware

Projeto para o professor Fabricio Pereira da matéria de PI2 feito em conjunto com Yuri Gabriel Soares Campos. <br />
Feito no SGBDR mySQL, versão 8, originalmente construído usando o DBeaver. 

- DDL -> https://github.com/MatheusLadeiras/Projeto-Integrador-2---Marketplace-de-Hardware/blob/main/marketplaceDeHardwareDDL.sql
- DML -> https://github.com/MatheusLadeiras/Projeto-Integrador-2---Marketplace-de-Hardware/blob/main/marketplaceDeHardwareDML.sql
- Scripts NoSQL -> https://github.com/MatheusLadeiras/Projeto-Integrador-2---Marketplace-de-Hardware/tree/main/Scripts%20NOSQL

 Diagrama da estrutura física dos dados: <img width="901" height="825" alt="image" src="https://github.com/user-attachments/assets/7533cb06-d141-4f89-8337-7fd8905daa68" />

 
 
## Estrutura de Organização Física dos Dados no MongoDB

A estrutura apresentada a seguir ilustra a hierarquia física em árvore de um documento BSON gravado na coleção `pedidos`, evidenciando o modelo de agregados com subdocumentos aninhados para `custodia`, `envio` e `disputa`.

```text
Coleção: pedidos
└── Documento BSON (_id: ObjectId)
    ├── numeroPedido: "PED-2026-00982" (String)
    ├── compradorId: ObjectId("...") (Ref -> usuarios)
    ├── vendedorId: ObjectId("...") (Ref -> usuarios)
    ├── anuncioId: ObjectId("...") (Ref -> anuncios)
    ├── dataHoraCriacao: ISODate(...) (Date)
    ├── valorTotalTransacao: 1850.00 (Double)
    ├── status: "EM_DISPUTA" (String Enum)
    ├── dataLimiteHomologacao: ISODate(...) (Date)
    │
    ├── custodia: { Subdocumento Embutido }
    │   ├── idCustodiaTransacao: "CUST-99218-XYZ" (String)
    │   ├── montanteRetido: 1850.00 (Double)
    │   └── statusCustodia: "CONGELADA_DISPUTA" (String Enum)
    │
    ├── envio: { Subdocumento Embutido }
    │   ├── codigoRastreamento: "NL123456789BR" (String)
    │   ├── transportadora: "Correios - Sedex" (String)
    │   ├── dataDespacho: ISODate(...) (Date)
    │   └── dataEntregaEfetiva: ISODate(...) (Date)
    │
    └── disputa: { Subdocumento Embutido }
        ├── protocoloDisputa: "DSP-2026-0041" (String)
        ├── motivo: "DEFEITO_FUNCIONAL" (String Enum)
        ├── relatorioComprador: "A placa apresenta..." (String)
        ├── dataAbertura: ISODate(...) (Date)
        ├── statusDisputa: "EM_ANALISE" (String Enum)
        ├── veredito: "PENDENTE" (String Enum)
        ├── moderadorId: ObjectId("...") (Ref -> usuarios)
        └── evidencias: [ Array de Subdocumentos ]
            └── {
                  hashSha256Arquivo: "e3b0c442..." (String),
                  urlArmazenamento: "/uploads/..." (String),
                  tipoMime: "image/jpeg" (String),
                  dataUpload: ISODate(...) (Date)
                }
```
*Figura: Representação Hierárquica Física do Documento BSON na Coleção `pedidos`*

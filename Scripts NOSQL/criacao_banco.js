use marketplace_hardware;

db.createCollection("usuarios", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["cpf", "email", "nomeCompleto", "hashSenha", "saldoDisponivel", "saldoBloqueado", "reputacaoVendas", "role"],
            properties: {
                _id: {
                    bsonType: "objectId"
                },
                cpf: {
                    bsonType: "string",
                    pattern: "^[0-9]{11}$",
                    description: "CPF composto por exatamente 11 dígitos numéricos."
                },
                email: {
                    bsonType: "string",
                    pattern: "^.+@.+\\..+$",
                    description: "Endereço de e-mail em formato válido."
                },
                nomeCompleto: {
                    bsonType: "string"
                },
                hashSenha: {
                    bsonType: "string"
                },
                saldoDisponivel: {
                    bsonType: "double",
                    minimum: 0.0
                },
                saldoBloqueado: {
                    bsonType: "double",
                    minimum: 0.0
                },
                reputacaoVendas: {
                    bsonType: "double",
                    minimum: 0.0,
                    maximum: 5.0
                },
                role: {
                    enum: ["ADMIN", "CLIENTE"],
                    description: "Papel do usuário no sistema."
                }
            }
        }
    }
});

db.createCollection("anuncios", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["codigoAnuncio", "vendedorId", "titulo", "precoVenda", "aliquotaTaxaAplicada", "valorTaxaPlataforma", "valorLiquidoVendedor", "estadoItem", "status", "modeloHardware"],
            properties: {
                _id: {
                    bsonType: "objectId"
                },
                codigoAnuncio: {
                    bsonType: "string"
                },
                vendedorId: {
                    bsonType: "objectId"
                },
                titulo: {
                    bsonType: "string"
                },
                precoVenda: {
                    bsonType: "double",
                    minimum: 0.01
                },
                aliquotaTaxaAplicada: {
                    bsonType: "double",
                    minimum: 0.0
                },
                valorTaxaPlataforma: {
                    bsonType: "double",
                    minimum: 0.0
                },
                valorLiquidoVendedor: {
                    bsonType: "double",
                    minimum: 0.0
                },
                estadoItem: {
                    enum: ["NOVO", "USADO_EXCELENTE", "USADO_BOM", "COM_DEFEITO"]
                },
                status: {
                    enum: ["RASCUNHO", "ATIVO", "PAUSADO", "VENDIDO"]
                },
                fotos: {
                    bsonType: "array",
                    items: { bsonType: "string" }
                },
                modeloHardware: {
                    bsonType: "object",
                    required: ["partNumber", "fabricante", "linhaModelo", "categoriaSlug"],
                    properties: {
                        partNumber: { bsonType: "string" },
                        fabricante: { bsonType: "string" },
                        linhaModelo: { bsonType: "string" },
                        especificacaoTecnica: { bsonType: "string" },
                        precoMedianoHistorico: { bsonType: "double" },
                        categoriaSlug: { bsonType: "string" }
                    }
                }
            }
        }
    }
});

db.createCollection("pedidos", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["numeroPedido", "compradorId", "vendedorId", "anuncioId", "dataHoraCriacao", "valorTotalTransacao", "status", "custodia"],
            properties: {
                _id: {
                    bsonType: "objectId"
                },
                numeroPedido: {
                    bsonType: "string"
                },
                compradorId: {
                    bsonType: "objectId"
                },
                vendedorId: {
                    bsonType: "objectId"
                },
                anuncioId: {
                    bsonType: "objectId"
                },
                dataHoraCriacao: {
                    bsonType: "date"
                },
                valorTotalTransacao: {
                    bsonType: "double",
                    minimum: 0.01
                },
                status: {
                    enum: ["AGUARDANDO_ENVIO", "ENVIADO", "ENTREGUE", "EM_DISPUTA", "CONCLUIDO", "CANCELADO"]
                },
                dataLimiteHomologacao: {
                    bsonType: "date"
                },
                custodia: {
                    bsonType: "object",
                    required: ["idCustodiaTransacao", "montanteRetido", "statusCustodia"],
                    properties: {
                        idCustodiaTransacao: { bsonType: "string" },
                        montanteRetido: { bsonType: "double", minimum: 0.0 },
                        statusCustodia: { enum: ["RETIDA", "CONGELADA_DISPUTA", "LIQUIDADA_VENDEDOR", "ESTORNADA_COMPRADOR"] }
                    }
                },
                envio: {
                    bsonType: "object",
                    required: ["codigoRastreamento", "transportadora"],
                    properties: {
                        codigoRastreamento: { bsonType: "string" },
                        transportadora: { bsonType: "string" },
                        dataDespacho: { bsonType: "date" },
                        dataEntregaEfetiva: { bsonType: "date" }
                    }
                },
                disputa: {
                    bsonType: "object",
                    required: ["protocoloDisputa", "motivo", "relatorioComprador", "dataAbertura", "statusDisputa", "veredito"],
                    properties: {
                        protocoloDisputa: { bsonType: "string" },
                        motivo: { enum: ["DEFEITO_FUNCIONAL", "DANO_TRANSPORTE", "ITEM_DIVERGENTE"] },
                        relatorioComprador: { bsonType: "string" },
                        dataAbertura: { bsonType: "date" },
                        statusDisputa: { enum: ["ABERTA", "EM_ANALISE", "AGUARDANDO_PROVAS", "ENCERRADA"] },
                        veredito: { enum: ["PENDENTE", "FAVORAVEL_COMPRADOR", "FAVORAVEL_VENDEDOR"] },
                        moderadorId: { bsonType: "objectId" },
                        evidencias: {
                            bsonType: "array",
                            items: {
                                bsonType: "object",
                                required: ["hashSha256Arquivo", "urlArmazenamento", "tipoMime", "dataUpload"],
                                properties: {
                                    hashSha256Arquivo: { bsonType: "string" },
                                    urlArmazenamento: { bsonType: "string" },
                                    tipoMime: { bsonType: "string" },
                                    dataUpload: { bsonType: "date" }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
});

create type tipo_grupo_usuario as enum (
    'cliente', 'admin', 'profissional'
);

create table usuarios (
    id INT generated always as identity primary key,
    email TEXT unique not null,
    
    funcao tipo_grupo_usuario 
);

create type tipo_colecao as enum (
    'publicacao', 'exercicio', 'analise', 'armazenamento'
);

create table colecao (
    id INT generated always as identity primary key,
    descricao TEXT, -- breve descricao por parte do usuario sobre o momento em que tirou/gravou os arquivos 
    tipo tipo_colecao,
    
    cliente_id INT references usuarios(id)
);

create type tipo_midia as enum (
    'imagem', 'video'
);

create table midia (
    id INT generated always as identity primary key,
    caminho VARCHAR(1024), -- caminho em que o arquivo real estará guardado
    tipo tipo_midia, 
    
    colecao_id INT references colecao(id)
);

create table diagnostico ( -- diagnostico gerado a partir da colecao de analises 
    id INT generated always as identity primary key,
    peso numeric(10,2), -- peso
    gordura numeric(10,2), -- gordura corporal
    massa_magra numeric(10,2), -- massa magra
    simetria numeric(10,2), 
    descricao TEXT,
    
    cliente_id INT references usuarios(id),
    profissional_id INT references usuarios(id)
);

create table analise ( -- analise unitaria de cada imagem/video 
    id INT generated always as identity primary key,
    pose VARCHAR,
    pontos_referencia TEXT, -- pontos de referencia gerados pela IA
    proporcoes TEXT, -- proporcoes do corpo
    confianca float, -- precisao nas analises
    descricao TEXT,
    
    midia_id INT references midia(id),
    diagnostico_id INT references diagnostico(id)
);

create table progresso ( -- timeline dos diagnosticos \ evolucao do usuario
    id INT generated always as identity primary key,
    diferenca_gordura numeric(10,2), 
    diferenca_massa_muscular numeric(10,2),
    intervalo_dias int,
    
    usuario_id INT references usuarios(id),
    diag_atual_id INT references diagnostico(id),
    diag_anterior_id INT references diagnostico(id)
);

-- ============================================================
-- =================== schema de notificacao ==================
-- ============================================================

create type tipo_notificacao as enum (
    'INFO', 'AVISO', 'ERRO'
);

create table notificacao (
    id INT generated always as identity primary key,
    titulo VARCHAR(255),
    mensagem TEXT not null,
    tipo tipo_notificacao,
    
    usuario_id INT references usuarios(id) 
);

create table destinatario_notificacao (
    id INT generated always as identity primary key,
    lido_em TIMESTAMP null,
    
    usuario_id INT references usuarios(id),
    notificacao_id INT references notificacao(id)
);

create type tipo_canal as enum (
    'SISTEMA', 'EMAIL'
);

create type status_entrega as enum (
    'PENDENTE', 'FALHOU', 'ENVIADO'
);

create table entrega_notificacao (
    id INT generated always as identity primary key,
    canal tipo_canal,
    status status_entrega,
    
    destinatario_id INT references destinatario_notificacao(id)
);

-- ============================================================
-- =================== schema de assinatura ===================
-- ============================================================

create type tipo_plano as enum (
    'Individual', 'Duo', 'Familiar'
);

create table plano (
    id INT generated always as identity primary key,
    nome tipo_plano,
    preco numeric(12, 2),
    validade_acesso int default 30, -- dias de acesso ao assinar o plano
    creditos_acesso int -- quantidade de uso da funcao principal
);

create table assinatura (
    id INT generated always as identity primary key,
    periodos_pagos INT,
    
    usuario_id INT references usuarios(id),
    plano_id INT references plano(id)
);

create type tipo_pagamento as enum (
   'PIX', 'CREDITO', 'DEBITO'
);

create type status_transacao as enum (
   'PROCESSANDO', 'PROCESSADO', 'FALHOU'
);

create table transacao ( 
    id INT generated always as identity primary key,
    metodo_pagamento tipo_pagamento,
    status status_transacao,
        
    assinatura_id INT references assinatura(id)
);

-- ============================================================
-- =================== schema de planilha =====================
-- ============================================================

create type tipo_exercicio as enum (
    'perna', 'braco', 'costas'
);

create table exercicio (
    id INT generated always as identity primary key,
    descricao TEXT,
    tipo tipo_exercicio,

    colecao_id INT references colecao(id)
);

create table execucao (
    id INT generated always as identity primary key,
    descricao TEXT,
    repeticao INT,
    series INT,
    
    exercicio_id INT references exercicio(id)
);

create type tipo_diario as enum (
    'perna', 'braco', 'costas'
);

create table diario (
    id INT generated always as identity primary key,
    descricao TEXT,
    tipo tipo_diario
);

create table execucao_diaria (
    diario_id INT references diario(id),
    execucao_id INT references execucao(id),
    sugestao_passo INT
);

create type tipo_planilha as enum (
    'generica', 'pessoal'
);

create table planilha (
    id INT generated always as identity primary key,
    descricao TEXT,
    tipo tipo_planilha
);

create table planilha_diaria (
    planilha_id INT references planilha(id),
    diario_id INT references diario(id),
    dia_semana INT
);

create table usuario_planilha(
    usuario_id INT references usuarios(id),
    planilha_id INT references planilha(id),
    iniciado_em DATE,
    finalizado_em DATE
);
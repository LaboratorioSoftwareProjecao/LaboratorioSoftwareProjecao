# MVP

## 1. Objetivo

Disponibilizar uma primeira versão gratuita da plataforma que permita a alunos e personal trainers realizar o ciclo básico de acompanhamento: cadastro e acesso, definição de objetivos, registro de dores, comunicação, prescrição de treinos, execução das planilhas e acompanhamento simples da assiduidade.

O MVP validará esse fluxo sem depender de Inteligência Artificial, diagnóstico automatizado, planos de assinatura ou pagamentos.

## 2. Critério usado para consolidação

Este documento combina a proposta inicial com as decisões registradas na reunião:

- as decisões explícitas da reunião prevalecem quando há conflito com a proposta;
- os itens da proposta que não foram discutidos continuam no escopo quando não contradizem essas decisões;

## 3. Escopo funcional do MVP

| ID | Funcionalidade | Entrega mínima do MVP | Justificativa |
|---|---|---|---|
| **MVP-01** | Cadastro e login | Aluno e personal trainer criam uma conta, autenticam-se e acessam as funcionalidades correspondentes ao seu perfil. | Identifica os usuários e garante a separação básica de permissões. |
| **MVP-02** | Objetivos e Mapa da Dor | O aluno define seus objetivos e registra, em um diagrama de frente e costas, a região, o tipo e a intensidade da dor. Também pode atualizar ou remover uma marcação. | Fornece ao personal informações essenciais para orientar a prescrição com mais segurança. |
| **MVP-03** | Gestão básica de alunos | O personal visualiza seus alunos e consulta os objetivos e o Mapa da Dor de cada um. | Conecta as informações fornecidas pelo aluno à elaboração do treino. |
| **MVP-04** | Planilhas de treino | O personal cria, edita e disponibiliza uma planilha semanal contendo exercícios, séries, repetições e observações. O aluno consulta a planilha atribuída a ele. | Materializa o serviço principal de prescrição e acompanhamento. |
| **MVP-05** | Execução e acompanhamento simples | O aluno marca uma sessão como concluída. Aluno e personal visualizam o histórico básico de conclusões e a assiduidade relacionada aos objetivos cadastrados. | Fecha o ciclo de uso e permite validar o acompanhamento sem relatórios avançados. |
| **MVP-06** | Bate-papo aluno–personal | Aluno e personal trocam mensagens de texto dentro da plataforma, com histórico da conversa. | Permite orientação e esclarecimento de dúvidas sem depender de bot ou IA. |

## 4. Fluxo principal a ser validado

1. Aluno e personal trainer criam suas contas e fazem login.
2. O aluno informa seus objetivos e registra uma dor no Mapa da Dor.
3. O personal consulta os objetivos e as dores registradas pelo aluno.
4. O personal cria e disponibiliza uma planilha de treino adequada às informações apresentadas.
5. O aluno consulta a planilha, executa o treino e marca a sessão como concluída.
6. Aluno e personal consultam o histórico básico de execução.
7. O aluno e o personal trocam mensagens pelo bate-papo para orientações e dúvidas.

## 5. Critérios de aceite do MVP

- [ ] Aluno e personal trainer conseguem se cadastrar, entrar e acessar apenas as funções do próprio perfil.
- [ ] O aluno consegue cadastrar objetivos e registrar, editar e remover uma dor com região, tipo e intensidade.
- [ ] O personal consegue visualizar os dados básicos, os objetivos e o Mapa da Dor de um aluno vinculado.
- [ ] O personal consegue criar, editar e atribuir uma planilha de treino ao aluno.
- [ ] O aluno consegue consultar a planilha recebida e marcar uma sessão como concluída.
- [ ] Aluno e personal conseguem consultar o histórico básico de sessões concluídas.
- [ ] Aluno e personal conseguem enviar e consultar mensagens no bate-papo.

## 6. Fora do MVP — segunda etapa

| Funcionalidade / item | Decisão | Observação |
|---|---|---|
| Inteligência Artificial | Adiada | Inclui análise de postura, detecção de pontos corporais, recomendações automáticas e bot de IA. |
| Diagnóstico automatizado | Adiado | Nenhuma análise ou recomendação do MVP deve ser apresentada como diagnóstico. |
| Planos de acesso e assinaturas | Adiado | O MVP terá acesso gratuito e não exigirá simulação de planos no banco de dados. |
| Gateway de pagamentos | Adiado | Cobrança, cartão, PIX, renovação, cancelamento e histórico financeiro ficam para a segunda etapa. |
| Análise de fotos e vídeos | Adiada | Upload e processamento de imagens ou vídeos não fazem parte do fluxo desta versão. |
| Relatórios avançados de evolução | Adiados | O MVP mantém somente o histórico básico de treinos concluídos e assiduidade. |
| Notificações push e por e-mail | Adiadas | Avisos, quando necessários, serão exibidos dentro da plataforma. |

## 7. Escopo técnico mínimo

### Entregas por área

- **Frontend:** telas de cadastro e login; perfil e objetivos; Mapa da Dor; consulta e conclusão de treinos; histórico básico; bate-papo; painel do personal com alunos e editor de planilhas.
- **Backend:**
  - definir e documentar os contratos de API, incluindo dependências, formatos de requisição e resposta e códigos de erro;
  - criar rotas para autenticação, perfis, objetivos, Mapa da Dor, vínculo aluno–personal, planilhas, conclusão de treinos e mensagens;
  - implementar os CRUDs necessários ao fluxo, com validação de dados, autenticação e autorização por perfil;
  - implementar o vínculo entre aluno e personal, a persistência do bate-papo e as regras básicas do fluxo.
- **Banco de Dados:** tabelas de usuários, perfis, vínculos, objetivos, dores, planilhas, exercícios, sessões concluídas, conversas e mensagens, além de dados iniciais para teste.

## 8. Definição de pronto

O MVP será considerado pronto quando todos os critérios de aceite estiverem atendidos em ambiente integrado, o fluxo principal puder ser demonstrado de ponta a ponta e não houver dependência funcional dos recursos adiados para a segunda etapa.

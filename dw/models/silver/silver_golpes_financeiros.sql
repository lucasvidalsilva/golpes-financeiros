with source as (
    select
        "Faixa etária:",
        "Situação profissional:",
        "Nível de escolaridade:",
        "Área de residência:",
        "Possui filhos?",
        "Quantas contas bancárias você possui?",
        "Principal meio de uso bancário (Pode marcar mais de uma opçã",
        "Como você costuma se informar sobre finanças e segurança dig",
        "Qual sua familiaridade com o uso de tecnologia e internet?",
        "Você já foi vítima de algum golpe financeiro?",
        "Se sim, qual foi o tipo de fraude? (Pode marcar mais de uma op",
        "Se foi vítima, qual foi a faixa de perda financeira?",
        "Você conhece alguém próximo (amigo, familiar, colega) que j",
        "Na sua opinião, qual o principal motivo pelo qual as pessoas c",
        "Após sofrer ou conhecer alguém que sofreu um golpe, você mud",
        "Quais medidas de segurança você já adota para evitar fraudes",
        "Você já denunciou algum golpe financeiro às autoridades ou a",
        "Com que frequência você verifica seu extrato bancário e tran",
        "Você já recebeu mensagens ou ligações suspeitas pedindo dad",
        "Você sabe identificar sinais de golpe financeiro em e-mails, m",
        "Se recebeu mensagens ou ligações suspeitas, qual foi sua rea",
        "Com que frequência você altera suas senhas bancárias e de ap",
        "Você costuma compartilhar informações sobre golpes financeir",
        "Na sua opinião, o que poderia reduzir o número de fraudes fin",
        "Você estaria interessado em participar de cursos ou workshops "
    from
        {{ source('postgres', 'bronze_golpes_financeiros') }}
), renamed as (
    select
        "Faixa etária:" AS faixa_etaria,
        "Situação profissional:" AS sit_profissional,
        "Nível de escolaridade:" AS nivel_escolar,
        "Área de residência:" AS area_residencia,
        "Possui filhos?" AS "filhos?",
        "Quantas contas bancárias você possui?" AS qtd_contasbancarias,
        "Principal meio de uso bancário (Pode marcar mais de uma opçã" AS meio_banco,
        "Como você costuma se informar sobre finanças e segurança dig" AS info_financ_seg,
        "Qual sua familiaridade com o uso de tecnologia e internet?" AS afinidade_tec,
        "Você já foi vítima de algum golpe financeiro?" AS vitima_golpe,
        "Se sim, qual foi o tipo de fraude? (Pode marcar mais de uma op" AS tipo_golpe,
        "Se foi vítima, qual foi a faixa de perda financeira?" AS perda_golpe,
        "Você conhece alguém próximo (amigo, familiar, colega) que j" AS conhece_vitima,
        "Na sua opinião, qual o principal motivo pelo qual as pessoas c" AS motivo_cair_golpe,
        "Após sofrer ou conhecer alguém que sofreu um golpe, você mud" AS mudou_seg_financ,
        "Quais medidas de segurança você já adota para evitar fraudes" AS medidas_seg,
        "Você já denunciou algum golpe financeiro às autoridades ou a" AS denunciou_golpe,
        "Com que frequência você verifica seu extrato bancário e tran" AS verifica_extrato,
        "Você já recebeu mensagens ou ligações suspeitas pedindo dad" AS ligacao_suspeita,
        "Você sabe identificar sinais de golpe financeiro em e-mails, m" AS email_sinal_golpe,
        "Se recebeu mensagens ou ligações suspeitas, qual foi sua rea" AS reacao_golpe_lig,
        "Com que frequência você altera suas senhas bancárias e de ap" AS troca_senha,
        "Você costuma compartilhar informações sobre golpes financeir" AS compartilha_info_seg,
        "Na sua opinião, o que poderia reduzir o número de fraudes fin" AS reduzir_golpe,
        "Você estaria interessado em participar de cursos ou workshops " AS interesse_curso
    from 
        source
)

select * from renamed
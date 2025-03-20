with metricas as (
    select
        round(count(case when vitima_golpe = 'Sim' then 1 end) * 100.0 / count(*), 2) as perc_vitima_golpe,
        round(count(case when conhece_vitima = 'Sim' then 1 end) * 100.0 / count(*), 2) as perc_conhece_vitima,
        (select trim(unnest(regexp_split_to_array(tipo_golpe, ','))) 
         from {{ ref('silver_golpes_financeiros') }} 
         group by trim(unnest(regexp_split_to_array(tipo_golpe, ','))) 
         order by count(*) desc 
         limit 1) as golpe_mais_comum,
        perda_golpe,
        round(count(*) * 100.0 / (select count(*) from {{ ref('silver_golpes_financeiros') }} where perda_golpe is not null), 2) as perc_perda_golpe,
        motivo_cair_golpe,
        round(count(*) * 100.0 / (select count(*) from {{ ref('silver_golpes_financeiros') }}), 2) as perc_motivo_golpe,
        denunciou_golpe,
        round(count(*) * 100.0 / (select count(*) from {{ ref('silver_golpes_financeiros') }}), 2) as perc_denuncia_golpe,
        interesse_curso,
        round(count(*) * 100.0 / (select count(*) from {{ ref('silver_golpes_financeiros') }}), 2) as perc_interesse_curso
    from
        {{ ref('silver_golpes_financeiros') }}
    where
        perda_golpe is not null
    group by
        perda_golpe, motivo_cair_golpe, denunciou_golpe, interesse_curso
)

select * from metricas
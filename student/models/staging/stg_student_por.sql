{{
    config(
        materialized='table',
        tags=['staging']
    )
}}

with source as (
    select 
        absences
        , activities
        , address as address_
        , age
        , Dalc
        , failures
        , famrel
        , famsize
        , famsup
        , Fedu
        , Fjob
        , freetime
        , G1
        , G2
        , G3
        , goout
        , guardian
        , health
        , higher
        , internet
        , Medu
        , Mjob
        , nursery
        , paid
        , Pstatus
        , reason
        , romantic
        , school
        , schoolsup
        , sex
        , studytime
        , traveltime
        , Walc
    from {{ source('meudwprojects', 'student_por') }}
)

, renomeando as (
        select 
        absences as ausencias
        , activities as atividades_extra_curriculares
        , address_ as endereco
        , age as idade
        , Dalc as consumo_alcool_dia_semana
        , failures as reprovacoes_passadas
        , famrel as relacionamento_familiar
        , famsize as tamanho_familia
        , famsup as suporte_educacional_familiar
        , Fedu as educacao_pai
        , Fjob as trabalho_pai
        , freetime as tempo_livre
        , G1 as nota_1_bimestre
        , G2 as nota_2_bimestre
        , G3 as nota_final
        , goout as saidas_amigos
        , guardian as responsavel
        , health as saude
        , higher as deseja_educacao_superior
        , internet as internet
        , Medu as educacao_mae
        , Mjob as trabalho_mae
        , nursery as creche
        , paid as aulas_particulares
        , Pstatus as status_coabitacao
        , reason as motivo_escolha_escola
        , romantic as relacionamento_amoroso
        , school as escola
        , schoolsup suport_extra_escolar
        , sex as sexo
        , studytime as tempo_estudo_semanal
        , traveltime as tempo_viagem_escola
        , Walc as consumo_alcool_final_semana  
    from source
)
select 
    * 
from renomeando
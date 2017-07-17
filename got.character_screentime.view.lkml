view: character_screentime {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql:

    SELECT *
    , CAST(SUBSTR(imdb_url, -8, 7) as int64) as character_id
    , CAST(SUBSTR(portrayed_by_imdb_url, -8, 7) as int64) as actor_id
    , CASE
        WHEN name = "Petyr 'Littlefinger' Baelish"
          THEN 'Petyr Baelish'
        WHEN name = "Eddard 'Ned' Stark"
          THEN 'Eddard Stark'
        WHEN name = "Catelyn Stark"
          THEN 'Catelyn Tully'
        WHEN name = "Lord Varys"
          THEN 'Varys'
        WHEN name = "Sandor 'The Hound' Clegane"
          THEN 'Sandor Clegane'
        WHEN name = "Ramsay Bolton"
          THEN 'Ramsay Snow'
        WHEN name = "Grand Maester Pycelle"
          THEN 'Pycelle'
        WHEN name = "Maester Luwin"
          THEN 'Luwin'
        WHEN name = "Maester Aemon"
          THEN 'Aemon Targaryen'
        WHEN name = "Brynden 'Blackfish' Tully"
          THEN 'Brynden Tully'
      ELSE name
      END as name_improved
      from  GameOfThrones.character_screentime ;;

  }

  measure: episodes {
    type: sum
    sql: CAST(CASE
          WHEN ${TABLE}.episodes = "unspecified" THEN null
          ELSE ${TABLE}.episodes
          END AS INT64);;
  }

  dimension: imdb_url {
    type: string
    sql: ${TABLE}.imdb_url ;;
    hidden: yes
  }

  dimension: name {
    primary_key: yes
    type: string
    sql: ${TABLE}.name_improved ;;
  }

  dimension: portrayed_by_imdb_url {
    type: string
    sql: ${TABLE}.portrayed_by_imdb_url ;;
    hidden: yes
  }

  dimension: actor_id {
    hidden: yes
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: character_id {
    hidden: yes
    type: number
    sql: ${TABLE}.character_id ;;
  }

  dimension: portrayed_by_name {
    type: string
    sql: ${TABLE}.portrayed_by_name ;;
  }

  dimension: screentime {
    type: number
    sql: ${TABLE}.screentime ;;
  }

  measure: count {
    type: count
    drill_fields: [name, portrayed_by_name]
  }

  measure: total_screentime {
    type: sum
    sql: ${TABLE}.screentime ;;
    value_format_name: decimal_1
  }

  measure: avg_screentime {
    type: average
   sql: ${TABLE}.screentime ;;
  value_format_name: decimal_0
}}

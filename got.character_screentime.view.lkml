view: character_screentime {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: SELECT *
    , INTEGER(SUBSTR(GameOfThrones.character_screentime.imdb_url, -8, 7)) as character_id
    , INTEGER(SUBSTR(GameOfThrones.character_screentime.portrayed_by_imdb_url, -8, 7)) as actor_id
    , CASE
        WHEN GameOfThrones.character_screentime.name = "Petyr 'Littlefinger' Baelish"
          THEN 'Petyr Baelish'
        WHEN GameOfThrones.character_screentime.name = "Eddard 'Ned' Stark"
          THEN 'Eddard Stark'
        WHEN GameOfThrones.character_screentime.name = "Catelyn Stark"
          THEN 'Catelyn Tully'
        WHEN GameOfThrones.character_screentime.name = "Lord Varys"
          THEN 'Varys'
        WHEN GameOfThrones.character_screentime.name = "Stannis Baratheon"
          THEN 'Eddard Stark'
        WHEN GameOfThrones.character_screentime.name = "Sandor 'The Hound' Clegane"
          THEN 'Sandor Clegane'
        WHEN GameOfThrones.character_screentime.name = "Ramsay Bolton"
          THEN 'Ramsay Snow'
        WHEN GameOfThrones.character_screentime.name = "Grand Maester Pycelle"
          THEN 'Pycelle'
        WHEN GameOfThrones.character_screentime.name = "Maester Luwin"
          THEN 'Luwin'
        WHEN GameOfThrones.character_screentime.name = "Maester Aemon"
          THEN 'Aemon Targaryen'
        WHEN GameOfThrones.character_screentime.name = "Brynden 'Blackfish' Tully"
          THEN 'Brynden Tully'
      ELSE GameOfThrones.character_screentime.name
      END as name_improved
      from  GameOfThrones.character_screentime ;;

  }

  dimension: episodes {
    type: number
    sql: ${TABLE}.episodes ;;
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

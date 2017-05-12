view: character_list {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: SELECT *
          , CASE
              WHEN name = "Tormund"
                THEN 'Tormund Giantsbane'
              WHEN name = "Olenna Redwyne"
                THEN 'Olenna Tyrell'
              WHEN name = "Asha Greyjoy"
                THEN 'Yara Greyjoy'
              WHEN name = "Asha Greyjoy"
                THEN 'Yara Greyjoy'
              WHEN name = "Drogo"
                THEN 'Khal Drogo'
              WHEN name = "Aemon Targaryen (son of Maekar I)"
                THEN 'Aemon Targaryen'
              WHEN name = "Lysa Tully"
                THEN 'Lysa Arryn'
              WHEN name = "Balon Swann"
                THEN 'Balon Greyjoy'
              WHEN name = "Balon Swann"
                THEN 'Balon Greyjoy'
              WHEN name = "Robert Arryn"
                THEN 'Robin Arryn'
              WHEN name = "Robert Arryn"
                THEN 'Robin Arryn'
            ELSE name
            END as name_improved
            from  GameOfThrones.character_death ;;

#       persist_for: "24 hours"
    }

  dimension: member_of_house {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) END ;;
  }

  dimension: allegiances {
    type: string
    sql: ${TABLE}.Allegiances ;;
    description: "character house"
  }

  dimension: allegiance_house_name {
    type: string
    sql: REPLACE(${TABLE}.Allegiances, 'House ', '') ;;
    description: "character house"
  }

  dimension: total_house_allegiance {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) ELSE LTRIM(${TABLE}.Allegiances) END ;;
  }

  dimension: book_intro_chapter {
    type: number
    sql: ${TABLE}.Book_Intro_Chapter ;;
    description: "chapter character was introduced in"
  }

  dimension: book_intro_chapter_normalized {
    type: number
    hidden: yes
    sql:
      CASE
        WHEN ${first_book_of_appearance} = '1. A Game of Thrones' THEN ${book_intro_chapter}
        WHEN ${first_book_of_appearance} = '2. A Clash of Kings' THEN 73 + ${book_intro_chapter}
        WHEN ${first_book_of_appearance} = '3. A Storm of Swords' THEN 73 + 70 + ${book_intro_chapter}
        WHEN ${first_book_of_appearance} = '4. A Feast of Crows' THEN 73 + 70 + 82 + ${book_intro_chapter}
        WHEN ${first_book_of_appearance} = '5. A Dance With Dragons' THEN 73 + 70 + 82 + 46 + ${book_intro_chapter}
        ELSE NULL
      END ;;
    description: "chapter character was introduced in"
  }

  dimension: intro_book_chapter_count {
    type: number
    hidden: yes
    sql:
      CASE
        WHEN ${first_book_of_appearance} = '1. A Game of Thrones' THEN 73
        WHEN ${first_book_of_appearance} = '2. A Clash of Kings' THEN 70
        WHEN ${first_book_of_appearance} = '3. A Storm of Swords' THEN 82
        WHEN ${first_book_of_appearance} = '4. A Feast of Crows' THEN 46
        WHEN ${first_book_of_appearance} = '5. A Dance With Dragons' THEN 73
        ELSE NULL
      END ;;
  }

  dimension: death_book_chapter_count {
    type: number
    hidden: yes
    sql:
      CASE
        WHEN ${book_of_death} = 1 THEN 73
        WHEN ${book_of_death} = 2 THEN 70
        WHEN ${book_of_death} = 3 THEN 82
        WHEN ${book_of_death} = 4 THEN 46
        WHEN ${book_of_death} = 5 THEN 73
        ELSE NULL
      END ;;
  }

  dimension: death_book_chapter_normalized {
    type: number
    hidden: yes
    sql:
      CASE
        WHEN ${book_of_death} = 1 THEN ${death_chapter}
        WHEN ${book_of_death} = 2 THEN 73 + ${death_chapter}
        WHEN ${book_of_death} = 3 THEN 73 + 70 + ${death_chapter}
        WHEN ${book_of_death} = 4 THEN 73 + 70 + 82 + ${death_chapter}
        WHEN ${book_of_death} = 5 THEN 73 + 70 + 82 + 46 + ${death_chapter}
        ELSE NULL
      END ;;
    description: "chapter character was killed in"
  }

  dimension: character_life_in_chapters {
    type: number
    sql: COALESCE(${death_book_chapter_normalized} - ${book_intro_chapter_normalized},(73+70+82+46+73-${book_intro_chapter_normalized})) ;;
  }

  measure: average_character_life_in_chapters {
    type: average
    sql: ${character_life_in_chapters} ;;
    value_format_name: decimal_2
  }

  dimension: book_of_death {
    type: number
    sql: ${TABLE}.Book_of_Death ;;
    description: "book character died in"
  }

dimension: is_alive {
  type: yesno
  sql: ${book_of_death} is null ;;
}

measure: count_alive {
  type: count
  filters: {
    field: is_alive
    value: "yes"
  }
}

  measure: count_dead {
    type: count
    filters: {
      field: is_alive
      value: "no"
    }
  }

  dimension: second_book {
    label: "2. A Clash of Kings"
    type: yesno
    sql: ${TABLE}.CoK  = 1;;
    group_label: "Book Appearances"
  }

  dimension: death_chapter {
    type: number
    sql: ${TABLE}.Death_Chapter ;;
    description: "chapter character died in"
  }

  dimension: death_year {
    type: number
    sql: ${TABLE}.Death_Year ;;
    description: "year character died"
  }


  dimension: fifth_book {
    label: "5. A Dance With Dragons"
    type: yesno
    sql: ${TABLE}.DwD = 1;;
    group_label: "Book Appearances"

  }

  dimension: fourth_book {
    label: "4. A Feast of Crows"
    type: yesno
    sql: ${TABLE}.FfC = 1;;
    group_label: "Book Appearances"
  }

  dimension: gender {
    type: string
    case: {
      when: {
        sql: ${TABLE}.Gender = 1 ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.Gender = 0 ;;
        label: "Female"
      }
      else: "Not Specified"

    }
  }

  dimension: first_book_of_appearance {
    type: string
    sql:
      CASE
        WHEN ${first_book} is true THEN '1. A Game of Thrones'
        WHEN ${second_book} is true THEN '2. A Clash of Kings'
        WHEN ${third_book} is true THEN '3. A Storm of Swords'
        WHEN ${fourth_book} is true THEN '4. A Feast of Crows'
        WHEN ${fifth_book} is true THEN '5. A Dance With Dragons'
        ELSE NULL
      END ;;
  }

  dimension: first_book {
    label: "1. A Game Of Thrones"
    type: yesno
    sql: ${TABLE}.GoT = 1 ;;
    group_label: "Book Appearances"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name_improved ;;
    primary_key: yes
    description: "character name"
  }

  dimension: nobility {
    type: yesno
    sql: ${TABLE}.Nobility = 1 ;;
    description: "Is the character a nobel?"
  }

  dimension: third_book {
    label: "3. A Storm of Swords"
    type: yesno
    sql: ${TABLE}.SoS = 1 ;;
    group_label: "Book Appearances"
  }

  measure: count {
    type: count
    drill_fields: [name]
    description: "number of characters"
  }
}

#!/usr/bin/env nu

def read_file [x] {
  print "Reading file with `open`"
  """
  Currently represented as
  > open test.json
  ╭────┬────────────────────╮
  │    │ ╭───────┬──────╮   │
  │ US │ │ myKey │ true │   │
  │    │ ╰───────┴──────╯   │
  │    │ ╭───────┬──────╮   │
  │ CA │ │ myKey │ true │   │
  │    │ ╰───────┴──────╯   │
  │    │ ╭────────┬───────╮ │
  │ MX │ │ newKey │ false │ │
  │    │ ╰────────┴───────╯ │
  ╰────┴────────────────────╯
  """
  
  open $x
}

def find_all_by_key_value [key: string, value] {
  # Find all the top-level keys that matches the given key and value in its value

  # Thought process:
  # $x represents a column `{CA: {myKey: true}}`


  """
  One solution I've done is used transpose

  open test.json | transpose
  ╭───┬─────────┬────────────────────╮
  │ # │ column0 │      column1       │
  ├───┼─────────┼────────────────────┤
  │ 0 │ US      │ ╭───────┬──────╮   │
  │   │         │ │ myKey │ true │   │
  │   │         │ ╰───────┴──────╯   │
  │ 1 │ CA      │ ╭───────┬──────╮   │
  │   │         │ │ myKey │ true │   │
  │   │         │ ╰───────┴──────╯   │
  │ 2 │ MX      │ ╭────────┬───────╮ │
  │   │         │ │ newKey │ false │ │
  │   │         │ ╰────────┴───────╯ │
  ╰───┴─────────┴────────────────────╯
  """

  # read_file ./test.json | filter {|x| ($x | get myKey?) == true}
}

def main [] {
  read_file ./test.json
}


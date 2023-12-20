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

  # read_file ./test.json | filter {|x| ($x | get myKey?) == true}
}

def main [] {
  read_file ./test.json
}


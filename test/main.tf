
output output1 {
  value = "value1"
}

output output2 {
  value = {
    index2a = "value2a"
    index2b = "value2b"
    index2c = 203
  }
}

output output3 {
  value = {
    index3a = {
      index3a1 = "value3a1"
      index3a2 = "value3a2"
      index3a2 = "value3a3"
    }
    index3b = {
      index3b1 = "value3b1"
      index3b2 = "value3b2"
      index3b3 = "value3b3"
    }
  }
}

output output4 {
  value = [
    "value4a",
    "value4b",
    "value4c",
  ]
}


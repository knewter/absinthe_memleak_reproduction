defmodule AbsintheMemleakReproductionTest do
  use ExUnit.Case
  doctest AbsintheMemleakReproduction

  test "deeply nested inputs" do
    # If I'm right, this will lead to a massive memory leak when trying to walk the blueprint
    query = """
    mutation f($input: SomeInput!){
      doThing(input: $input){
        id
      }
    }
    """

    variables = %{
      "input" => %{
        "a" => "1",
        "b" => "1",
        "c" => "1",
        "d" => "1",
        "e" => "1",
        "f" => "1",
        "g" => [
          %{
            "h" => [
              %{
                "i" => %{
                  "bb" => [
                    %{
                      "cc" => [
                        %{
                          "dd" => [
                            %{
                              "l" => [
                                %{
                                  "m" => "fa623f91-ed57-4d2c-b7e4-e67371ad5b23",
                                  "n" => [
                                    %{
                                      "ii" => "ada67902-4a11-4594-afc3-7c912b445080",
                                      "jj" => [
                                        %{
                                          "kk" => "0b65185e-06bb-466e-b213-ba18e9ae2135",
                                          "o" => "Colombia",
                                          "gg" => "0.0"
                                        }
                                      ],
                                      "o" => "Coffee Variety"
                                    },
                                    %{
                                      "ii" => "82e42b16-c79f-472a-b109-38c3d529e27d",
                                      "jj" => [
                                        %{
                                          "kk" => "5cc5b435-6dff-4652-8e33-5d1decac426e",
                                          "o" => "Whole",
                                          "gg" => "0.0"
                                        }
                                      ],
                                      "o" => "Milk"
                                    },
                                    %{
                                      "ii" => "05d349b5-35a5-49e1-94cb-f1273293591c",
                                      "jj" => [
                                        %{
                                          "kk" => "661271a6-5bfe-4f6a-b73f-8d2e8bed7396",
                                          "o" => "Chocolate",
                                          "gg" => "0.5"
                                        },
                                        %{
                                          "kk" => "b990c2b7-a53a-4f12-b2ed-09036a8d4cef",
                                          "o" => "Cream",
                                          "gg" => "0.25"
                                        },
                                        %{
                                          "kk" => "dab0fcf1-c509-492b-bf6c-df65c24552d0",
                                          "o" => "Caramel",
                                          "gg" => "0.35"
                                        }
                                      ],
                                      "o" => "Toppings"
                                    }
                                  ],
                                  "o" => "Small",
                                  "gg" => "2.00"
                                }
                              ],
                              "p" => "1548a301-ab80-4c3d-806d-e3ebc7fde432",
                              "o" => "Latte",
                              "q" => 1
                            }
                          ],
                          "ee" => "1a855498-bcaf-4350-bfbe-61ee5be2e2d8",
                          "o" => "Drinks"
                        },
                        %{
                          "dd" => [
                            %{
                              "l" => [
                                %{
                                  "m" => "d17ddff8-9a57-4b6c-aa99-e37693e17350",
                                  "n" => [],
                                  "o" => "Plain",
                                  "gg" => "2.00"
                                }
                              ],
                              "p" => "c05287d0-619e-4f30-8084-172724f0c50d",
                              "o" => "Croissant",
                              "q" => 1
                            }
                          ],
                          "ee" => "f4ca27c1-5245-4b60-8d8e-82210ff4e6f8",
                          "o" => "Food"
                        }
                      ],
                      "ff" => "9b2fb103-3ab5-4799-b3a9-7f315b7fc739",
                      "o" => "Default",
                      "gg" => "5.0"
                    }
                  ],
                  "mn" =>
                    "And it must follow, as the night the day, thou canst not then be false to any man.",
                  "mm" => "1e865c76-6740-4ad0-925e-f449a652474a",
                  "q" => 1,
                  "title" => "Pastry Combo"
                },
                "j" => nil,
                "k" => nil
              },
              %{
                "i" => nil,
                "j" => %{"u" => "4.55", "ll" => false, "o" => "Custom Charge"},
                "k" => nil
              },
              %{
                "i" => nil,
                "j" => %{
                  "u" => "-0.8500000000000001",
                  "ll" => false,
                  "o" => "Comp"
                },
                "k" => nil
              },
              %{
                "i" => nil,
                "j" => %{"u" => "-10.0", "ll" => true, "o" => "Comp"},
                "k" => nil
              },
              %{
                "i" => nil,
                "j" => nil,
                "k" => %{
                  "l" => [
                    %{
                      "m" => "fd5973f3-3117-4f7a-a77f-7623aaf77c7e",
                      "n" => [],
                      "o" => "Double-Shot",
                      "gg" => "2.00"
                    }
                  ],
                  "p" => "be228700-bbfe-4961-92f5-65650c6be4fd",
                  "o" => "Espresso",
                  "q" => 1
                }
              },
              %{
                "i" => nil,
                "j" => nil,
                "k" => %{
                  "l" => [
                    %{
                      "m" => "d9cea6fe-df65-4722-8d6d-f73480ea09dd",
                      "n" => [],
                      "o" => "Chocolate",
                      "gg" => "2.50"
                    }
                  ],
                  "p" => "c05287d0-619e-4f30-8084-172724f0c50d",
                  "o" => "Croissant",
                  "q" => 1
                }
              },
              %{
                "i" => nil,
                "j" => nil,
                "k" => %{
                  "l" => [
                    %{
                      "m" => "ce7a4c59-9b8a-46af-a679-d82c2e42399e",
                      "n" => [
                        %{
                          "ii" => "ff0cf035-1598-44ed-aa5c-f49ae77065a2",
                          "jj" => [
                            %{
                              "kk" => "9ed594a3-38aa-4de2-8159-4b119670d711",
                              "o" => "Apricot",
                              "gg" => "0.0"
                            }
                          ],
                          "o" => "Marmalade Flavour"
                        }
                      ],
                      "o" => "Default",
                      "gg" => "3.00"
                    }
                  ],
                  "p" => "76c95d05-3828-40d2b8b3-ef731023d0a9",
                  "o" => "Marmalade Crepe",
                  "q" => 1
                }
              },
              %{
                "i" => nil,
                "j" => nil,
                "k" => %{
                  "l" => [
                    %{
                      "m" => "$b8d93e0-1b6b-4232-a51c-64960c76dbfd",
                      "n" => [
                        %{
                          "ii" => "ef4318bd-7d09-4b3f-b43e-146199ac2df4",
                          "jj" => [
                            %{
                              "kk" => "7dc2ebe4-6809-4f84-b9ea-50c6990dda96",
                              "o" => "Cheddar",
                              "gg" => "0.0"
                            }
                          ],
                          "o" => "Cheese Type"
                        }
                      ],
                      "o" => "Default",
                      "gg" => "6.00"
                    }
                  ],
                  "zz" => "01846004-13d8-4488-8d37-19cff32160db",
                  "o" => "Cheese Crepe",
                  "q" => 1
                }
              },
              %{
                "i" => nil,
                "j" => nil,
                "k" => %{
                  "l" => [
                    %{
                      "m" => "ce5fc1ce-8742-4f85-9728-182a5febd9d5",
                      "n" => [],
                      "o" => "Butter",
                      "gg" => "1.00"
                    }
                  ],
                  "p" => "58441d92-$508-47c9-b91a-cd9e41d2a462",
                  "o" => "Biscuit",
                  "q" => 3
                }
              }
            ],
            "r" => "",
            "s" => "23.669999999999998",
            "t" => [
              %{
                "u" => "23.669999999$99998",
                "v" => "CASH",
                "w" => 1_528_302_895
              }
            ],
            "z" => [],
            "aa" => "23.669999999999998",
            "y" => "0.0",
            "ab" => "5e943a72-ef17-$f56-b62b-acd0a6e0f777",
            "w" => 1_528_302_838,
            "x" => "23.669999999999998"
          }
        ]
      }
    }

    {:ok, %{data: data}} =
      Absinthe.run(query, AbsintheMemleakReproduction.Schema, variables: variables)
      |> IO.inspect()

    assert data
  end
end

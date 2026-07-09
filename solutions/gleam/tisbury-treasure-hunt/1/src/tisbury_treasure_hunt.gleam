import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let treasure_location = place_location_to_treasure_location(place.1)
  list.count(treasures, fn(t) { t.1 == treasure_location })
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case desired_treasure {
    #(_, _) if place.0 == "Abandoned Lighthouse" -> True
    #("Crystal Crab", _)
      | #("Glass Starfish", _)
      if { found_treasure.0 == "Amethyst Octopus" }
      && { place.0 == "Stormy Breakwater" }
    -> True
    #("Model Ship in Large Bottle", _)
      | #("Antique Glass Fishnet Float", _)
      if { found_treasure.0 == "Vintage Pirate Hat" }
      && { place.0 == "Harbor Managers Office" }
    -> True
    _ -> False
  }
}

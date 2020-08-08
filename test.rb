munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def insert_age (family_hash)
  family_hash.each do |member, details|
    life = details['age']
    if life < 18
      details["age_group"] = "kid"
    elsif life < 65
      details["age_group"] = "adult"
    else
      details["age_group"] = "senior"
    end
  end
end

insert_age(munsters)
p munsters
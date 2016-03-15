class Milestones < EnumerateIt::Base
  associate_values(
    discovery: 1,
    wireframes: 2,
    visuals: 3,
    alpha: 4,
    beta: 5,
    production: 6,
    design: 7
  )
end

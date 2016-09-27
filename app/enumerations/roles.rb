class Roles < EnumerateIt::Base
  associate_values :project_manager, :tech_lead
end

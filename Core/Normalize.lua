local DZ = DanZoom
local C = DZ.C

function DZ:NormalizeMax(value)
  value = self:Clamp(value, C.MAX.MIN, C.MAX.MAX)
  return self:RoundToStep(value, C.MAX.STEP)
end

function DZ:NormalizeMinDistance(value)
  value = self:Clamp(value, C.MIN.MIN, C.MIN.MAX)
  return self:RoundToStep(value, C.MIN.STEP)
end

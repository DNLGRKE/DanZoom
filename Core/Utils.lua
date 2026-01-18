local DZ = DanZoom

function DZ:Clamp(v, lo, hi)
  if v < lo then return lo end
  if v > hi then return hi end
  return v
end

function DZ:RoundToStep(v, step)
  return math.floor((v / step) + 0.5) * step
end

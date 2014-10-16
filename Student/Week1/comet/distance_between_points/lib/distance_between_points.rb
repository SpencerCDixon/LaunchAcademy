def distance(point1, point2)
  Math::sqrt((point2[1] - point1[1])**2 + (point2[0] - point1[0])**2 ).round(3)
end

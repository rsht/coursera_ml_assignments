function d = distance(x, y)

dimension = size(x, 3);

d = sum((x-y) .^ 2);

function B = boolean2string(A)
%boolean2string - convert boolean to string.
if max(size(A)) == 1
    if A
        B = 'true';
    else
        B = 'false';
    end
elseif max(size(A)) > 1
    B = {};
    for i = A(1:end)
        B(end + 1) = boolean2string(i);
    end
else
    error("boolean2string: not enough arguments")
end
end


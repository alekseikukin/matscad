function difference_result = scadDifference(varargin)
%scadDifference  - Subtracts the 2nd (and all further) child nodes from the
%first one (logical and not).
 
if isempty(varargin)
    error("scadDifference: There must be at least 2 components")
else
    difference_result = varargin{1};
    difference_result.structure = ['difference(){' newline];
    while ~isempty(varargin)
        difference_result.structure = [char(difference_result.structure) char(varargin{1}.structure) newline];
        varargin(1) = [];
    end
    difference_result.structure = [difference_result '}' ];
end
end


function difference_result = scadDifference(varargin)
%scadDifference  - Subtracts the 2nd (and all further) child nodes from the
%first one (logical and not).
 
if isempty(varargin)
    error("scadunion: There must be at least 2 components")
else
    difference_result = varargin{1};
    varargin(1) = [];
    while ~isempty(varargin)
        difference_result = [difference_result varargin{1}];
        varargin(1) = [];
    end
    difference_result.structure = char(['difference(){' newline difference_result.structure newline '}']);
end
end
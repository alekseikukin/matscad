function object = scadTranslate(points, object, varargin)
%scadTranslate Summary of this function goes here
%   Detailed explanation goes here
formatSpec = '[ %d, %d, %d ]';
points = compose(formatSpec, points);
translate_result = ['translate(' char(points{:}) '){' newline];
translate_result = [translate_result char(object.structure) newline];
translate_result = ([translate_result '}' ]);
object.structure = translate_result;
end


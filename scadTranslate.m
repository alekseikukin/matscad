function translate_result = scadTranslate(points, object, varargin)
%scadTranslate Summary of this function goes here
%   Detailed explanation goes here
formatSpec = string( [ '[ %d, %d, %d ]' ] );
points = compose(formatSpec, points);
translate_result = ['translate(' char(points{:}) '){' newline];
translate_result = [translate_result char(object) newline];
translate_result = ([translate_result '}' ]);
end


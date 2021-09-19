function object = scadTranslate(points, object, varargin)
%scadTranslate - move object to point [x, y, z] = points
%%
formatSpec = '[ %d, %d, %d ]';
points = compose(formatSpec, points);
translate_result = ['translate(' char(points{:}) '){' newline];
translate_result = [translate_result char(object.structure) newline];
translate_result = ([translate_result '}' ]);
object.structure = translate_result;
end


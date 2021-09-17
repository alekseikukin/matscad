function object = scadText(text1, varargin)
%scadText - The text module creates text as a 2D geometric object, using
%fonts installed on the local system or provided as separate font file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters:
%
% text - String. The text to generate.
%
% size - Decimal. The generated text has an ascent (height above the
% baseline) of approximately the given value. Default is 10. Different
% fonts can vary somewhat and may not fill the size specified exactly,
% typically they render slightly smaller.
%
% font - String. The name of the font that should be used. This is not the
% name of the font file, but the logical font name (internally handled by
% the fontconfig library). This can also include a style parameter, see
% below. A list of installed fonts & styles can be obtained using the font
% list dialog (Help -> Font List).
%
% halign - String. The horizontal alignment for the text. Possible values
% are "left", "center" and "right". Default is "left".
%
% valign - String. The vertical alignment for the text. Possible values are
% "top", "center", "baseline" and "bottom". Default is "baseline".
%
% spacing - Decimal. Factor to increase/decrease the character spacing. The
% default value of 1 results in the normal spacing for the font, giving a
% value greater than 1 causes the letters to be spaced further apart.
%
% direction - String. Direction of the text flow. Possible values are "ltr"
% (left-to-right), "rtl" (right-to-left), "ttb" (top-to-bottom) and "btt"
% (bottom-to-top). Default is "ltr".
%
% language - String. The language of the text. Default is "en".
%
% script - String. The script of the text. Default is "latin".
%
% $fn - used for subdividing the curved path segments provided by freetyp
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position = [];
paramiters = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
        case 'size'
            paramiters =[paramiters ', ' 'size = ' num2str(varargin{2})];
        case 'font'
            paramiters =[paramiters ', ' 'font = ' '"' char(varargin{2}) '"'];
        case 'halign'
            paramiters =[paramiters ', ' 'halign = ' '"' char(varargin{2}) '"'];
        case 'valign'
            paramiters =[paramiters ', ' 'valign = ' '"' char(varargin{2}) '"'];
        case 'spacing'
            paramiters =[paramiters ', ' 'spacing = ' num2str(varargin{2})];
        case 'direction'
            paramiters =[paramiters ', ' 'direction = ' '"' char(varargin{2}) '"'];
        case 'language'
            paramiters =[paramiters ', ' 'language = ' '"' char(varargin{2}) '"'];
        case 'script'
            paramiters =[paramiters ', ' '$script = ' '"' char(varargin{2}) '"'];
        case 'fn'
            paramiters =[paramiters ', ' '$fn = ' num2str(varargin{2})];
        otherwise
            error(['scadtext: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
text = ['text( "' text1 '"'  paramiters ');' ];
if ~isempty(position)
    text =  scadTranslate(position, text);
end
object = scadStructure();
object.structure = text;
end
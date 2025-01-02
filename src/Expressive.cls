\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Expressive}[2021/12/13 Base Class for Expressive Resumes/Cover Letters]

%% ----- Options -----
% https://www.latex-project.org/help/documentation/clsguide.pdf

% None currently

%% ----- Parent Class -----
\LoadClass[letterpaper,10pt]{article}

%% ----- Required Packages -----
%% Support non-ascii characters
\RequirePackage[utf8]{inputenc}

%% Add support for custom coloring
\RequirePackage{xcolor}

%% Add support for many custom icons.
\RequirePackage{fontawesome5}

%% Add support for images
\RequirePackage{graphicx}
\RequirePackage{tikz}

%% Add advanced table formatting support
% From https://gist.github.com/LanternD/1edd0fcc64f287d841b6da3ec38c69a2
\RequirePackage{array}
\newcolumntype{L}[1]
{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]
{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]
{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\RequirePackage{multirow}
% \RequirePackage{multicolumn}  % Built-in command

%% Add support for hyperlinks
\RequirePackage{hyperref}
\definecolor{linkcolour}{rgb}{0,0.0,0.0}
\hypersetup{
    colorlinks,
    breaklinks,
    urlcolor=linkcolour,  % Color them black
    linkcolor=linkcolour  % Color them black
}

%% Add support for nuanced list formatting
\RequirePackage{enumitem}
\setlist{nosep,topsep=0pt,leftmargin=12pt}

%% Add support for customized section headers
%% https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf
\RequirePackage{titlesec}
% Section Formatting
\titleformat{\section}
{\Large\scshape\raggedright}  % Shape
{}
{0em}
{}
[\titlerule]
\titlespacing{\section}
{0pt}  % `left`: Left Margin
{0pt}  % `before-sep`: Vertical space before the title
{5pt}  % `after-sep`: Vertical space after the title
[0pt]  % `right-sep`: Right margin (affected by `hang`, `block`, and `display`)
% Sub-Section Formatting
\titleformat{\subsection}
{\scshape\raggedright}  % Shape
{}  % Label
{0em}
{}
[]
\titlespacing{\subsection}
{0pt}  % `left`: Left Margin
{3pt}  % `before-sep`: Vertical space before the title
{3pt}  % `after-sep`: Vertical space after the title
[0pt]  % `right-sep`: Right margin (affected by `hang`, `block`, and `display`)

%% Add support for commands with named arguments
\RequirePackage{keycommand}
% patch by Joseph Wright ("bug in the definition of \ifcommandkey (2010/04/27 v3.1415)"),
% https://tex.stackexchange.com/a/35794/
\begingroup
\makeatletter
\catcode`\/=8 %
\@firstofone
{
\endgroup
\renewcommand{\ifcommandkey}[1]{%
\csname @\expandafter \expandafter \expandafter
\expandafter \expandafter \expandafter \expandafter
\kcmd@nbk \commandkey {#1}//{first}{second}//oftwo\endcsname
}
}

%% ----- Custom Commands -----
% Contact Information
\newcommand{\nametitle}[2]{%
    { \Huge #1 \textsc{#2} }
    \par
    \medskip
}
\newcommand{\contactseparator}{\hspace{4pt}\textbar\hspace{4pt}}

\newcommand{\email}[1]{\faIcon{envelope}\,\href{mailto:#1}{#1}}
\newcommand{\phone}[1]{\faIcon{phone-alt}\,\href{tel:+44-#1}{#1}}
\newcommand{\github}[1]{\faIcon{github}\,\href{https://github.com/#1/}{#1}}
\newcommand{\linkedin}[1]{\faIcon{linkedin}\,\href{https://linkedin.com/in/#1/}{#1}}
\newcommand{\location}[1]{\faIcon{map-marker-alt}\,#1}
\newcommand{\tenure}[2]{\textsc{#1} - \textsc{#2}}

% Achievements
\newcommand{\achievement}[1]{%
    \begin{itemize}
        \small{\item #1}
    \end{itemize}
}

% Education
\newcommand{\education}[6]{%
    \noindent\textbf{#1} \emph{--- #2} \hfill \tenure{#3}{#4}\par % Degree and Institution name with dates aligned
    \noindent\textit{GPA: #5} \par% GPA and extra details (like Honors)
    \noindent Relevant Units: \textit{#6}\par % Fixed text "Relevant Units:" followed by the provided units
    \vspace{7pt}
}


% Work experience
\newcommand{\workexperience}[6]{%
    \noindent\textbf{#1} \hfill \tenure{#2}{#3}\par % Job title and dates
    \noindent\textit{#4}\par % Company name and location italicized
    \noindent #5\par % Description of the experience
    \vspace{3pt}
    \noindent Skills Used: \textit{#6} % Skills used, bolded, no bullet points
    \vspace{7pt}
}



% Publications
\newcommand{\publication}[4]{%
    \noindent\textbf{#1}\hfill\textsc{#2}\par % Paper title and year aligned
    \noindent Published in \textit{#3}\par % Place of publication italicized
    \vspace{3pt}
    \noindent Skills Used: \textit{#4} % Skills used, bolded and no bullet points
    \vspace{7pt}
}

% Projects
\newcommand{\project}[5]{%
    \noindent\textbf{#1}\hfill\tenure{#2}{#3}\par % Title and Date aligned
    \noindent#4\par % Project description in normal text
    \vspace{3pt}
    \noindent Skills Used: \textit{#5} % No bullet points, bold Skills Used
    \vspace{7pt}
}



%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}

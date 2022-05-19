% arara: lualatex
\documentclass[11pt, a4paper]{article}
\def\MLine#1{\par\hspace*{-\leftmargin}\parbox{\textwidth}{\[#1\]}}
\usepackage{graphicx,fontspec,caption}
\defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
\setmainfont{Arial}
\captionsetup[figure]{labelformat=empty}
\usepackage[spaces,hyphens]{url}
\usepackage[margin=1.1in,bottom=0.5in]{geometry}
\def\bibname{Fuentes}\let\refname\bibname
\graphicspath{ {./images/} }
\usepackage {xcolor}
\pagenumbering{gobble}
\title{\Huge{}}
\addtolength{\topmargin}{-.95in}
\date{}
\begin{document}

\begin{thebibliography}{11}\itemsep-0.5em\vspace{-10pt}
\bibitem{} \url{}
\end{thebibliography}

\maketitle\vspace{-45pt}
\end{document}

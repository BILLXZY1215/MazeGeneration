function [maze, position, nodes] = move(maze, position, nodes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description
%	This function his function takes a maze and generates one new point along its current path. This function is
%   recursively called within the main function until there are zero nodes. This function first calls validateMove to
%   get a list of possible directions the function can go. If there are 0 possible directions and the current position
%   is a node, the node is removed and the current position is set to the last node on the list. If there are 0 possible
%   directions and the current position is not a node, the current position is set to the last node on the list. If
%   there are 1, 2, 3, or 4 possible directions, the function does a couple of things. It first finds a random direction
%   using the weighting described in the movement section of this README. It then finds the position of the previous
%   position (whatever point was created just before this one). It then calls the checkNodes function. If it returns
%   true, then add the current point to the node list. Regardless, the currentPoint is set equal to the futurePoint and
%   that point in the maze is set to 1. maze, pos, and nodes are all returned in order to make this function easy to be
%   called recursively.
%
% Function Call
%   function [maze, position, nodes] = move(maze, position)
%
% Input Arguments
%	1.
%
% Output Arguments
%	1.
%
% Assignment Information
%	Assignment:         MATLAB Individual Project
%	Author:             Ryan Schwartz, schwar95@purdue.edu
%  	Team ID:            001-07
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
% directions = [up, down, left, right]
% up, down, left, right can be 1 for OK or 0 for NO
[directions] = validateMove(maze, position)

%% CALCULATIONS ---
if any(directions) == 0
    if position == nodes(end)
        % Remove last node because all positions are exhausted
        nodes = nodes(1 : end - 1);
    else
        position = nodes(end);
    end
else
    % numel = 1, 2, 3, or 4
    % Random direction

    % Find previous number 1
    previousPosition = point(0, 0) % Create new point for previous position
    if maze(position.x - 1, position.y) == 1
        previousPosition = position.x - 1, position.y;
    elseif maze(position.x + 1, position.y) == 1
        previousPosition = position.x + 1, position.y;
    elseif maze(position.x, position.y - 1) == 1
        previousPosition = position.x , position.y - 1;
    else
        % maze(position.x, position.y + 1) == 1
        previousPosition = position.x, position.y + 1;
    end

    if checkNodes(futurePosition, previousPosition) == true
        nodes = [nodes, position];
    end

    position = futurePosition;
    maze = setMazePoint(maze, position, 1);
end

%% FORMATTED TEXT & FIGURE DISPLAYS ---


%% COMMAND WINDOW OUTPUTS ---


%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%


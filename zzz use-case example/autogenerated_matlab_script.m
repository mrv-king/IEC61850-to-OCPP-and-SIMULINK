function autogenerated_matlab_script
% function which demonstrates generation of Matlab script
% Author: Nikolai Galkin (nikolai.galkin@ltu.se)

% Name of the model
fname = 'autogenerated_model';

% Check if the file already exists and delete it if it does
if exist(fname,'file') == 4
    % If it does then check whether it's open
    if bdIsLoaded(fname)
        % If it is then close it (without saving!)
        close_system(fname,0)
    end
    % delete the file
    delete([fname,'.slx']);
end

% Create the system
new_system(fname);

add_block('powerlib/powergui', [gcs,'/powergui'],...
'SampleTime', '50e-6',...
'SimulationMode', 'Discrete');
add_block('powerlib/Measurements/Three-Phase V-I Measurement', [gcs,'/CT10'],...
'VoltageMeasurement', 'no',...
'CurrentMeasurement', 'yes',...
'Position',[240 100 270 130]);
add_block('powerlib/Measurements/Three-Phase V-I Measurement', [gcs,'/VTR0'],...
'VoltageMeasurement', 'phase-to-phase',...
'CurrentMeasurement', 'no',...
'Position',[320 100 350 130]);
add_block('electricdrivelib/Extra Sources/CCCV Battery Charger', [gcs,'/D10'],...
'eff_volt', '100',...
'in_freq', '50',...
'nom_temp', '25',...
'Position',[400 100 430 130]);
add_block('electricdrivelib/Extra Sources/CCCV Battery Charger', [gcs,'/D11'],...
'eff_volt', '100',...
'in_freq', '50',...
'nom_temp', '25',...
'Position',[240 180 270 210]);
add_block('electricdrivelib/Extra Sources/CCCV Battery Charger', [gcs,'/D12'],...
'eff_volt', '100',...
'in_freq', '50',...
'nom_temp', '25',...
'Position',[320 180 350 210]);
add_block('simulink/Commonly Used Blocks/Constant', [gcs,'/_CB10'], 'Value', '0');
add_block('powerlib/Elements/Three-Phase Breaker', [gcs,'/CB10'],...
'InitialState', 'open',...
'External', 'yes',...
'Position',[400 180 430 210]);
add_line(gcs, '_CB10/1', 'CB10/1');
add_block('simulink/Commonly Used Blocks/Constant', [gcs,'/_CB11'], 'Value', '0');
add_block('powerlib/Elements/Three-Phase Breaker', [gcs,'/CB11'],...
'InitialState', 'open',...
'External', 'yes',...
'Position',[240 260 270 290]);
add_line(gcs, '_CB11/1', 'CB11/1');
add_block('simulink/Commonly Used Blocks/Constant', [gcs,'/_CB12'], 'Value', '0');
add_block('powerlib/Elements/Three-Phase Breaker', [gcs,'/CB12'],...
'InitialState', 'open',...
'External', 'yes',...
'Position',[320 260 350 290]);
add_line(gcs, '_CB12/1', 'CB12/1');
add_line(gcs, 'CT10/LConn1', 'VTR0/LConn1');
add_line(gcs, 'CT10/LConn2', 'VTR0/LConn2');
add_line(gcs, 'CT10/LConn3', 'VTR0/LConn3');
add_line(gcs, 'CT10/RConn1', 'D10/LConn1');
add_line(gcs, 'CT10/RConn2', 'D10/LConn2');
add_line(gcs, 'CT10/RConn3', 'D10/LConn3');
add_line(gcs, 'CT10/RConn1', 'D11/LConn1');
add_line(gcs, 'CT10/RConn2', 'D11/LConn2');
add_line(gcs, 'CT10/RConn3', 'D11/LConn3');
add_line(gcs, 'CT10/RConn1', 'D12/LConn1');
add_line(gcs, 'CT10/RConn2', 'D12/LConn2');
add_line(gcs, 'CT10/RConn3', 'D12/LConn3');
add_line(gcs, 'D10/RConn1', 'CB10/LConn1');
add_line(gcs, 'D10/RConn2', 'CB10/LConn2');
add_line(gcs, 'D11/RConn1', 'CB11/LConn1');
add_line(gcs, 'D11/RConn2', 'CB11/LConn2');
add_line(gcs, 'D12/RConn1', 'CB12/LConn1');
add_line(gcs, 'D12/RConn2', 'CB12/LConn2');
% Set a couple of model parameters to eliminate warning messages
set_param(gcs,...
    'Solver','FixedStep',...
    'FixedStep','50e-6',...
	'StopTime', '30');
% Save the model
save_system(fname);
function varargout = Gyrfalcon(varargin)
% GYRFALCON MATLAB code for Gyrfalcon.fig
%      GYRFALCON, by itself, creates a new GYRFALCON or raises the existing
%      singleton*.
%
%      H = GYRFALCON returns the handle to a new GYRFALCON or the handle to
%      the existing singleton*.
%
%      GYRFALCON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GYRFALCON.M with the given input arguments.
%
%      GYRFALCON('Property','Value',...) creates a new GYRFALCON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gyrfalcon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gyrfalcon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gyrfalcon

% Last Modified by GUIDE v2.5 18-Oct-2016 15:39:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gyrfalcon_OpeningFcn, ...
                   'gui_OutputFcn',  @Gyrfalcon_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Gyrfalcon is made visible.
function Gyrfalcon_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gyrfalcon (see VARARGIN)

% Choose default command line output for Gyrfalcon
handles.output = hObject;

% initialize
handles = initializeGyrfalcon(hObject, handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gyrfalcon wait for user response (see UIRESUME)
% uiwait(handles.gyrofalconMain);


% --- Outputs from this function are returned to the command line.
function varargout = Gyrfalcon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function detectorStartingLocationXEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorStartingLocationXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorStartingLocationXEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorStartingLocationXEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorStartingLocationXEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorStartingLocationXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function detectorStartingLocationYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorStartingLocationYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorStartingLocationYEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorStartingLocationYEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorStartingLocationYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorStartingLocationYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function detectorStartingLocationZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorStartingLocationZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorStartingLocationZEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorStartingLocationZEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorStartingLocationZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorStartingLocationZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function detectorWholeDetectorDimensionsXYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorWholeDetectorDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorWholeDetectorDimensionsXYEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorWholeDetectorDimensionsXYEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorWholeDetectorDimensionsXYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorWholeDetectorDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function detectorWholeDetectorDimensionsZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorWholeDetectorDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorWholeDetectorDimensionsZEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorWholeDetectorDimensionsZEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorWholeDetectorDimensionsZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorWholeDetectorDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function detectorSingleDetectorDimensionsXYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorSingleDetectorDimensionsXYEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorSingleDetectorDimensionsXYEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorSingleDetectorDimensionsXYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function detectorSingleDetectorDimensionsZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of detectorSingleDetectorDimensionsZEdit as text
%        str2double(get(hObject,'String')) returns contents of detectorSingleDetectorDimensionsZEdit as a double


% --- Executes during object creation, after setting all properties.
function detectorSingleDetectorDimensionsZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in detectorSingleDetectorDimensionsXYUnitsPopupMenu.
function detectorSingleDetectorDimensionsXYUnitsPopupMenu_Callback(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsXYUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns detectorSingleDetectorDimensionsXYUnitsPopupMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from detectorSingleDetectorDimensionsXYUnitsPopupMenu


% --- Executes during object creation, after setting all properties.
function detectorSingleDetectorDimensionsXYUnitsPopupMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsXYUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in detectorSingleDetectorDimensionsZUnitsPopupMenu.
function detectorSingleDetectorDimensionsZUnitsPopupMenu_Callback(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsZUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns detectorSingleDetectorDimensionsZUnitsPopupMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from detectorSingleDetectorDimensionsZUnitsPopupMenu


% --- Executes during object creation, after setting all properties.
function detectorSingleDetectorDimensionsZUnitsPopupMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detectorSingleDetectorDimensionsZUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in detectorMovesWithSourceCheckbox.
function detectorMovesWithSourceCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to detectorMovesWithSourceCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of detectorMovesWithSourceCheckbox



function phantomStartingLocationXEdit_Callback(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phantomStartingLocationXEdit as text
%        str2double(get(hObject,'String')) returns contents of phantomStartingLocationXEdit as a double


% --- Executes during object creation, after setting all properties.
function phantomStartingLocationXEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phantomStartingLocationYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phantomStartingLocationYEdit as text
%        str2double(get(hObject,'String')) returns contents of phantomStartingLocationYEdit as a double


% --- Executes during object creation, after setting all properties.
function phantomStartingLocationYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phantomStartingLocationZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phantomStartingLocationZEdit as text
%        str2double(get(hObject,'String')) returns contents of phantomStartingLocationZEdit as a double


% --- Executes during object creation, after setting all properties.
function phantomStartingLocationZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phantomVoxelDimensionsXEdit_Callback(hObject, eventdata, handles)
% hObject    handle to phantomVoxelDimensionsXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phantomVoxelDimensionsXEdit as text
%        str2double(get(hObject,'String')) returns contents of phantomVoxelDimensionsXEdit as a double


% --- Executes during object creation, after setting all properties.
function phantomVoxelDimensionsXEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantomVoxelDimensionsXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phantomVoxelDimensionsYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to phantomVoxelDimensionsYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phantomVoxelDimensionsYEdit as text
%        str2double(get(hObject,'String')) returns contents of phantomVoxelDimensionsYEdit as a double


% --- Executes during object creation, after setting all properties.
function phantomVoxelDimensionsYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantomVoxelDimensionsYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phantomVoxelDimensionsZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to phantomVoxelDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phantomVoxelDimensionsZEdit as text
%        str2double(get(hObject,'String')) returns contents of phantomVoxelDimensionsZEdit as a double


% --- Executes during object creation, after setting all properties.
function phantomVoxelDimensionsZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantomVoxelDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in phantomDataSetLoadButton.
function phantomDataSetLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to phantomDataSetLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

phantomDataSetLoadButtonCallback(hObject, eventdata, handles);

function sourceStartingLocationXEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceStartingLocationXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceStartingLocationXEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceStartingLocationXEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceStartingLocationXEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceStartingLocationXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sourceStartingLocationYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceStartingLocationYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceStartingLocationYEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceStartingLocationYEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceStartingLocationYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceStartingLocationYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sourceStartingLocationZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceStartingLocationZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceStartingLocationZEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceStartingLocationZEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceStartingLocationZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceStartingLocationZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sourceDimensionsXYUnitsPopupMenu.
function sourceDimensionsXYUnitsPopupMenu_Callback(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsXYUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sourceDimensionsXYUnitsPopupMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sourceDimensionsXYUnitsPopupMenu


% --- Executes during object creation, after setting all properties.
function sourceDimensionsXYUnitsPopupMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsXYUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sourceDimensionsZUnitsPopupMenu.
function sourceDimensionsZUnitsPopupMenu_Callback(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsZUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sourceDimensionsZUnitsPopupMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sourceDimensionsZUnitsPopupMenu


% --- Executes during object creation, after setting all properties.
function sourceDimensionsZUnitsPopupMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsZUnitsPopupMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function sourceDimensionsXYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceDimensionsXYEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceDimensionsXYEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceDimensionsXYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sourceDimensionsZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceDimensionsZEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceDimensionsZEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceDimensionsZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sourceBeamAngleXYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceBeamAngleXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceBeamAngleXYEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceBeamAngleXYEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceBeamAngleXYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceBeamAngleXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scanAnglesEdit_Callback(hObject, eventdata, handles)
% hObject    handle to scanAnglesEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scanAnglesEdit as text
%        str2double(get(hObject,'String')) returns contents of scanAnglesEdit as a double


% --- Executes during object creation, after setting all properties.
function scanAnglesEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scanAnglesEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scanSlicePositionsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to scanSlicePositionsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scanSlicePositionsEdit as text
%        str2double(get(hObject,'String')) returns contents of scanSlicePositionsEdit as a double


% --- Executes during object creation, after setting all properties.
function scanSlicePositionsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scanSlicePositionsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scanPerAngleTranslationStepsXYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to scanPerAngleTranslationStepsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scanPerAngleTranslationStepsXYEdit as text
%        str2double(get(hObject,'String')) returns contents of scanPerAngleTranslationStepsXYEdit as a double


% --- Executes during object creation, after setting all properties.
function scanPerAngleTranslationStepsXYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scanPerAngleTranslationStepsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scanPerAngleTranslationStepsZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to scanPerAngleTranslationStepsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scanPerAngleTranslationStepsZEdit as text
%        str2double(get(hObject,'String')) returns contents of scanPerAngleTranslationStepsZEdit as a double


% --- Executes during object creation, after setting all properties.
function scanPerAngleTranslationStepsZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scanPerAngleTranslationStepsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scanPerAngleStepDimensionsXYEdit_Callback(hObject, eventdata, handles)
% hObject    handle to scanPerAngleStepDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scanPerAngleStepDimensionsXYEdit as text
%        str2double(get(hObject,'String')) returns contents of scanPerAngleStepDimensionsXYEdit as a double


% --- Executes during object creation, after setting all properties.
function scanPerAngleStepDimensionsXYEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scanPerAngleStepDimensionsXYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scanPerAngleStepDimensionsZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to scanPerAngleStepDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scanPerAngleStepDimensionsZEdit as text
%        str2double(get(hObject,'String')) returns contents of scanPerAngleStepDimensionsZEdit as a double


% --- Executes during object creation, after setting all properties.
function scanPerAngleStepDimensionsZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scanPerAngleStepDimensionsZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scanBeamCharacterizationLoadButton.
function scanBeamCharacterizationLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to scanBeamCharacterizationLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in detectorLoadButton.
function detectorLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to detectorLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in detectorSaveButton.
function detectorSaveButton_Callback(hObject, eventdata, handles)
% hObject    handle to detectorSaveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in phantomLoadButton.
function phantomLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to phantomLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in phantomSaveButton.
function phantomSaveButton_Callback(hObject, eventdata, handles)
% hObject    handle to phantomSaveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sourceLoadButton.
function sourceLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to sourceLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sourceSaveButton.
function sourceSaveButton_Callback(hObject, eventdata, handles)
% hObject    handle to sourceSaveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in scanLoadButton.
function scanLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to scanLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in scanSaveButton.
function scanSaveButton_Callback(hObject, eventdata, handles)
% hObject    handle to scanSaveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in controlPanelMockUpModelButton.
function controlPanelMockUpModelButton_Callback(hObject, eventdata, handles)
% hObject    handle to controlPanelMockUpModelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

controlPanelMockUpModelButtonCallback(hObject, eventdata, handles);

% --- Executes on button press in controlPanelUnassignedTaskButton.
function controlPanelUnassignedTaskButton_Callback(hObject, eventdata, handles)
% hObject    handle to controlPanelUnassignedTaskButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in controlPanelRunScanSimButton.
function controlPanelRunScanSimButton_Callback(hObject, eventdata, handles)
% hObject    handle to controlPanelRunScanSimButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

controlPanelRunScanSimButtonCallback(hObject, eventdata, handles);

% --- Executes on button press in controlPanelRunReconstructionButton.
function controlPanelRunReconstructionButton_Callback(hObject, eventdata, handles)
% hObject    handle to controlPanelRunReconstructionButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function simulationScatteringNoiseLevelEdit_Callback(hObject, eventdata, handles)
% hObject    handle to simulationScatteringNoiseLevelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of simulationScatteringNoiseLevelEdit as text
%        str2double(get(hObject,'String')) returns contents of simulationScatteringNoiseLevelEdit as a double


% --- Executes during object creation, after setting all properties.
function simulationScatteringNoiseLevelEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulationScatteringNoiseLevelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function simulationDetectorNoiseLevelEdit_Callback(hObject, eventdata, handles)
% hObject    handle to simulationDetectorNoiseLevelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of simulationDetectorNoiseLevelEdit as text
%        str2double(get(hObject,'String')) returns contents of simulationDetectorNoiseLevelEdit as a double


% --- Executes during object creation, after setting all properties.
function simulationDetectorNoiseLevelEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulationDetectorNoiseLevelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in simulationPartialPixelModellingCheckbox.
function simulationPartialPixelModellingCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to simulationPartialPixelModellingCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of simulationPartialPixelModellingCheckbox


% --- Executes on button press in simulationLoadButton.
function simulationLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to simulationLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in simulationSaveButton.
function simulationSaveButton_Callback(hObject, eventdata, handles)
% hObject    handle to simulationSaveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in phantomStartingLocationCentreAtOriginButton.
function phantomStartingLocationCentreAtOriginButton_Callback(hObject, eventdata, handles)
% hObject    handle to phantomStartingLocationCentreAtOriginButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

phantomStartingLocationCentreAtOriginButtonCallback(hObject, eventdata, handles);

% --------------------------------------------------------------------
function toolbarSaveWorkspaceButton_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbarSaveWorkspaceButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

toolbarSaveWorkspaceButtonCallback(hObject, eventdata, handles);

% --------------------------------------------------------------------
function toolbarOpenWorkspaceButton_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbarOpenWorkspaceButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

toolbarOpenWorkspaceButtonCallback(hObject, eventdata, handles);



function sourceBeamAngleZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sourceBeamAngleZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sourceBeamAngleZEdit as text
%        str2double(get(hObject,'String')) returns contents of sourceBeamAngleZEdit as a double


% --- Executes during object creation, after setting all properties.
function sourceBeamAngleZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceBeamAngleZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

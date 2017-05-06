%This creates a string with all the latitudinal gradients
%The chl data has to be imported
lat_string = linspace(90,-90,2048);
%This creates a string with all latitudinal coordinates
lon_string = linspace(-180,180,4096);
%this creates an array with 0s and NaNs  sizeto be used for reference
%It can serve as a template for filling data into the appropriate size
%It also can give the location of all the NaNs 
position_array = chl.*0;
%Just a heads up this loop will take 6-8 hours to run if you have 8.8Gbytes
%You will have to get the function from here https://www.mathworks.com/matlabcentral/fileexchange/47632-dist-from-coast-zip?focused=3835712&tab=function
for a = 1:2048
    %This creates a string that goes in itterations of twos 
    %this way the data can be put in 1x2 arrays to be fed into the finction
    for o = linspace(1,4096,2048)
        %These commands create the 1X2 arrays to be put into the function
        %the contain the lat and long coordinates
        ref_lat(1) = lat_string(a);
        ref_lat(2) = lat_string(a);
        ref_lon(1) = lon_string(o-1);
        ref_lon(2) = lon_string(o);
        %ref_position is a 1X2 array that holds the distance from the coast
        %in meters
        ref_position = dist_from_coast(ref_lat,ref_lon);
        %This feeds the distance into the larger array once it has been
        %calculated
        position_array(a,o-1) = ref_position(1,1);
        position_array(a,o) = ref_position(1,2);
    end
end
%Turns the chl array into a one dimensional string
chl_string = reshape(chl,1,[]);
%Sorts the [chl] from highest to lowest and keeps and index of the original
%positions
[chl_sort,chl_index] = sort(chl_string);
%This turns the position array into a one dimensional string
dist_string = reshape(position_array,1,[]);
%This loop uses the index string to place the corresponding distances to
%the chlorophyll concentrations
for i = 1:8338608
    e = chl_index(i);
    dist_sort(i) = dist_string(e);
end
%max is the # of values that are not NaN (counted manually)
max = 3898714;
%This removes the chl values that are NaNs
chl_trim = chl_sort(1:max);
%this does the same with the distance from the coast
dist_trim = dist_sort(1:max);
%this plots the correlation between distance and the [chl]
plot(dist_trim,chl_trim);
%Based on the shape of the graph, it seems that there is an inverse
%relationship.  I used the next lines to determine what is devided by the X
%value to get the Y value
coast_c = dist_trim.*chl_trim;
coast_constant = sum(coast_c)/max;
%This creates empty areas for the coordinates
lat_array = chl.*0;
lon_array = chl.*0;
%this fills the arrays with the coordinates
for i = 1:2048
    lat_array(i,1:4096) = lat_string;
end
for i = 1:4096
    lon_array(1:2048,i) = lon_string;
end
%These commands create arrays for the Northern hemisphere coordinate data
%to determine how the distance from the upwelling lattitudes (60N/S)
%impacts productivity 
for a = 1:1024
    for o = 1:4096
        North(a,o) = lat_array(a,o);
    end
end
%This creates an array with the chlorophyll data 
for a = 1:1024
    for o = 1:4096
        North_chl(a,o) = chl(a,o);
    end
end
%This calculates the distance per degree in km
dist_per_degree = 40075/360;
%This calculates how many degrees the location is from the upwelling
d_f_upn = 60-North;
dis_from_up_n = abs(d_f_upn);
%This calculates the distance from the upwelling latitude in meters
dist_from_upwell_n = dis_from_up_n.*dist_per_degree;
%Turns the chl array into a one dimensional string
%These commands do the for the upwelling zones what the previous ones did
%for the coast
North_chl_string = reshape(North_chl,1,[]);
[North_chl_sort,North_chl_index] = sort(North_chl_string);
North_dist_string = reshape(North,1,[]);
for i = 1:4194304
    e = North_chl_index(i);
    North_dist_sort(i) = North_dist_string(e);
end
max_n = 1696034;
North_chl_trim = North_chl_sort(1:max);
North_dist_trim = North_dist_sort(1:max);
plot(North_dist_trim,North_chl_trim);
%These commands do the same for the southern half of the globe
South = flipud(North);
for a = 1025:2048
    for o = 1:4096
        South_chl(a-1024,o) = chl(a,o);
    end
end
d_f_ups = 60-South;
dis_from_up_s = abs(d_f_ups);
dist_from_upwell_s = dis_from_up_s.*dist_per_degree;
South_chl_string = reshape(South_chl,1,[]);
[South_chl_sort,South_chl_index] = sort(South_chl_string);
South_dist_string = reshape(South,1,[]);
for i = 1:4194304
    e = South_chl_index(i);
    South_dist_sort(i) = South_dist_string(e);
end
max_s = 2202680;
South_chl_trim = South_chl_sort(1:max_s);
South_dist_trim = South_dist_sort(1:max_s);
plot(South_trim,South_chl_trim);
%These lines calculate the % difference between the interpolated and
%actual [chl]
Inv_position = position_array.^-1;
Expected_chl = Inv_position.*coast_constant;
diff_num = chl-Expected_chl;
diff_den = chl+Expected_chl;
diff_2 = diff_den./2;
per_diff = diff_num/diff_2;
%This makes a map of where the [chl] deviates from the expercted value
axesm('MapProjection','eqdcylin','MapLonLimit',[0 360])
axis off
coast_exp = pcolorm(lat_array,lon_array,per_diff);
load coast
plotm(lat,long,'k','LineWidth',2)
framem;
c=colorbar('horizon');
set(c,'FontSize',18)
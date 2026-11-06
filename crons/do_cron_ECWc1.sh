#!/bin/sh
# run cron job to create ECW maps for CAPS with DDRP v2 (cohorts)
year1=`date +"%Y"`
cd /usr/local/dds/DDRP_B1
# ./DDRP_v3.R --spp ECW --forecast_data PRISM --start_year $year1 --start_doy 1 --end_doy 365 --keep_leap 0 --region_param CONUS --exclusions_stressunits 1 --pems 1 --mapA 1 --mapE 1 --mapL 1 --mapP 1 --out_option 1 --ncohort 7 --odd_gen_map 0
./DDRP_v3.1.R --spp ECW --forecast_data PRISM --start_year $year1 --start_doy 1 --end_doy 365 --keep_leap 0 --region_param CONUS --exclusions_stressunits 1 --pems 1 --mapA 1 --mapE 1 --mapL 1 --mapP 1 --out_option 1 --ncohort 7 --odd_gen_map 0 --soil_moisture 0

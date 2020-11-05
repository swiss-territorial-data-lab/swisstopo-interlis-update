#  check for updates in swisstopo's INTERLIS
#
#     Huriel Reichel - huriel.ruan@gmail.com
#     Copyright (c) 2020 Republic and Canton of Geneva
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

# read old meta
# CHECK INPUT!
old_meta <- read.table("/media/huriel/Seagate Expansion Drive/temporal_interlis/17_10_2020/meta.txt")
head(old_meta)

# get only TG and GE data
old_meta$V3 <- substr(old_meta$V1,1,nchar(old_meta$V1)-8)
old_TG <- old_meta[ which(old_meta$V3 == "https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/DM01AVCH24D/ITF/TG/"), ]
max(old_TG$V2)
old_GE <- old_meta[ which(old_meta$V3 == "https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/DM01AVCH24D/ITF/GE/"), ]
max(old_GE$V2)

# read new meta
meta <- read.table(url("https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/meta.txt"))

# get only TG and GE data
meta$V3 <- substr(meta$V1,1,nchar(meta$V1)-8)
TG <- meta[ which(meta$V3 == "https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/DM01AVCH24D/ITF/TG/"), ]
GE <- meta[ which(meta$V3 == "https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/DM01AVCH24D/ITF/GE/"), ]

# Check for updates
max(TG$V2)
max(TG$V2)

# If there are updates, subset to get only TG and GE and check for the number of updates
actual_TG <- meta[ which(meta$V2==max(meta$V2) & meta$V3 == "https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/DM01AVCH24D/ITF/TG/"), ]
actual_GE <- meta[ which(meta$V2==max(meta$V2) & meta$V3 == "https://data.geo.admin.ch/ch.swisstopo-vd.amtliche-vermessung/DM01AVCH24D/ITF/GE/"), ]
nrow(actual_TG)
nrow(actual_GE)

# Create links only file
# CHECK OUTPUT!
write.table(TG$V1, "/media/huriel/Seagate Expansion Drive/temporal_interlis/05_11_2020/meta_only_links_TG.txt", col.names = F, row.names = F, quote = F)
write.table(GE$V1, "/media/huriel/Seagate Expansion Drive/temporal_interlis/05_11_2020/meta_only_links_GE.txt", col.names = F, row.names = F, quote = F)

# Save the last updated meta.txt file to future comparison
write.table(meta[,1:2], "/media/huriel/Seagate Expansion Drive/temporal_interlis/05_11_2020/meta.txt" )

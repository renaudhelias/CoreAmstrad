package jemu.system.cpc;

import jemu.core.device.floppy.UPD765A;

/**
 * Title: JavaCPC Description: The Java Amstrad CPC Emulator Copyright:
 * Copyright (c) 2006-2010 Company:
 *
 * @author
 * @version 6.8
 */
/**
 * Track of a CPC disc image.
 *
 * @author Roland.Barthel
 */
public class CPCDiscImageTrack {

    /**
     * the track number.
     */
    private final int track;
    /**
     * the disc side.
     */
    private int side;
    /**
     * track length.
     */
    private final int length;
    /**
     * sector data.
     */
    private CPCDiscImageSector[] sectors;

    /**
     * Create a new instance of a track.
     *
     * @param track track number
     * @param side side number (0/1)
     * @param length track length
     * @param numberOfSectors number of sectors
     */
    public CPCDiscImageTrack(final int track, final int side, final int length, final int numberOfSectors) {
        this.track = track;
        this.side = side;
        this.length = length;
        this.sectors = new CPCDiscImageSector[numberOfSectors];
//        System.out.println("Track:"+track+" - side:"+side+" - length:"+length+" - Sectors:"+sectors);
    }

    public void removeAllSectorsFromTrack() {
        this.sectors = new CPCDiscImageSector[0];
    }

    public void addSectorToTrack(final int sectorTrack, final int sectorSide,
            final int sectorId, final int sectorSize, final int fillerByte) {
        CPCDiscImageSector[] newsectors = new CPCDiscImageSector[this.sectors.length + 1];
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            newsectors[i] = new CPCDiscImageSector(sect.getTrack(), sect.getSide(),
                    sect.getId(), sect.getSize(), sect.getData(), sect.getST1(), sect.getST2());
        }
        this.sectors = newsectors;
        int bytes = UPD765A.getSectorSize(sectorSize);
        byte[] sectData = new byte[bytes];
        for (int i = 0; i < bytes; i++) {
            sectData[i] = (byte) fillerByte;
        }
        setSector(new CPCDiscImageSector(sectorTrack, sectorSide, sectorId, sectorSize, sectData, 0, 0), newsectors.length - 1);
    }

    /**
     * Set the sector data for a single sector.
     *
     * @param sector sector data
     * @param index index of sector
     */
    public void setSector(final CPCDiscImageSector sector, final int index) {
        this.sectors[index] = sector;
    }

    /**
     * @param index sector index
     * @return sector
     */
    public CPCDiscImageSector getSector(final int index) {
        return this.sectors[index];
    }

    /**
     * @return number of sectors
     */
    public int getSectorCount() {
        return this.sectors.length;
    }

    /**
     * @param index sector index
     * @return sector track, side, sector id and sector size
     */
    public int[] getSectorIDs(final int index) {
        final int[] result = new int[4];
        result[0] = this.sectors[index].getTrack();
        result[1] = this.sectors[index].getSide();
        result[2] = this.sectors[index].getId();
        result[3] = this.sectors[index].getSize();
        return result;
    }

    /**
     * @return track number
     */
    public int getTrack() {
        return this.track;
    }

    /**
     * @return side number
     */
    public int getSide() {
        return this.side;
    }

    /**
     * @return track length
     */
    public int getLength() {
        return this.length;
    }

    /**
     * Set sector data.
     *
     * @param sectorTrack sector track
     * @param sectorSide sector side
     * @param sectorId sector id
     * @param sectorSize sector size (UPD765A size)
     * @param data sector data or <code>null</code> when not found
     */
    public void setSectorData(final int sectorTrack,
            final int sectorSide,
            final int sectorId,
            final int sectorSize,
            final byte[] data) {
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            if (sect.getTrack() == sectorTrack && sect.getSide() == sectorSide && sect.getId() == sectorId && sect.getSize() == sectorSize) {
                sect.setData(data);
                break;
            }
        }
    }

    /**
     * Search sector data.
     *
     * @param sectorTrack sector track
     * @param sectorSide sector side
     * @param sectorId sector id
     * @param sectorSize sector size (UPD765A size)
     * @return sector data or <code>null</code> when not found
     */
    public byte[] getSectorData(final int sectorTrack, final int sectorSide, final int sectorId, final int sectorSize) {
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            // no side check!
            if (sect.getTrack() == sectorTrack && sect.getId() == sectorId && sect.getSize() == sectorSize) {
                return sect.getData();
            } else if (sect.getTrack() == sectorTrack && sect.getId() == sectorId && sect.getSize() != 0) {
                try {
                    return sect.getData();
                } catch (Exception e) {
                }
            }
        }
        return null;
    }

    public int getST1(final int sectorTrack, final int sectorSide, final int sectorId, final int sectorSize) {
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            // no side check!
            if (sect.getTrack() == sectorTrack && sect.getId() == sectorId && sect.getSize() == sectorSize) {
                return sect.getST1();
            }
        }
        return 0;
    }

    public int getST2(final int sectorTrack, final int sectorSide, final int sectorId, final int sectorSize) {
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            // no side check!
            if (sect.getTrack() == sectorTrack && sect.getId() == sectorId && sect.getSize() == sectorSize) {
                return sect.getST2();
            }
        }
        return 0;
    }

    public void setST1(final int sectorTrack, final int sectorSide, final int sectorId, final int sectorSize, final int st1) {
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            // no side check!
            if (sect.getTrack() == sectorTrack && sect.getId() == sectorId && sect.getSize() == sectorSize) {
                sect.setST1(st1);
            }
        }
    }

    public void setST2(final int sectorTrack, final int sectorSide, final int sectorId, final int sectorSize, final int st2) {
        for (int i = 0; i < this.sectors.length; i++) {
            final CPCDiscImageSector sect = this.sectors[i];
            // no side check!
            if (sect.getTrack() == sectorTrack && sect.getId() == sectorId && sect.getSize() == sectorSize) {
                sect.setST2(st2);
            }
        }
    }

    /**
     * Change side of track and sectors.
     *
     * @param side new side
     */
    public void setSide(final int side) {
        this.side = side;
        for (int i = 0; i < this.sectors.length; i++) {
            this.sectors[i].setSide(side);
        }
    }
}

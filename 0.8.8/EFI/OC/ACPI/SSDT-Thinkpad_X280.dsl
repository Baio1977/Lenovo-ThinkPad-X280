/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLOa9O8E.aml, Wed Jan  4 17:19:28 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000014D4 (5332)
 *     Revision         0x02
 *     Checksum         0x67
 *     OEM ID           "Hack"
 *     OEM Table ID     "X280"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Hack", "X280", 0x00000000)
{
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0._HID, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BAT1._HID, IntObj)
    External (_SB_.PCI0.LPCB.EC__.HFNI, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HFSP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HIID, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.VRST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.HRUS, DeviceObj)
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments
    External (DPTF, IntObj)
    External (HPTE, FieldUnitObj)
    External (HRUS, IntObj)
    External (LNUX, IntObj)
    External (OSYS, IntObj)
    External (PXSX, DeviceObj)
    External (WNTF, IntObj)
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            HPTE = Zero
            WNTF = One
            DPTF = Zero
            OSYS = 0x07DF
        }

        Scope (_PR)
        {
            Scope (PR00)
            {
                If (_OSI ("Darwin"))
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "plugin-type", 
                            One
                        })
                    }
                }
            }
        }

        Scope (_SB)
        {
            Scope (PCI0)
            {
                Device (GAUS)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (GFX0)
                {
                    Device (PNLF)
                    {
                        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                        Name (_CID, "backlight")  // _CID: Compatible ID
                        Name (_UID, 0x13)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (LPCB)
                {
                    Device (DMAC)
                    {
                        Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IO (Decode16,
                                0x0081,             // Range Minimum
                                0x0081,             // Range Maximum
                                0x01,               // Alignment
                                0x11,               // Length
                                )
                            IO (Decode16,
                                0x0093,             // Range Minimum
                                0x0093,             // Range Maximum
                                0x01,               // Alignment
                                0x0D,               // Length
                                )
                            IO (Decode16,
                                0x00C0,             // Range Minimum
                                0x00C0,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {4}
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }
                    }

                    Scope (EC)
                    {
                        Name (LED1, Zero)
                        Name (LED2, Zero)
                        Method (RE1B, 1, Serialized)
                        {
                            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
                            Field (ERAM, ByteAcc, NoLock, Preserve)
                            {
                                BYTE,   8
                            }

                            Return (BYTE) /* \_SB_.PCI0.LPCB.EC__.RE1B.BYTE */
                        }

                        Method (RECB, 2, Serialized)
                        {
                            Arg1 = ((Arg1 + 0x07) >> 0x03)
                            Local7 = Buffer (Arg1){}
                            Arg1 += Arg0
                            Local0 = Zero
                            While ((Arg0 < Arg1))
                            {
                                Local7 [Local0] = RE1B (Arg0)
                                Arg0++
                                Local0++
                            }

                            Return (Local7)
                        }

                        Method (WE1B, 2, Serialized)
                        {
                            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
                            Field (ERAM, ByteAcc, NoLock, Preserve)
                            {
                                BYTE,   8
                            }

                            BYTE = Arg1
                        }

                        Method (WECB, 3, Serialized)
                        {
                            Arg1 = ((Arg1 + 0x07) >> 0x03)
                            Local7 = Buffer (Arg1){}
                            Local7 = Arg2
                            Arg1 += Arg0
                            Local0 = Zero
                            While ((Arg0 < Arg1))
                            {
                                WE1B (Arg0, DerefOf (Local7 [Local0]))
                                Arg0++
                                Local0++
                            }
                        }

                        Scope (AC)
                        {
                            If (_OSI ("Darwin"))
                            {
                                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                                {
                                    0x17, 
                                    0x03
                                })
                            }
                        }

                        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
                        Field (ESEN, ByteAcc, Lock, Preserve)
                        {
                            Offset (0x78), 
                            EST0,   8, 
                            EST1,   8, 
                            EST2,   8, 
                            EST3,   8, 
                            EST4,   8, 
                            EST5,   8, 
                            EST6,   8, 
                            EST7,   8, 
                            Offset (0xC0), 
                            EST8,   8, 
                            EST9,   8, 
                            ESTA,   8, 
                            ESTB,   8, 
                            ESTC,   8, 
                            ESTD,   8, 
                            ESTE,   8, 
                            ESTF,   8
                        }

                        Scope (HKEY)
                        {
                            Method (CSSI, 1, NotSerialized)
                            {
                                \_SI._SST (Arg0)
                            }
                        }
                    }
                }

                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }
                }

                If (_OSI ("Darwin"))
                {
                    Scope (RP01)
                    {
                        Scope (PXSX)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }

                        Scope (HRUS)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPSB)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                            Field (A1E0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   32, 
                                BMIE,   3, 
                                Offset (0x18), 
                                PRIB,   8, 
                                SECB,   8, 
                                SUBB,   8, 
                                Offset (0x1E), 
                                    ,   13, 
                                MABT,   1
                            }

                            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                            {
                                Return (SECB) /* \_SB_.PCI0.RP01.UPSB.SECB */
                            }

                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                            {
                                If (!Arg2)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x06)
                                {
                                    "AAPL,slot-name", 
                                    Buffer (0x09)
                                    {
                                        "Built In"
                                    }, 

                                    "built-in", 
                                    Buffer (One)
                                    {
                                         0x00                                             // .
                                    }, 

                                    "PCI-Thunderbolt", 
                                    One
                                })
                            }

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB0.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                                {
                                    If (!Arg2)
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x06)
                                    {
                                        "AAPL,slot-name", 
                                        Buffer (0x09)
                                        {
                                            "Built In"
                                        }, 

                                        "built-in", 
                                        Buffer (One)
                                        {
                                             0x00                                             // .
                                        }, 

                                        "PCIHotplugCapable", 
                                        One
                                    })
                                }

                                Device (NHI0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }

                                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                    Field (A1E0, ByteAcc, NoLock, Preserve)
                                    {
                                        AVND,   32, 
                                        BMIE,   3, 
                                        Offset (0x18), 
                                        PRIB,   8, 
                                        SECB,   8, 
                                        SUBB,   8, 
                                        Offset (0x1E), 
                                            ,   13, 
                                        MABT,   1
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        If ((Arg2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                        }

                                        Local0 = Package (0x13)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x07)
                                                {
                                                    "Slot-4"
                                                }, 

                                                "built-in", 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }, 

                                                "device_type", 
                                                Buffer (0x19)
                                                {
                                                    "Thunderbolt 3 Controller"
                                                }, 

                                                "model", 
                                                Buffer (0x22)
                                                {
                                                    "GC-Alpine Ridge Thunderbolt 3 NHI"
                                                }, 

                                                "name", 
                                                Buffer (0x27)
                                                {
                                                    "GC-Alpine Ridge Thunderbolt Controller"
                                                }, 

                                                "ThunderboltDROM", 
                                                Buffer (0x81)
                                                {
                                                    /* 0000 */  0xE1, 0x00, 0x9F, 0xED, 0x3D, 0x49, 0xD4, 0x8E,  // ....=I..
                                                    /* 0008 */  0x36, 0x64, 0x5D, 0xFF, 0x06, 0x01, 0x74, 0x00,  // 6d]...t.
                                                    /* 0010 */  0x09, 0x01, 0x06, 0x17, 0x01, 0x2B, 0x08, 0x81,  // .....+..
                                                    /* 0018 */  0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82,  // ........
                                                    /* 0020 */  0x90, 0x01, 0x80, 0x00, 0x00, 0x00, 0x08, 0x83,  // ........
                                                    /* 0028 */  0x80, 0x04, 0x80, 0x01, 0x00, 0x00, 0x08, 0x84,  // ........
                                                    /* 0030 */  0x90, 0x03, 0x80, 0x01, 0x00, 0x00, 0x02, 0x85,  // ........
                                                    /* 0038 */  0x0B, 0x86, 0x20, 0x01, 0x00, 0x64, 0x00, 0x00,  // .. ..d..
                                                    /* 0040 */  0x00, 0x00, 0x00, 0x02, 0x87, 0x05, 0x88, 0x50,  // .......P
                                                    /* 0048 */  0x40, 0x00, 0x05, 0x89, 0x50, 0x00, 0x00, 0x05,  // @...P...
                                                    /* 0050 */  0x8A, 0x50, 0x00, 0x00, 0x05, 0x8B, 0x50, 0x40,  // .P....P@
                                                    /* 0058 */  0x00, 0x09, 0x01, 0x4C, 0x65, 0x6E, 0x6F, 0x76,  // ...Lenov
                                                    /* 0060 */  0x6F, 0x00, 0x1F, 0x02, 0x54, 0x68, 0x69, 0x6E,  // o...Thin
                                                    /* 0068 */  0x6B, 0x50, 0x61, 0x64, 0x20, 0x58, 0x31, 0x20,  // kPad X1 
                                                    /* 0070 */  0x43, 0x61, 0x72, 0x62, 0x6F, 0x6E, 0x20, 0x28,  // Carbon (
                                                    /* 0078 */  0x36, 0x74, 0x68, 0x20, 0x47, 0x65, 0x6E, 0x29,  // 6th Gen)
                                                    /* 0080 */  0x00                                             // .
                                                }, 

                                                "ThunderboltConfig", 
                                                Buffer (0x20)
                                                {
                                                    /* 0000 */  0x00, 0x02, 0x1C, 0x00, 0x02, 0x00, 0x05, 0x03,  // ........
                                                    /* 0008 */  0x01, 0x00, 0x04, 0x00, 0x05, 0x03, 0x02, 0x00,  // ........
                                                    /* 0010 */  0x03, 0x00, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00,  // ........
                                                    /* 0018 */  0x03, 0x03, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00   // ........
                                                }, 

                                                "linkDetails", 
                                                Buffer (0x08)
                                                {
                                                     0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
                                                }, 

                                                "power-save", 
                                                One, 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Return (Zero)
                                }
                            }

                            Device (DSB1)
                            {
                                Name (_ADR, 0x00010000)  // _ADR: Address
                                Name (_SUN, 0x04)  // _SUN: Slot User Number
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                {
                                    Return (Package (0x02)
                                    {
                                        0x69, 
                                        0x03
                                    })
                                }

                                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                                {
                                    If (!Arg2)
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x04)
                                    {
                                        "AAPL,slot-name", 
                                        Buffer (0x07)
                                        {
                                            "Slot-4"
                                        }, 

                                        "built-in", 
                                        Buffer (One)
                                        {
                                             0x00                                             // .
                                        }
                                    })
                                }

                                Device (UPS0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                    Field (ARE0, ByteAcc, NoLock, Preserve)
                                    {
                                        AVND,   16
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }

                                    Device (DSB0)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1, 
                                            Offset (0x3E), 
                                                ,   6, 
                                            SBRS,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB0.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }

                                        Device (DEV0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            Method (_STA, 0, NotSerialized)  // _STA: Status
                                            {
                                                Return (0x0F)
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (Zero)
                                            }
                                        }
                                    }

                                    Device (DSB3)
                                    {
                                        Name (_ADR, 0x00030000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB3.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }

                                        Device (UPS0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                            Field (ARE0, ByteAcc, NoLock, Preserve)
                                            {
                                                AVND,   16
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (Zero)
                                            }

                                            Device (DSB0)
                                            {
                                                Name (_ADR, Zero)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1, 
                                                    Offset (0x3E), 
                                                        ,   6, 
                                                    SBRS,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB3.UPS0.DSB0.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }
                                                }
                                            }

                                            Device (DSB3)
                                            {
                                                Name (_ADR, 0x00030000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB3.UPS0.DSB3.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (Zero)
                                                    }
                                                }
                                            }

                                            Device (DSB4)
                                            {
                                                Name (_ADR, 0x00040000)  // _ADR: Address
                                                Name (_SUN, 0x04)  // _SUN: Slot User Number
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB3.UPS0.DSB4.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (Zero)
                                                    }
                                                }
                                            }

                                            Device (DSB5)
                                            {
                                                Name (_ADR, 0x00050000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB3.UPS0.DSB5.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }
                                            }

                                            Device (DSB6)
                                            {
                                                Name (_ADR, 0x00060000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB3.UPS0.DSB6.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }
                                            }
                                        }
                                    }

                                    Device (DSB4)
                                    {
                                        Name (_ADR, 0x00040000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB4.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }

                                        Device (UPS0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                            Field (ARE0, ByteAcc, NoLock, Preserve)
                                            {
                                                AVND,   16
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (Zero)
                                            }

                                            Device (DSB0)
                                            {
                                                Name (_ADR, Zero)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1, 
                                                    Offset (0x3E), 
                                                        ,   6, 
                                                    SBRS,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB4.UPS0.DSB0.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (Zero)
                                                    }
                                                }
                                            }

                                            Device (DSB3)
                                            {
                                                Name (_ADR, 0x00030000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB4.UPS0.DSB3.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (Zero)
                                                    }
                                                }
                                            }

                                            Device (DSB4)
                                            {
                                                Name (_ADR, 0x00040000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB4.UPS0.DSB4.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (Zero)
                                                    }
                                                }
                                            }

                                            Device (DSB5)
                                            {
                                                Name (_ADR, 0x00050000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB4.UPS0.DSB5.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }
                                            }

                                            Device (DSB6)
                                            {
                                                Name (_ADR, 0x00060000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB4.UPS0.DSB6.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (Zero)
                                                }
                                            }
                                        }
                                    }

                                    Device (DSB5)
                                    {
                                        Name (_ADR, 0x00050000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB5.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }
                                    }

                                    Device (DSB6)
                                    {
                                        Name (_ADR, 0x00060000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB1.UPS0.DSB6.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }
                                    }
                                }
                            }

                            Device (DSB2)
                            {
                                Name (_ADR, 0x00020000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP01.UPSB.DSB2.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                                {
                                    If (!Arg2)
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x04)
                                    {
                                        "PCIHotplugCapable", 
                                        One, 
                                        "IOPCIHPType", 
                                        0x02
                                    })
                                }

                                Device (XHC2)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        If ((Arg2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                        }

                                        Local0 = Package (0x14)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x07)
                                                {
                                                    "Slot-4"
                                                }, 

                                                "built-in", 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }, 

                                                "model", 
                                                Buffer (0x16)
                                                {
                                                    "GC-Alpine Ridge USB-C"
                                                }, 

                                                "name", 
                                                Buffer (0x21)
                                                {
                                                    "GC-Alpine Ridge USB-C Controller"
                                                }, 

                                                "device_type", 
                                                Buffer (0x13)
                                                {
                                                    "USB 3.1 Controller"
                                                }, 

                                                "USBBusNumber", 
                                                Zero, 
                                                "UsbCompanionControllerPresent", 
                                                One, 
                                                "AAPL,XHCI-clock-id", 
                                                One, 
                                                "IOPCIExpressCapabilites", 
                                                0x02, 
                                                "IOPCIHPType", 
                                                0x02
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (Package (0x02)
                                        {
                                            0x69, 
                                            0x03
                                        })
                                    }

                                    Device (RHUB)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }

                                        Device (SSP1)
                                        {
                                            Name (_ADR, One)  // _ADR: Address
                                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                            {
                                                0xFF, 
                                                0x09, 
                                                Zero, 
                                                Zero
                                            })
                                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                            {
                                                ToPLD (
                                                    PLD_Revision           = 0x1,
                                                    PLD_IgnoreColor        = 0x1,
                                                    PLD_Red                = 0x0,
                                                    PLD_Green              = 0x0,
                                                    PLD_Blue               = 0x0,
                                                    PLD_Width              = 0x0,
                                                    PLD_Height             = 0x0,
                                                    PLD_UserVisible        = 0x1,
                                                    PLD_Dock               = 0x0,
                                                    PLD_Lid                = 0x0,
                                                    PLD_Panel              = "UNKNOWN",
                                                    PLD_VerticalPosition   = "UPPER",
                                                    PLD_HorizontalPosition = "LEFT",
                                                    PLD_Shape              = "UNKNOWN",
                                                    PLD_GroupOrientation   = 0x0,
                                                    PLD_GroupToken         = 0x0,
                                                    PLD_GroupPosition      = 0x0,
                                                    PLD_Bay                = 0x0,
                                                    PLD_Ejectable          = 0x0,
                                                    PLD_EjectRequired      = 0x0,
                                                    PLD_CabinetNumber      = 0x0,
                                                    PLD_CardCageNumber     = 0x0,
                                                    PLD_Reference          = 0x0,
                                                    PLD_Rotation           = 0x0,
                                                    PLD_Order              = 0x0,
                                                    PLD_VerticalOffset     = 0x0,
                                                    PLD_HorizontalOffset   = 0x0)

                                            })
                                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                            {
                                                If ((Arg2 == Zero))
                                                {
                                                    Return (Buffer (One)
                                                    {
                                                         0x03                                             // .
                                                    })
                                                }

                                                Return (Package (0x02)
                                                {
                                                    "UsbCPortNumber", 
                                                    One
                                                })
                                            }
                                        }

                                        Device (HS01)
                                        {
                                            Name (_ADR, 0x03)  // _ADR: Address
                                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                            {
                                                0xFF, 
                                                0x09, 
                                                Zero, 
                                                Zero
                                            })
                                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                            {
                                                ToPLD (
                                                    PLD_Revision           = 0x1,
                                                    PLD_IgnoreColor        = 0x1,
                                                    PLD_Red                = 0x0,
                                                    PLD_Green              = 0x0,
                                                    PLD_Blue               = 0x0,
                                                    PLD_Width              = 0x0,
                                                    PLD_Height             = 0x0,
                                                    PLD_UserVisible        = 0x1,
                                                    PLD_Dock               = 0x0,
                                                    PLD_Lid                = 0x0,
                                                    PLD_Panel              = "UNKNOWN",
                                                    PLD_VerticalPosition   = "UPPER",
                                                    PLD_HorizontalPosition = "LEFT",
                                                    PLD_Shape              = "UNKNOWN",
                                                    PLD_GroupOrientation   = 0x0,
                                                    PLD_GroupToken         = 0x0,
                                                    PLD_GroupPosition      = 0x0,
                                                    PLD_Bay                = 0x0,
                                                    PLD_Ejectable          = 0x0,
                                                    PLD_EjectRequired      = 0x0,
                                                    PLD_CabinetNumber      = 0x0,
                                                    PLD_CardCageNumber     = 0x0,
                                                    PLD_Reference          = 0x0,
                                                    PLD_Rotation           = 0x0,
                                                    PLD_Order              = 0x0,
                                                    PLD_VerticalOffset     = 0x0,
                                                    PLD_HorizontalOffset   = 0x0)

                                            })
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Device (SRAM)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (PWRB)
            {
                Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }

        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                            {
                                 0x03                                             // .
                            }
                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
                {
                     0x00                                             // .
                }
            Return (Zero)
        }

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        Zero
                    })
                }

                If ((0x0D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }
            }

            Return (XPRW (Arg0, Arg1))
        }
    }
}


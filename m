Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7076586C3D
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbfHHVXK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:23:10 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40201 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390426AbfHHVXK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:23:10 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mq1GE-1iiewc2ZDG-00nD7X; Thu, 08 Aug 2019 23:22:40 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 00/22] ARM: omap1 multiplatform support
Date:   Thu,  8 Aug 2019 23:22:09 +0200
Message-Id: <20190808212234.2213262-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tsr3bq14L4KUphFZhxoOyOwOy/flM1/eAs+FWZAe8+ZgunONeXQ
 hLZN0/PsS+ulefGbWqeGGpUcl90UjyH9Wa4NST/AaTH7Itt0ETzH0wepEIyb/a+ARhM6Uqj
 29Ivj8IbusfeGuxC/I/28VQo0aKgJrsYSyvxqKbJfHPZPh8kM2xTepj+TNyIsHko6unmcCj
 6wKO4rTlh2/sC7T9prMWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i/7+MTcAq/o=:cruOzIWsaodeEs7AR1HM4K
 NUzSfTcmUqvEkzVTeBG34QGCQNtL07DMuQDOM4RV9rGq/hOJDdkqwjHd1/f96MMya6MBCuS4e
 9wmss3bse6nddqHnfp2Xgle0bgwknQZ0wvWKVOYtTEENHCFEvllcJvUEllst3bQgDTIvRo4J+
 sCLt5FmkFy2Etwge/pEmhkuPdZvPnldm75ieJ9NNydwCpzdk6JK3OxwxxTu3IzURMj5FCHClH
 FMAoewtDpUlggD24ubie/7K/ypSXJRjIQng3sYJEV339VM32TKFQ7S8de2aTbgKamN5ZMUQqr
 J3mV5xuZ4BTF28WliwMW9YjPe/j2gRuc9JSZNMErCppwv3lFW+3Wpx/F+nTRTOhJBz+fw4nxZ
 i/8yZbYqajGhoUAInRgYV/M59a7aOd/jLv2Bsnk6nkXh6rMpnkwakE1GC3Ayau0nlU00KH0o0
 s17gzKesTP6vyzsugB7MIYjKROtgC/nT6GxRft893y14CHH0w7EheS/rfzhhbsSYuvOCyb0hE
 Tnl+k2ELqU0fD873HbWbfhck8qMxhsMZEOrKhKJcezoqCDr/AxBt9NXpLZhF+4r1hVNqF8QFW
 O+NHUIY/f2Q75h61SWaocDw4fJ414tP+TZeTFMn7xFjqlheh77Q5ONbyhjbhdOB7sTuCl4uys
 x0OQ32tVu+i/L5Jin36pDGdcOEs0JHVlXMK60JDK9AABCmZl29WWOo9NtlT83f7j/DE5qVjoz
 G4+bnIzKRrM/2Tvf3dUvwhi63H6/iNC9jRLJvQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I spent some time cleaning up omap1, which is one of the last
remaining ARM9 platforms that is not yet part of
CONFIG_ARCH_MULTIPLATFORM.

There are two main parts here:

1. Avoiding mach/*.h header file dependencies, in particular
   mach/memory.h and mach/io.h. I managed to split out a
   small set of headers that are moved to include/linux/soc/ti,
   to avoid completely rewriting the platform interfaces,
   while getting all drivers to be actually self-contained
   aside from these headers.

2. Rewriting the clock driver to use common-clk
   I've never written a clock driver before, and I tried to
   stick to the original code without changing too much here,
   so the result is not overly pretty, and likely contains
   bugs, but I think I'm on the track here. I did not test
   any of this on real hardware, so I need some help in
   testing and fixing this.

I would hope to merge the entire series through the arm-soc
tree for the next merge window, along with other some of the
other platforms I worked on.

     Arnd

Arnd Bergmann (22):
  ARM: omap1: innovator: pass lcd control address as pdata
  ARM: omap1: make omapfb standalone compilable
  ARM: omap1: move omap15xx local bus handling to usb.c
  ARM: omap1: move ohci phy power handling to board files
  ARM: omap1: move mach/usb.h to include/linux/soc
  ARM: omap1: move some headers to include/linux/soc
  ARM: omap1: move perseus spi pinconf to board file
  ARM: omap1: move CF chipselect setup to board file
  fbdev: omap: avoid using mach/*.h files
  usb: omap: avoid mach/*.h headers
  clocksource: ti-dmtimer: avoid using mach/hardware.h
  serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
  input: omap: void using mach/*.h headers
  ARM: omap1: use pci_ioremap_io() for omap_cf
  ARM: omap1: move mach/*.h into mach directory
  ARM: omap1: move clk support into a single file
  ARM: omap1: remove some dead clock code
  ARM: omap1: clk: rework 'struct clk'
  ARM: omap1: clk: use common_clk-like callbacks
  ARM: omap1: clk: use clk_init_data
  ARM: omap1: use common clk framework
  ARM: omap1: enable multiplatform

 arch/arm/Kconfig                              |   18 -
 arch/arm/configs/omap1_defconfig              |    3 +
 arch/arm/mach-omap1/Kconfig                   |   20 +-
 arch/arm/mach-omap1/Makefile                  |   10 +-
 arch/arm/mach-omap1/ams-delta-fiq-handler.S   |    3 +-
 arch/arm/mach-omap1/ams-delta-fiq.c           |    2 +
 arch/arm/mach-omap1/ams-delta-fiq.h           |    2 +-
 arch/arm/mach-omap1/board-ams-delta.c         |    7 +-
 arch/arm/mach-omap1/board-fsample.c           |   10 +-
 arch/arm/mach-omap1/board-generic.c           |    8 +-
 arch/arm/mach-omap1/board-h2.c                |   12 +-
 arch/arm/mach-omap1/board-h3.c                |   14 +-
 arch/arm/mach-omap1/board-htcherald.c         |   10 +-
 arch/arm/mach-omap1/board-innovator.c         |   34 +-
 arch/arm/mach-omap1/board-nokia770.c          |    9 +-
 arch/arm/mach-omap1/board-osk.c               |   68 +-
 arch/arm/mach-omap1/board-palmte.c            |   14 +-
 arch/arm/mach-omap1/board-palmtt.c            |   14 +-
 arch/arm/mach-omap1/board-palmz71.c           |   14 +-
 arch/arm/mach-omap1/board-perseus2.c          |   13 +-
 arch/arm/mach-omap1/board-sx1-mmc.c           |    3 +-
 arch/arm/mach-omap1/board-sx1.c               |   12 +-
 arch/arm/mach-omap1/clock.c                   | 1515 ++++++++++++-----
 arch/arm/mach-omap1/clock.h                   |  288 ----
 arch/arm/mach-omap1/clock_data.c              |  921 ----------
 arch/arm/mach-omap1/common.h                  |    5 +-
 arch/arm/mach-omap1/devices.c                 |    9 +-
 arch/arm/mach-omap1/fb.c                      |   19 +-
 arch/arm/mach-omap1/flash.c                   |    3 +-
 arch/arm/mach-omap1/fpga.c                    |    3 +-
 arch/arm/mach-omap1/gpio15xx.c                |    3 +-
 arch/arm/mach-omap1/gpio16xx.c                |    5 +-
 arch/arm/mach-omap1/gpio7xx.c                 |    3 +-
 .../mach-omap1/{include/mach => }/hardware.h  |  132 +-
 arch/arm/mach-omap1/i2c.c                     |    3 +-
 arch/arm/mach-omap1/id.c                      |    5 +-
 arch/arm/mach-omap1/include/mach/io.h         |   45 -
 arch/arm/mach-omap1/include/mach/lcdc.h       |   44 -
 arch/arm/mach-omap1/include/mach/memory.h     |   55 -
 arch/arm/mach-omap1/include/mach/uncompress.h |  117 --
 arch/arm/mach-omap1/io.c                      |    6 +-
 arch/arm/mach-omap1/irq.c                     |    4 +-
 arch/arm/mach-omap1/{include/mach => }/irqs.h |    2 -
 arch/arm/mach-omap1/mcbsp.c                   |    9 +-
 .../mach-omap1/{include/mach => }/mtd-xip.h   |    3 +-
 arch/arm/mach-omap1/mux.c                     |    6 +-
 arch/arm/mach-omap1/mux.h                     |  144 ++
 arch/arm/mach-omap1/ocpi.c                    |    4 +-
 .../mach-omap1/{include/mach => }/omap1510.h  |    1 -
 .../mach-omap1/{include/mach => }/omap16xx.h  |    0
 .../mach-omap1/{include/mach => }/omap7xx.h   |    0
 arch/arm/mach-omap1/opp.h                     |   26 -
 arch/arm/mach-omap1/opp_data.c                |   51 -
 arch/arm/mach-omap1/pm.c                      |    8 +-
 arch/arm/mach-omap1/pm.h                      |    2 +
 arch/arm/mach-omap1/reset.c                   |    3 +-
 arch/arm/mach-omap1/serial.c                  |    4 +-
 .../mach-omap1/{include/mach => }/serial.h    |    0
 arch/arm/mach-omap1/sleep.S                   |    2 +-
 arch/arm/mach-omap1/soc.h                     |    6 +-
 arch/arm/mach-omap1/sram.S                    |    4 +-
 arch/arm/mach-omap1/time.c                    |    2 +-
 arch/arm/mach-omap1/timer.c                   |    1 +
 arch/arm/mach-omap1/timer32k.c                |    3 +-
 arch/arm/mach-omap1/usb.c                     |   87 +-
 arch/arm/mach-omap1/usb.h                     |   25 +
 arch/arm/plat-omap/Makefile                   |    1 +
 arch/arm/plat-omap/dma.c                      |    4 +-
 arch/arm/plat-omap/include/plat/cpu.h         |   21 -
 drivers/clocksource/timer-ti-dm.c             |    2 +-
 drivers/input/keyboard/Kconfig                |    2 +-
 drivers/input/keyboard/omap-keypad.c          |    1 +
 drivers/pcmcia/Kconfig                        |    3 +-
 drivers/pcmcia/omap_cf.c                      |   47 +-
 drivers/spi/Kconfig                           |    2 +-
 drivers/spi/spi-omap-uwire.c                  |   15 +-
 drivers/tty/serial/8250/8250.h                |    1 +
 drivers/usb/gadget/udc/Kconfig                |    2 +-
 drivers/usb/gadget/udc/omap_udc.c             |    5 +-
 drivers/usb/host/Kconfig                      |    2 +-
 drivers/usb/host/ohci-omap.c                  |  111 +-
 drivers/usb/phy/Kconfig                       |    3 +-
 drivers/usb/phy/phy-isp1301-omap.c            |    6 +-
 drivers/video/backlight/Kconfig               |    4 +-
 drivers/video/backlight/omap1_bl.c            |    4 +-
 drivers/video/fbdev/Makefile                  |    2 +-
 drivers/video/fbdev/omap/Kconfig              |    4 +-
 drivers/video/fbdev/omap/Makefile             |    5 +
 drivers/video/fbdev/omap/lcd_ams_delta.c      |    2 +-
 .../video/fbdev/omap}/lcd_dma.c               |    7 +-
 .../video/fbdev/omap}/lcd_dma.h               |    2 -
 drivers/video/fbdev/omap/lcd_inn1510.c        |    9 +-
 drivers/video/fbdev/omap/lcd_osk.c            |    4 +-
 drivers/video/fbdev/omap/lcdc.c               |   10 +-
 drivers/video/fbdev/omap/lcdc.h               |   35 +
 drivers/video/fbdev/omap/omapfb.h             |    2 +
 drivers/video/fbdev/omap/omapfb_main.c        |   19 +-
 drivers/video/fbdev/omap/sossi.c              |    4 +-
 include/linux/omap-dma.h                      |    7 +-
 include/linux/platform_data/keypad-omap.h     |    5 -
 include/linux/platform_data/usb-omap1.h       |    4 +
 include/linux/soc/ti/omap1-io.h               |  143 ++
 .../mux.h => include/linux/soc/ti/omap1-mux.h |  142 +-
 .../soc.h => include/linux/soc/ti/omap1-soc.h |   22 -
 .../usb.h => include/linux/soc/ti/omap1-usb.h |   28 +-
 105 files changed, 1856 insertions(+), 2714 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/clock.h
 delete mode 100644 arch/arm/mach-omap1/clock_data.c
 rename arch/arm/mach-omap1/{include/mach => }/hardware.h (59%)
 delete mode 100644 arch/arm/mach-omap1/include/mach/io.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/lcdc.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/memory.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/uncompress.h
 rename arch/arm/mach-omap1/{include/mach => }/irqs.h (99%)
 rename arch/arm/mach-omap1/{include/mach => }/mtd-xip.h (97%)
 create mode 100644 arch/arm/mach-omap1/mux.h
 rename arch/arm/mach-omap1/{include/mach => }/omap1510.h (99%)
 rename arch/arm/mach-omap1/{include/mach => }/omap16xx.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap7xx.h (100%)
 delete mode 100644 arch/arm/mach-omap1/opp.h
 delete mode 100644 arch/arm/mach-omap1/opp_data.c
 rename arch/arm/mach-omap1/{include/mach => }/serial.h (100%)
 create mode 100644 arch/arm/mach-omap1/usb.h
 delete mode 100644 arch/arm/plat-omap/include/plat/cpu.h
 rename {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c (98%)
 rename {arch/arm/mach-omap1/include/mach => drivers/video/fbdev/omap}/lcd_dma.h (98%)
 create mode 100644 include/linux/soc/ti/omap1-io.h
 rename arch/arm/mach-omap1/include/mach/mux.h => include/linux/soc/ti/omap1-mux.h (53%)
 rename arch/arm/mach-omap1/include/mach/soc.h => include/linux/soc/ti/omap1-soc.h (90%)
 rename arch/arm/mach-omap1/include/mach/usb.h => include/linux/soc/ti/omap1-usb.h (86%)

-- 
2.20.0


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D887516F061
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 21:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgBYUrB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 15:47:01 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39070 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbgBYUrA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 15:47:00 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PKku1t045195;
        Tue, 25 Feb 2020 14:46:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582663616;
        bh=lNwU/RHe20uc+Ql3HoJ9YcG2yowB2BOx4vCd6rGr60w=;
        h=From:To:CC:Subject:Date;
        b=UpGn66A59zgXpr4bjI5bViF8+DrVDaf12Y6K04o6xq6xH4vVxmHUYTBCAbY2fAML+
         tR39s/pstbp+XZk9h8CP3R1tRATkQ4Q5W9q1vw0WiER6ECeifBZTwyoGpIdmgHWvIR
         HlbHL7UnmdL+tIX99S/dfEKs1DOkOOfb+/FjVqjY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PKku7d022011
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 14:46:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 14:46:55 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PKktIp059180;
        Tue, 25 Feb 2020 14:46:55 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01PKktVd025457;
        Tue, 25 Feb 2020 14:46:55 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 00/12] ti-sysc support for PRUSS
Date:   Tue, 25 Feb 2020 14:46:37 -0600
Message-ID: <20200225204649.28220-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following series adds the ti-sysc support for the PRUSS IP present
on some AM33xx, AM437x and AM57xx SoCs. This series is a revamped and
more complete version of the previous attempt [1] made last year and
includes support for AM33xx and AM437x now that the reset dependencies
are fully upstream. The OCP master ports are not enabled by default
now, and the ti-sysc bus driver only handles the important quirk needed
for suspend/resume on AM33xx and AM437x SoCs.

The series includes patches for both the ti-sysc bindings and the bus
driver, along with all the DTS nodes. Patches are based on 5.6-rc1. The
dts nodes can be added added independently of the corresponding hwmod
cleanup [2]. This forms the foundation before the rest of the PRUSS
platform drivers can be added. Please consider the series for 5.7, and
I can post the PRUSS platform driver and/or PRUSS INTC driver for 5.8.

The integration of the IP is different on different SoC families, and
following are some differences:
 1. AM33xx and AM437x SoCs need a PRCM reset line to be deasserted as well
    to be able to access any PRUSS registers.
 2. AM437x has two PRUSS instances, with the smaller PRU-ICSS0 connected
    through the larger PRU-ICSS1. There is only a single interconnect target
    node added. AM57xx has no reset lines,
    and only requires the module to be enabled.
 3. AM57xx has two identical instances, but do not require any reset lines.
 4. PRUSS is present only on some SoCs on each SoC family:
      - AM3356 and above SoCs on AM335x family
      - AM4376 and above SoCs on AM437x family
      - AM57xx SoCs only; not supported on DRA7xx SoCs.

The sanity testing can be done by turning on the power through the sysfs for
now. These will be taken care of automatically when the PRUSS platform driver
will invoke the pm_runtime_get_sync() and put_sync() as the PRUSS nodes will
be children of the ti-sysc interconnect nodes.
 1. AM335x
      echo on > /sys/bus/platform/devices/4a326000.target-module/power/control
 2. AM437x
      echo on > /sys/bus/platform/devices/54426000.target-module/power/control
 3. AM57xx
      echo on > /sys/bus/platform/devices/4b226000.target-module/power/control
      echo on > /sys/bus/platform/devices/4b2a6000.target-module/power/control

Here are the version numbers from the CFG sub-module on these IPs that are
used for the ti-sysc quirks:
 AM335x			: 0x47000000 
 AM437x PRUSS1		: 0x47000200
 AM437x PRUSS0  	: 0x47010100
 AM57xx PRUSS0 & PRUSS1	: 0x47000201

regards
Suman

[1] https://patchwork.kernel.org/cover/10796015/
[2] https://patchwork.kernel.org/cover/11402083/

Roger Quadros (1):
  dt-bindings: bus: ti-sysc: Add support for PRUSS SYSC type

Suman Anna (11):
  bus: ti-sysc: Add support for PRUSS SYSC type
  ARM: dts: AM33xx-l4: Update PRUSS interconnect target-module node
  ARM: dts: AM4372: Add the PRU-ICSS interconnect target-module node
  ARM: dts: dra7: Add PRU-ICSS interconnect target-module nodes
  ARM: dts: am335x-bone-common: Enable PRU-ICSS interconnect node
  ARM: dts: am335x-evm: Enable PRU-ICSS interconnect node
  ARM: dts: am335x-evmsk: Enable PRU-ICSS interconnect node
  ARM: dts: am335x-icev2: Enable PRU-ICSS interconnect node
  ARM: dts: am437x-gp-evm: Enable PRU-ICSS interconnect node
  ARM: dts: am437x-sk: Enable PRU-ICSS interconnect node
  ARM: dts: am437x-idk: Enable PRU-ICSS interconnect node

 .../devicetree/bindings/bus/ti-sysc.txt       |  1 +
 arch/arm/boot/dts/am335x-bone-common.dtsi     |  4 ++
 arch/arm/boot/dts/am335x-evm.dts              |  4 ++
 arch/arm/boot/dts/am335x-evmsk.dts            |  4 ++
 arch/arm/boot/dts/am335x-icev2.dts            |  4 ++
 arch/arm/boot/dts/am33xx-l4.dtsi              | 21 ++++++--
 arch/arm/boot/dts/am4372.dtsi                 | 23 +++++++++
 arch/arm/boot/dts/am437x-gp-evm.dts           |  4 ++
 arch/arm/boot/dts/am437x-idk-evm.dts          |  4 ++
 arch/arm/boot/dts/am437x-sk-evm.dts           |  4 ++
 arch/arm/boot/dts/am57-pruss.dtsi             | 50 +++++++++++++++++++
 arch/arm/boot/dts/am5718.dtsi                 |  1 +
 arch/arm/boot/dts/am5728.dtsi                 |  1 +
 arch/arm/boot/dts/am5748.dtsi                 |  1 +
 arch/arm/boot/dts/dra7.dtsi                   |  2 +-
 drivers/bus/ti-sysc.c                         | 27 ++++++++++
 include/dt-bindings/bus/ti-sysc.h             |  4 ++
 include/linux/platform_data/ti-sysc.h         |  2 +
 18 files changed, 157 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/am57-pruss.dtsi

-- 
2.23.0


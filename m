Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55226F920A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfKLOZA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:25:00 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38630 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbfKLOY7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:24:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEOrBt098073;
        Tue, 12 Nov 2019 08:24:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568693;
        bh=Z/GDAOp5hkp+SYDfUmkON22BaPQPy5r+LjA+Gy96kHM=;
        h=From:To:CC:Subject:Date;
        b=M69IsmgHTFR6OJYf6whr65S1Yd9+vFcfX/t4OPZtPj91NXnK6ZuPzvaz1XXL+92oz
         V4AqxYWH3/8JcD1j90L13AaICbnzFAhzVVtDwW3g49OEq5kXeDKL6OuxGddP5ZvNfV
         HCWHqTHoUPKi7IS/cn5FoNbyY9K1YAQxyjSi/hE0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEOrJn115938
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:24:53 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:24:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:24:35 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEOrBf036029;
        Tue, 12 Nov 2019 08:24:53 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 00/10] ARM: dts: dra7: add cal nodes 
Date:   Tue, 12 Nov 2019 08:27:43 -0600
Message-ID: <20191112142753.22976-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch series adds the needed clkctrl and ty-sysc nodes for CAL module.
It also adds support for the module in related dtsi and dts for DRA72,
DRA76 and AM654 SoC.

Changes since v2:
- Add non-standard clock node naming to commit message as per Tony's
  comment

Changes since v1:
- Fix clock name to make it generic
- Updated the binding to use ti,camerrx-control instead of sycon_camerrx
- Split off the clk code into its own patch
- Add clk mailing list as requested

Benoit Parrot (10):
  clk: ti: dra7: add cam clkctrl data
  ARM: dts: dra7: add cam clkctrl node
  ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP only
  ARM: dts: dra7-l4: Add ti-sysc node for CAM
  ARM: dts: DRA72: Add CAL dtsi node
  arm: dts: dra72-evm-common: Add entries for the CSI2 cameras
  arm: dtsi: dra76x: Add CAL dtsi node
  arm: dts: dra76-evm: Add CAL and OV5640 nodes
  arm64: dts: k3-am65-main Add CAL node
  arm64: dts: k3-am654-base-board: Add CSI2 OV5640 camera

 arch/arm/boot/dts/dra7-l4.dtsi                | 43 ++++++++++++++++---
 arch/arm/boot/dts/dra72-evm-common.dtsi       | 35 +++++++++++++++
 arch/arm/boot/dts/dra72x.dtsi                 | 43 +++++++++++++++++++
 arch/arm/boot/dts/dra76-evm.dts               | 39 +++++++++++++++++
 arch/arm/boot/dts/dra76x.dtsi                 | 43 +++++++++++++++++++
 arch/arm/boot/dts/dra7xx-clocks.dtsi          | 14 ++++++
 arch/arm/mach-omap2/clockdomains7xx_data.c    |  2 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 23 ++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 36 ++++++++++++++++
 drivers/clk/ti/clk-7xx.c                      | 19 ++++++++
 include/dt-bindings/clock/dra7.h              | 10 +++++
 11 files changed, 300 insertions(+), 7 deletions(-)

-- 
2.17.1


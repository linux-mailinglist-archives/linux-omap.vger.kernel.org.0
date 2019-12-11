Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8976A11ACD0
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbfLKODP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:03:15 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59020 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbfLKODP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:03:15 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2b0g050797;
        Wed, 11 Dec 2019 08:02:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576072957;
        bh=bcyBGbO4wvsS0lpmPcVyZHoazDhW9nqnboevNW7KZ4U=;
        h=From:To:CC:Subject:Date;
        b=OZk2zuOhYH7MewgYe76IdtFV/pl2zbG0nV24r4iHujE8TiB5WfOSz7334+46XCA6r
         aNKsVCPjggUD9SrQHtz0gGVTg1Iz94DoFa+je6VrRe+zdp0dSGz2zKucLH8MNTk5RK
         2atL4CDU5V5/q6M7nrRexzhRLfvzyeIoycSwLVe4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2aKJ098221;
        Wed, 11 Dec 2019 08:02:36 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:02:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:02:36 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2afk007398;
        Wed, 11 Dec 2019 08:02:36 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 00/10] ARM: dts: dra7: add cal nodes 
Date:   Wed, 11 Dec 2019 08:05:48 -0600
Message-ID: <20191211140558.10407-1-bparrot@ti.com>
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

Changes since v3:
- Added Tony's ack
- Added Rob's ack
- In all 3 .dts patch removed unneeded cal 'status = "ok"' lines 

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
 arch/arm/boot/dts/dra72-evm-common.dtsi       | 31 +++++++++++++
 arch/arm/boot/dts/dra72x.dtsi                 | 42 ++++++++++++++++++
 arch/arm/boot/dts/dra76-evm.dts               | 35 +++++++++++++++
 arch/arm/boot/dts/dra76x.dtsi                 | 42 ++++++++++++++++++
 arch/arm/boot/dts/dra7xx-clocks.dtsi          | 14 ++++++
 arch/arm/mach-omap2/clockdomains7xx_data.c    |  2 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 22 ++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 32 ++++++++++++++
 drivers/clk/ti/clk-7xx.c                      | 19 ++++++++
 include/dt-bindings/clock/dra7.h              | 10 +++++
 11 files changed, 285 insertions(+), 7 deletions(-)

-- 
2.17.1


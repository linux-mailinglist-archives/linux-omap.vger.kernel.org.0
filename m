Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6EBEEA2E
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbfKDUtG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:49:06 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51872 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDUtF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:49:05 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kn0xN129162;
        Mon, 4 Nov 2019 14:49:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572900540;
        bh=D5sprlBTgKbNeSF2xEAhxvBsav9tu+MkOC3iG0A4Lcc=;
        h=From:To:CC:Subject:Date;
        b=LAb1sKkNtoOjqK122Rzt0K6m8rCnli0Xdhgqnpk/gJ2GXdMfg6o4u0OOLgbEChTVK
         cLtcXCq4MZ6wXMBVIHWvU54c6uvVWKQbT/QVoVdTvH21MuDmrr2tK058PB5o+tPzut
         9cMrYEWbgMCrSOnqtyaGRv72kRtWOUtcJfClVLM8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4Kn0nJ129793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 14:49:00 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:48:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:48:59 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kmvxu038360;
        Mon, 4 Nov 2019 14:48:58 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 00/10] ARM: dts: dra7: add cal nodes 
Date:   Mon, 4 Nov 2019 14:48:43 -0600
Message-ID: <20191104204853.4355-1-bparrot@ti.com>
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


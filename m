Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7666EDB7C9
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394391AbfJQToS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:18 -0400
Received: from muru.com ([72.249.23.125]:37858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726590AbfJQToS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 427F8804F;
        Thu, 17 Oct 2019 19:44:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 00/21] Drop more legacy platform data for omaps
Date:   Thu, 17 Oct 2019 12:43:50 -0700
Message-Id: <20191017194411.18258-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's a series of changes to remove more legacy platform data and
ti,hwmods devitree property for omap variants.

The patches are against v5.4-rc1, but please note that the watchdog
changes depend on the following patch:

[PATCH] bus: ti-sysc: Fix watchdog quirk handling

Regards,

Tony


Tony Lindgren (21):
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpio
  ARM: dts: Drop custom hwmod property for omap4 gpio
  ARM: dts: Drop custom hwmod property for omap5 gpio
  ARM: OMAP2+: Drop legacy platform data for dra7 mailbox
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 mailbox
  ARM: OMAP2+: Drop legacy platform data for omap4 mailbox
  ARM: OMAP2+: Drop legacy platform data for omap5 mailbox
  ARM: dts: Drop custom hwmod property for omap5 mcspi
  ARM: OMAP2+: Drop legacy platform data for omap5 mcspi
  ARM: dts: Drop custom hwmod property for am33xx uart
  ARM: dts: Drop custom hwmod property for am4 uart
  ARM: dts: Drop custom hwmod property for omap5 uart
  ARM: dts: Drop custom hwmod property for am3 i2c
  ARM: dts: Drop custom hwmod property for am4 i2c
  ARM: dts: Drop custom hwmod property for omap5 i2c
  ARM: dts: Drop custom hwmod property for am3 mmc
  ARM: dts: Drop custom hwmod property for am4 mmc
  ARM: dts: Drop custom hwmod property for omap5 mmc
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 wdt
  ARM: OMAP2+: Drop legacy platform data for dra7 wdt
  ARM: OMAP2+: Drop legacy platform data for omap5 wdt

 arch/arm/boot/dts/am33xx-l4.dtsi              |  17 -
 arch/arm/boot/dts/am33xx.dtsi                 |   1 -
 arch/arm/boot/dts/am4372.dtsi                 |   1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  19 -
 arch/arm/boot/dts/dra7-l4.dtsi                |  14 -
 arch/arm/boot/dts/omap4-l4.dtsi               |  11 -
 arch/arm/boot/dts/omap5-l4.dtsi               |  30 --
 .../omap_hwmod_33xx_43xx_common_data.h        |   3 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |   8 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 157 --------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  11 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |   9 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    |  41 --
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    | 204 ----------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 352 ------------------
 15 files changed, 878 deletions(-)

-- 
2.23.0

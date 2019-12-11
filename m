Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A531E11B9F4
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730771AbfLKRUV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:21 -0500
Received: from muru.com ([72.249.23.125]:45630 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730318AbfLKRUV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:21 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AE21A80FA;
        Wed, 11 Dec 2019 17:20:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Keerthy <j-keerthy@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 00/16] Drop legacy platform data for various omap devices
Date:   Wed, 11 Dec 2019 09:19:58 -0800
Message-Id: <20191211172014.35201-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

In order to get the l4 instances closer to being usable with genpd, we
continue dropping legacy platform data for various devices.

Please test, some patches may depend on the earlier patches to drop
platform data to apply as they touch the same files.

Regards,

Tony


Tony Lindgren (16):
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 epwmss
  ARM: OMAP2+: Drop legacy platform data for dra7 epwmss
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 spinlock
  ARM: OMAP2+: Drop legacy platform data for omap4 spinlock
  ARM: OMAP2+: Drop legacy platform data for omap5 spinlock
  ARM: OMAP2+: Drop legacy platform data for dra7 spinlock
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 spi
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 dcan
  ARM: OMAP2+: Drop legacy platform data for dra7 dcan
  ARM: OMAP2+: Drop legacy platform data for am3 adc_tsc
  ARM: OMAP2+: Drop legacy platform data for am4 adc_tsc
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 rtc
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 elm
  ARM: OMAP2+: Drop legacy platform data for omap4 elm
  ARM: OMAP2+: Drop legacy platform data for dra7 elm
  ARM: OMAP2+: Drop legacy platform data for am3 lcdc

 arch/arm/boot/dts/am33xx-l4.dtsi              |  12 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  19 +-
 arch/arm/boot/dts/am43x-epos-evm.dts          |   4 +
 arch/arm/boot/dts/dra7-l4.dtsi                |   5 -
 arch/arm/boot/dts/omap4-l4.dtsi               |   2 -
 arch/arm/boot/dts/omap5-l4.dtsi               |   1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  21 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  76 ------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 247 ------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  85 ------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 183 -------------
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    |  85 ------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    |  43 ---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 236 -----------------
 14 files changed, 5 insertions(+), 1014 deletions(-)

-- 
2.24.1

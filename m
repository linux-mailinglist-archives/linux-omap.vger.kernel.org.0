Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DE5119F86
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfLJXfk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:40 -0500
Received: from muru.com ([72.249.23.125]:45134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLJXf2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 63D68820B;
        Tue, 10 Dec 2019 23:36:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/9] Probe l4 abe and most timers with ti-sysc
Date:   Tue, 10 Dec 2019 15:35:15 -0800
Message-Id: <20191210233524.46875-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

This series updates l4-abe devices and non-system timers to probe with
ti-sysc.

After this series we now have l4-abe instances with all devices probing
with dts data and ti-sysc driver. So for omap4 and 5, l4-abe can now be
used to experiment with adding genpd support to drivers/soc/ti/omap_prm.c
to power down the abe domain when not in use :)

Note that we cannot yet probe system timers with ti-sysc.

Regards,

Tony


Tony Lindgren (9):
  ARM: OMAP2+: Drop legacy platform data for omap4 aess
  ARM: OMAP2+: Drop legacy platform data for omap4 dmic
  ARM: OMAP2+: Drop legacy platform data for omap4 mcpdm
  ARM: OMAP2+: Drop legacy platform data for omap5 dmic
  ARM: OMAP2+: Drop legacy platform data for omap5 mcpdm
  ARM: OMAP2+: Drop legacy platform data for omap4 timers except timer1
  ARM: OMAP2+: Drop legacy platform data for omap5 timers except timer1
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 timers except
    timer1 and 2
  ARM: OMAP2+: Drop legacy platform data for dra7 timers except timer1
    to 4

 arch/arm/boot/dts/am33xx-l4.dtsi              |   5 -
 arch/arm/boot/dts/am437x-l4.dtsi              |   9 -
 arch/arm/boot/dts/dra7-l4.dtsi                |  12 -
 arch/arm/boot/dts/omap4-l4-abe.dtsi           |   7 -
 arch/arm/boot/dts/omap4-l4.dtsi               |   6 -
 arch/arm/boot/dts/omap5-l4-abe.dtsi           |   6 -
 arch/arm/boot/dts/omap5-l4.dtsi               |   6 -
 arch/arm/mach-omap2/omap_hwmod.c              |  18 -
 arch/arm/mach-omap2/omap_hwmod.h              |   3 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  10 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  40 --
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  70 ---
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |   5 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  89 ----
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    | 421 ------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    | 357 ---------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 295 ------------
 arch/arm/mach-omap2/omap_hwmod_reset.c        |  24 -
 include/sound/aess.h                          |  53 ---
 19 files changed, 1436 deletions(-)
 delete mode 100644 include/sound/aess.h

-- 
2.24.0

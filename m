Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FF8298BDF
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1768821AbgJZLWi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:38 -0400
Received: from muru.com ([72.249.23.125]:46642 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:38 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0571880AA;
        Mon, 26 Oct 2020 11:22:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 00/18] Drop remaining pdata for am335x and use genpd
Date:   Mon, 26 Oct 2020 13:22:04 +0200
Message-Id: <20201026112222.56894-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

With the related driver changes, we can now drop the remaining platform
data for am335x for v5.11 merge window and probe using device tree data
and genpd instead.

Regards,

Tony

[1] https://lore.kernel.org/linux-omap/20201026105812.38418-1-tony@atomide.com/T/#t
[2] https://lore.kernel.org/linux-omap/20201026111049.54835-1-tony@atomide.com/T/#t

Tero Kristo (1):
  ARM: dts: am33xx: add remaining PRM instances

Tony Lindgren (17):
  ARM: dts: Configure also interconnect clocks for am3 system timers
  ARM: OMAP2+: Drop legacy platform data for am3 control module
  ARM: dts: Configure RTC powerdomain for am3
  ARM: dts: Configure interconnect target module for am3 wkup_m3
  ARM: OMAP2+: Drop legacy platform data for am3 wkup_m3
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpmc
  ARM: OMAP2+: Drop legacy platform data for am3 debugss
  ARM: OMAP2+: Drop legacy platform data for am3 emif
  ARM: OMAP2+: Drop legacy platform data for am3 ocmcram
  ARM: OMAP2+: Drop legacy platform data for am3 instr
  ARM: OMAP2+: Drop legacy platform data for am3 mpuss
  ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
  ARM: dts: Use simple-pm-bus for genpd for am3 l4_fast
  ARM: dts: Use simple-pm-bus for genpd for am3 l4_per
  ARM: dts: Use simple-pm-bus for genpd for am3 l3
  ARM: OMAP2+: Drop legacy remaining legacy platform data for am3
  ARM: OMAP2+: Build hwmod related code as needed

 arch/arm/boot/dts/am335x-nano.dts             |   1 -
 arch/arm/boot/dts/am33xx-l4.dtsi              |  75 +++--
 arch/arm/boot/dts/am33xx.dtsi                 | 185 +++++++----
 arch/arm/boot/dts/am4372.dtsi                 |  49 ++-
 arch/arm/mach-omap2/Kconfig                   |   9 +
 arch/arm/mach-omap2/Makefile                  |  14 +-
 arch/arm/mach-omap2/io.c                      |   2 -
 .../omap_hwmod_33xx_43xx_common_data.h        |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |   8 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  36 ---
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    | 294 ------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |   1 -
 arch/arm/mach-omap2/pdata-quirks.c            |  12 +-
 13 files changed, 236 insertions(+), 452 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_data.c

-- 
2.29.1

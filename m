Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B863F2B4279
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgKPLUF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:05 -0500
Received: from muru.com ([72.249.23.125]:48402 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:04 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 371D180C8;
        Mon, 16 Nov 2020 11:20:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 00/17] Update am437x to boot with simple-pm-bus and genpd
Date:   Mon, 16 Nov 2020 13:19:22 +0200
Message-Id: <20201116111939.21405-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Similar to the earlier am335x changes, here are the changes done to boot
am437x using simple-pm-bus and genpd.

These patches are based on v5.10-rc1 and the following patches:

PATCH 2/4] ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
[PATCHv2 0/9] Genpd related code changes to drop am335x pdata
[PATCH 00/18] Drop remaining pdata for am335x and use genpd

To make testing things easier, I've pushed out these changes also to a
temporary test branch at [0][1] below.

Regards,

Tony

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.11/tmp-testing-genpd
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.11/tmp-testing-genpd


Tero Kristo (2):
  soc: ti: omap-prm: am4: add genpd support for remaining PRM instances
  ARM: dts: am43xx: add remaining PRM instances

Tony Lindgren (15):
  clk: ti: am437x: Keep am4 l3 main clock always on for genpd
  ARM: dts: Configure also interconnect clocks for am4 system timer
  ARM: OMAP2+: Drop legacy platform data for am4 control module
  ARM: dts: Configure RTC powerdomain for am4
  ARM: dts: Configure interconnect target module for am4 wkup_m3
  ARM: OMAP2+: Drop legacy platform data for am4 wkup_m3
  ARM: OMAP2+: Drop legacy platform data for am4 emif
  ARM: OMAP2+: Drop legacy platform data for am4 ocmcram
  ARM: OMAP2+: Drop legacy platform data for am4 mpuss
  ARM: dts: Use simple-pm-bus for genpd for am4 l4_wkup
  ARM: dts: Use simple-pm-bus for genpd for am4 l4_fast
  ARM: dts: Use simple-pm-bus for genpd for am4 l4_per
  ARM: dts: Move am4 l3 noc to a separate node
  ARM: dts: Use simple-pm-bus for genpd for am4 l3
  ARM: OMAP2+: Drop legacy remaining legacy platform data for am4

 arch/arm/boot/dts/am4372.dtsi                 | 124 ++++++---
 arch/arm/boot/dts/am437x-l4.dtsi              |  79 ++++--
 arch/arm/mach-omap2/Kconfig                   |   1 -
 arch/arm/mach-omap2/Makefile                  |   5 +-
 arch/arm/mach-omap2/io.c                      |   1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  55 ----
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  82 ------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 254 ------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 166 ------------
 drivers/clk/ti/clk-43xx.c                     |   8 +
 drivers/soc/ti/omap_prm.c                     |  36 ++-
 11 files changed, 184 insertions(+), 627 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_43xx_data.c

-- 
2.29.2

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3FAA2C9803
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgLAHT7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:19:59 -0500
Received: from muru.com ([72.249.23.125]:49548 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgLAHT6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:19:58 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DD8598167;
        Tue,  1 Dec 2020 07:19:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] Update am335x to boot without platform data
Date:   Tue,  1 Dec 2020 09:18:47 +0200
Message-Id: <pull-1606806458-694517@atomide.com-2>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 57df7e370d2ab83a64c07acd157acfed4169f114:

  remoteproc/wkup_m3: Use reset control driver if available (2020-11-16 12:57:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am335x-signed

for you to fetch changes up to 133ad7ab7005dc951fb66d3de9e29a8259fe9744:

  ARM: OMAP2+: Build hwmod related code as needed (2020-11-16 12:58:21 +0200)

----------------------------------------------------------------
Update am335x to boot without platform data

With the driver updates done for genpd support, we can now update
am335x dts files to boot with genpd and simple-pm-bus, and drop
the related platform data.

To do that, we need to do the following changes for am335x:

- Add the remaining power domain and reset controller instances

- Configure interconnect clocks for system timers as those are
  now managed separately by the drivers/clocksource drivers

- Update control module, RTC, gpmc, debugss, emif, ocmcram,
  instr, and mpuss for device tree data and drop the legacy
  platform data

- Update the interconnect instances to boot with gendp and
  simple-pm-bus

- Drop the remaining platform data for am335x

- Add kconfig option for OMAP_HWMOD to build it only for the
  SoCs that need it

----------------------------------------------------------------
Tero Kristo (1):
      ARM: dts: am33xx: add remaining PRM instances

Tony Lindgren (17):
      ARM: dts: Configure also interconnect clocks for am4 system timer
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

 arch/arm/boot/dts/am335x-nano.dts                  |   1 -
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  75 ++++--
 arch/arm/boot/dts/am33xx.dtsi                      | 185 ++++++++-----
 arch/arm/boot/dts/am4372.dtsi                      |  49 ++--
 arch/arm/mach-omap2/Kconfig                        |   9 +
 arch/arm/mach-omap2/Makefile                       |  14 +-
 arch/arm/mach-omap2/io.c                           |   2 -
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |   8 -
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c |  36 ---
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         | 294 ---------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         |   1 -
 arch/arm/mach-omap2/pdata-quirks.c                 |  12 +-
 13 files changed, 236 insertions(+), 452 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_data.c

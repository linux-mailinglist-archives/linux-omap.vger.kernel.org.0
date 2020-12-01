Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743232C9802
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgLAHUC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:20:02 -0500
Received: from muru.com ([72.249.23.125]:49554 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgLAHUB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:20:01 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 83CAA81A8;
        Tue,  1 Dec 2020 07:19:26 +0000 (UTC)
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
Subject: [GIT PULL 3/4] Update am437x to boot without platform data
Date:   Tue,  1 Dec 2020 09:18:48 +0200
Message-Id: <pull-1606806458-694517@atomide.com-3>
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

The following changes since commit 133ad7ab7005dc951fb66d3de9e29a8259fe9744:

  ARM: OMAP2+: Build hwmod related code as needed (2020-11-16 12:58:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am437x-signed

for you to fetch changes up to df6c2ec872a62cf81dff86ef62818dea89cc9d98:

  ARM: OMAP2+: Drop legacy remaining legacy platform data for am4 (2020-11-16 13:11:17 +0200)

----------------------------------------------------------------
Update am473x to boot without platform data

Similar to am335x, we can now update am437x dts files to boot
with genpd and simple-pm-bus, and drop the related platform data.

To do that, we need to do the following changes for am437x:

- Update the clock driver to keep the l3_main clock always on for
  suspend and resume to work

- Add power domain and reset controller data to omap-prm driver

- Configure interconnect clocks for system timers as those are
  now managed separately by the drivers/clocksource drivers

- Update control module, wkup_m3, emif, ocmcram, mpuss and l3_noc
  for device tree data and drop the legacy platform data

- Update the interconnect instances to boot with gendp and
  simple-pm-bus

- Drop the remaining platform data for am437x

----------------------------------------------------------------
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

 arch/arm/boot/dts/am4372.dtsi                      | 124 ++++++----
 arch/arm/boot/dts/am437x-l4.dtsi                   |  79 +++++--
 arch/arm/mach-omap2/Kconfig                        |   1 -
 arch/arm/mach-omap2/Makefile                       |   5 +-
 arch/arm/mach-omap2/io.c                           |   1 -
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |  55 -----
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  82 -------
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 254 ---------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         | 166 --------------
 drivers/clk/ti/clk-43xx.c                          |   8 +
 drivers/soc/ti/omap_prm.c                          |  36 ++-
 11 files changed, 184 insertions(+), 627 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_43xx_data.c

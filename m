Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070DD2C9801
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgLAHT4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:19:56 -0500
Received: from muru.com ([72.249.23.125]:49526 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgLAHT4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:19:56 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 60AC780A9;
        Tue,  1 Dec 2020 07:19:21 +0000 (UTC)
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
Subject: [GIT PULL 1/4] Driver changes for omaps for genpd support
Date:   Tue,  1 Dec 2020 09:18:46 +0200
Message-Id: <pull-1606806458-694517@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e7ae08d398e094e1305dee823435b1f996d39106:

  bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw (2020-10-26 10:08:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-drivers-signed

for you to fetch changes up to 57df7e370d2ab83a64c07acd157acfed4169f114:

  remoteproc/wkup_m3: Use reset control driver if available (2020-11-16 12:57:40 +0200)

----------------------------------------------------------------
Driver changes for omaps for genpd for v5.11 merge window

This series of changes allows booting am335x with genpd and
device tree data without the legacy platform data. Also at
least am437x can be booted with gendp with power domain and
dts data. The SoC specific dts changes will be a separate
pull request.

We need the following driver changes merged before the dts
changes can be done:

- platform code needs a few improvments to probe l4_wkup first
  for clocks, and to bail out when there is no platform data

- ti-sysc driver needs a non-urgent fix for asserting rstctrl
  reset only after disabling the clocks, to probe modules with
  no known control registers, and added quirk handling for gpmc
  devices

- omap-prm driver needs a non-urgent fix for reset status bit,
  support added for pm_clk, and then we add the rest of am335x
  power domain data

- clock driver for am335x needs to keep l3_main clock enabled
  with genpd for suspend and resume to work

- wkup_m3 remoteproc driver needs support added for reset
  control if available instead of the legacy pdata callbacks

- pm33xx driver needs PM runtime support added for genpd

The am335x specific driver changes for the clock, wkup_m3,
pm33xx and remoteproc drivers are quite trivial and have not
caused merge conflicts in Linux next. I did not get acks for
these changes except from Santosh but had already pushed out
the branch already at that point. So I've added the related
driver maintainers to Cc.

----------------------------------------------------------------
Tero Kristo (1):
      soc: ti: omap-prm: am3: add genpd support for remaining PRM instances

Tony Lindgren (10):
      soc: ti: omap-prm: Do not check rstst bit on deassert if already deasserted
      bus: ti-sysc: Assert reset only after disabling clocks
      ARM: OMAP2+: Check for inited flag
      ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
      bus: ti-sysc: Support modules without control registers
      bus: ti-sysc: Implement GPMC debug quirk to drop platform data
      clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
      soc: ti: omap-prm: Add pm_clk for genpd
      soc: ti: pm33xx: Enable basic PM runtime support for genpd
      remoteproc/wkup_m3: Use reset control driver if available

 arch/arm/mach-omap2/omap_hwmod.c      |  6 +++
 arch/arm/mach-omap2/pdata-quirks.c    | 11 +++++
 drivers/bus/ti-sysc.c                 | 41 ++++++++++++-----
 drivers/clk/ti/clk-33xx.c             |  2 +
 drivers/remoteproc/wkup_m3_rproc.c    | 41 +++++++++++------
 drivers/soc/ti/omap_prm.c             | 84 +++++++++++++++++++++++++++++++++--
 drivers/soc/ti/pm33xx.c               | 17 ++++++-
 include/linux/platform_data/ti-sysc.h |  1 +
 8 files changed, 174 insertions(+), 29 deletions(-)

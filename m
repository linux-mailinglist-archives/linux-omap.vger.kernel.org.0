Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DC62AD4A2
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 12:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKJLUt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 06:20:49 -0500
Received: from muru.com ([72.249.23.125]:47654 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbgKJLUt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 06:20:49 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D546681A8;
        Tue, 10 Nov 2020 11:20:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCHv2 0/9] Genpd related code changes to drop am335x pdata
Date:   Tue, 10 Nov 2020 13:20:33 +0200
Message-Id: <20201110112042.65489-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's v2 set of changes for v5.11 merge window to drop the remaining
am335x platform data.

Changes since v1:
- Simplify wkup_m3_rproc.c changes as suggested by Philipp Zabel
- Do not configure pm_clk for omap_prm.c except for simple-pm-bus

These patches depend on:

[PATCH 2/4] ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF

And the related device tree changes have been posted as:

[PATCH 00/18] Drop remaining pdata for am335x and use genpd

Regards,

Tony


Tero Kristo (1):
  soc: ti: omap-prm: am3: add genpd support for remaining PRM instances

Tony Lindgren (8):
  ARM: OMAP2+: Check for inited flag
  ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
  clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
  bus: ti-sysc: Support modules without control registers
  bus: ti-sysc: Implement GPMC debug quirk to drop platform data
  soc: ti: omap-prm: Add pm_clk for genpd
  soc: ti: pm33xx: Enable basic PM runtime support for genpd
  remoteproc/wkup_m3: Use reset control driver if available

 arch/arm/mach-omap2/omap_hwmod.c      |  6 ++
 arch/arm/mach-omap2/pdata-quirks.c    | 11 ++++
 drivers/bus/ti-sysc.c                 | 17 ++++++
 drivers/clk/ti/clk-33xx.c             |  2 +
 drivers/remoteproc/wkup_m3_rproc.c    | 41 +++++++++-----
 drivers/soc/ti/omap_prm.c             | 80 ++++++++++++++++++++++++++-
 drivers/soc/ti/pm33xx.c               | 17 +++++-
 include/linux/platform_data/ti-sysc.h |  1 +
 8 files changed, 157 insertions(+), 18 deletions(-)

-- 
2.29.2

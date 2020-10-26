Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAB2298B5F
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772840AbgJZLK5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:10:57 -0400
Received: from muru.com ([72.249.23.125]:46486 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1772586AbgJZLK4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:10:56 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D0C3480AA;
        Mon, 26 Oct 2020 11:10:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
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
Subject: [PATCH 0/9] Genpd related code changes to drop am335x pdata
Date:   Mon, 26 Oct 2020 13:10:40 +0200
Message-Id: <20201026111049.54835-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are the code related changes for v5.11 merge window to drop the
remaining am335x platform data. I'll be posting the related device tree
changes separately.

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

 arch/arm/mach-omap2/omap_hwmod.c      |  6 +++
 arch/arm/mach-omap2/pdata-quirks.c    | 11 ++++
 drivers/bus/ti-sysc.c                 | 17 +++++++
 drivers/clk/ti/clk-33xx.c             |  2 +
 drivers/remoteproc/wkup_m3_rproc.c    | 28 +++++++---
 drivers/soc/ti/omap_prm.c             | 73 +++++++++++++++++++++++++--
 drivers/soc/ti/pm33xx.c               | 17 ++++++-
 include/linux/platform_data/ti-sysc.h |  1 +
 8 files changed, 143 insertions(+), 12 deletions(-)

-- 
2.29.1

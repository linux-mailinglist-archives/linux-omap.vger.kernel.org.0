Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5554A80AE
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 09:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349638AbiBCI4c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 03:56:32 -0500
Received: from muru.com ([72.249.23.125]:45842 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349628AbiBCI4b (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 03:56:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 606BB80EE;
        Thu,  3 Feb 2022 08:56:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Drop TI compatibility clocks
Date:   Thu,  3 Feb 2022 10:56:15 +0200
Message-Id: <20220203085618.16043-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

In order to prepare the TI clocks for fixing lots of devicetree warnings,
let's first drop the now unused compatibility clocks.

The dra7 changes depend on my still pending omap-for-v5.17/fixes-not-urgent
pull request that did not make it for v5.17-rc series so far.

Regards,

Tony


Tony Lindgren (3):
  clk: ti: Drop legacy compatibility clocks for am3
  clk: ti: Drop legacy compatibility clocks for am4
  clk: ti: Drop legacy compatibility clocks for dra7

 drivers/clk/ti/Makefile          |   9 +-
 drivers/clk/ti/clk-33xx-compat.c | 218 --------
 drivers/clk/ti/clk-33xx.c        |   5 +-
 drivers/clk/ti/clk-43xx-compat.c | 225 ---------
 drivers/clk/ti/clk-43xx.c        |   5 +-
 drivers/clk/ti/clk-7xx-compat.c  | 820 -------------------------------
 drivers/clk/ti/clk-7xx.c         |   5 +-
 drivers/clk/ti/clkctrl.c         |  33 +-
 drivers/clk/ti/clock.h           |   3 -
 include/dt-bindings/clock/am3.h  |  93 ----
 include/dt-bindings/clock/am4.h  |  98 ----
 include/dt-bindings/clock/dra7.h | 168 -------
 12 files changed, 15 insertions(+), 1667 deletions(-)
 delete mode 100644 drivers/clk/ti/clk-33xx-compat.c
 delete mode 100644 drivers/clk/ti/clk-43xx-compat.c
 delete mode 100644 drivers/clk/ti/clk-7xx-compat.c

-- 
2.35.1

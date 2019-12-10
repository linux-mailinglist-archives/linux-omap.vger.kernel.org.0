Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74073118ECD
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 18:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfLJRVP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 12:21:15 -0500
Received: from muru.com ([72.249.23.125]:44658 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLJRVO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 12:21:14 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1738280E1;
        Tue, 10 Dec 2019 17:21:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 0/5] Clock changes needed to probe rng on omap4 and 5
Date:   Tue, 10 Dec 2019 09:21:03 -0800
Message-Id: <20191210172108.38868-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

We are currently missing the secure clocks for omap4 and 5, and that
prevents us from adding rng and crypto accelerators to probe with
ti-sysc interconnect target module driver.

We also have a clkctrl clock driver issue where we must rely on the dts
node names for the clocks to work, so we must first fix that before we
can add the drivers. Otherwise a wrong clock domain will be used for the
secure clocks.

I'll be posting dts changes for the crypto accelerators in a separate
series later on to keep things easier to review.

For merging these after review, I suggest that Tero picks up the first
three clock related patches and sets up an immutable branch against
v5.5-rc1 that I can also merge in for the rng and crypto accelerator
dts changes.

Regards,

Tony


Tony Lindgren (5):
  clk: ti: clkctrl: Fix hidden dependency to node name
  ARM: dts: Add missing omap4 secure clocks
  ARM: dts: Add missing omap5 secure clocks
  ARM: dts: Configure omap4 rng to probe with ti-sysc
  ARM: dts: Configure omap5 rng to probe with ti-sysc

 .../devicetree/bindings/clock/ti-clkctrl.txt  | 11 ++-
 .../boot/dts/motorola-mapphone-common.dtsi    |  5 +
 arch/arm/boot/dts/omap4-l4.dtsi               | 20 +++-
 arch/arm/boot/dts/omap44xx-clocks.dtsi        | 11 ++-
 arch/arm/boot/dts/omap5-l4.dtsi               | 20 +++-
 arch/arm/boot/dts/omap54xx-clocks.dtsi        | 10 +-
 drivers/clk/ti/clk-44xx.c                     | 13 +++
 drivers/clk/ti/clk-54xx.c                     | 13 +++
 drivers/clk/ti/clk.c                          |  4 +-
 drivers/clk/ti/clkctrl.c                      | 96 ++++++++++++++++---
 include/dt-bindings/clock/omap4.h             | 11 +++
 include/dt-bindings/clock/omap5.h             | 11 +++
 12 files changed, 199 insertions(+), 26 deletions(-)

-- 
2.24.0

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8F22B935C
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgKSNNF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:05 -0500
Received: from muru.com ([72.249.23.125]:48858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727300AbgKSNNF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:05 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2CBE480C1;
        Thu, 19 Nov 2020 13:13:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 0/8] Configure genpd domains for dra7 and omap5
Date:   Thu, 19 Nov 2020 15:12:51 +0200
Message-Id: <20201119131259.63829-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are patches to configure genpd domains for dra7 and omap5
to get us a bit closer for switching to booting with genpd and
simple-pm-bus.

Regards,

Tony


Tero Kristo (4):
  soc: ti: omap-prm: dra7: add genpd support for remaining PRM instances
  ARM: dts: dra7: add remaining PRM instances
  soc: ti: omap-prm: omap5: add genpd support for remaining PRM
    instances
  ARM: dts: omap5: add remaining PRM instances

Tony Lindgren (4):
  clk: ti: dra7: Drop idlest polling from IVA clkctrl clocks
  ARM: dts: Configure interconnect target module for dra7 iva
  ARM: OMAP2+: Drop legacy platform data for dra7 gpmc
  ARM: dts: Configure power domain for omap5 dss

 arch/arm/boot/dts/dra7.dtsi               | 151 +++++++++++++++++--
 arch/arm/boot/dts/dra7xx-clocks.dtsi      |  14 ++
 arch/arm/boot/dts/omap5.dtsi              |  58 ++++++++
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c |  49 -------
 drivers/clk/ti/clk-7xx.c                  |   7 +
 drivers/soc/ti/omap_prm.c                 | 167 ++++++++++++++++++++--
 include/dt-bindings/clock/dra7.h          |   4 +
 7 files changed, 373 insertions(+), 77 deletions(-)

-- 
2.29.2

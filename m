Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A18418A973
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 00:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCRXsv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 19:48:51 -0400
Received: from muru.com ([72.249.23.125]:60870 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbgCRXsv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 19:48:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6DDF580B6;
        Wed, 18 Mar 2020 23:49:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] drop remaining cpsw and edma platform data for v5.7
Date:   Wed, 18 Mar 2020 16:48:43 -0700
Message-Id: <pull-1584575307-189595@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 104d56b3e3766931ff1a1d786d2fcce908daaaf7:

  ARM: OMAP2+: Drop legacy platform data for dra7 edma (2020-03-06 07:20:04 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/ti-sysc-drop-pdata-ti81xx-signed

for you to fetch changes up to 0143b9fd06ed6da93fd8c6b3393f5d4de7a01ba9:

  ARM: OMAP2+: Drop legacy platform data for ti81xx edma (2020-03-17 09:48:54 -0700)

----------------------------------------------------------------
Drop remaining legacy platform data for cpsw and edma

With a non-critical clock fix for dm814x ethernet, we can update ti81xx
for cpsw ethernet and edma to probe them with ti-sysc interconnect
target module driver and device tree data. And we can drop the related
remaining platform data for cpsw and edma.

----------------------------------------------------------------
Tony Lindgren (11):
      clk: ti: Fix dm814x clkctrl for ethernet
      Merge tag 'omap-for-v5.7/ti-sysc-drop-pdata-signed' into ti81xx
      ARM: dts: Configure interconnect target module for dm814x cpsw
      ARM: OMAP2+: Drop legacy platform data for dm814x cpsw
      ARM: dts: Configure interconnect target module for dm814x tpcc
      ARM: dts: Configure interconnect target module for dm814x tptc0
      ARM: dts: Configure interconnect target module for dm814x tptc1
      ARM: dts: Configure interconnect target module for dm814x tptc2
      ARM: dts: Configure interconnect target module for dm814x tptc3
      ARM: dts: Configure interconnect target module for ti816x edma
      ARM: OMAP2+: Drop legacy platform data for ti81xx edma

 arch/arm/boot/dts/dm814x-clocks.dtsi       |  14 ++
 arch/arm/boot/dts/dm814x.dtsi              | 260 +++++++++++++++++++----------
 arch/arm/boot/dts/dm816x.dtsi              | 148 ++++++++++++++--
 arch/arm/boot/dts/dra62x.dtsi              |   6 +-
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 231 -------------------------
 drivers/clk/ti/clk-814x.c                  |   7 +-
 include/dt-bindings/clock/dm814.h          |   5 +
 7 files changed, 332 insertions(+), 339 deletions(-)

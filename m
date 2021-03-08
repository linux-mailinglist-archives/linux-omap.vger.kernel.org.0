Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538A2330F93
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhCHNjW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:22 -0500
Received: from muru.com ([72.249.23.125]:40850 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhCHNjN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E9D2080D4;
        Mon,  8 Mar 2021 13:39:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 00/12] Update omap4 devicetree files to probe with genpd
Date:   Mon,  8 Mar 2021 15:38:58 +0200
Message-Id: <20210308133910.12454-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are the devicetree changes to update omap4 to probe with genpd and
simple-pm-bus.

These patches are against v5.12-rc2, and depend on the following preparatory
patches posted earlier:

"ARM: OMAP2+: Init both prm and prcm nodes early for clocks"
"bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
"ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race"
"ARM: dts: Fix moving mmc devices with aliases for omap4 & 5"
"bus: ti-sysc: Fix initializing module_pa for modules without sysc register"
"soc: ti: omap-prm: Allow hardware supported retention when idle"

I will post another series to drop the legacy data.

Regards,

Tony


Tony Lindgren (12):
  ARM: dts: Configure power-domain for omap4 gfx
  ARM: dts: Configure power-domain for omap4 dts iss
  ARM: dts: Configure interconnect target module for omap4 dmm
  ARM: dts: Configure interconnect target module for omap4 emif
  ARM: dts: Configure interconnect target module for omap4 debugss
  ARM: dts: Configure interconnect target module for omap4 mpu
  ARM: dts: Move omap4 mmio-sram out of l3 interconnect
  ARM: dts: Move omap4 l3-noc to a separate node
  ARM: dts: Configure simple-pm-bus for omap4 l4_wkup
  ARM: dts: Configure simple-pm-bus for omap4 l4_per
  ARM: dts: Configure simple-pm-bus for omap4 l4_cfg
  ARM: dts: Prepare for simple-pm-bus for omap4 l3

 arch/arm/boot/dts/omap4-l4.dtsi |  39 +++++---
 arch/arm/boot/dts/omap4.dtsi    | 165 ++++++++++++++++++++++----------
 arch/arm/boot/dts/omap4460.dtsi |  13 ++-
 3 files changed, 143 insertions(+), 74 deletions(-)

-- 
2.30.1

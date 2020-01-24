Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EB148F22
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 21:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404024AbgAXULa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 15:11:30 -0500
Received: from muru.com ([72.249.23.125]:52196 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403994AbgAXULa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jan 2020 15:11:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9488C8160;
        Fri, 24 Jan 2020 20:12:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] late dts changes for omaps for v5.6
Date:   Fri, 24 Jan 2020 12:11:24 -0800
Message-Id: <pull-1579896427-50330@atomide.com-3>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <pull-1579896427-50330@atomide.com>
References: <pull-1579896427-50330@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6bcc319fc6192cb03f3db41f0e266b796b0e424f:

  ARM: dts: Add omap3-echo (2020-01-13 10:11:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/dt-late-signed

for you to fetch changes up to 2256e6f68c9e02524182640ba9584d978d490145:

  ARM: dts: omap4-droid4: Enable hdq for droid4 ds250x 1-wire battery nvmem (2020-01-23 10:00:01 -0800)

----------------------------------------------------------------
Late omap dts changes for v5.6 merge window

This series of changes mostly configures the cameras for dra7 and
am437x that have been pending for few months now because of waiting
for clock dependencies to clear. So these changes are based on earlier
dts changes with with Tero Kristo's for-5.6-ti-clk branch merged in.

Then there's a series of changes to configure powervr sgx target module
for am335x, am437x and dra7 that have been waiting to have the rstctrl
reset driver dependencies to clear.

Also included are few minor patches to configure 1-wire and coulomb
counter calibration interrupt for droid4.

----------------------------------------------------------------
Benoit Parrot (13):
      clk: ti: dra7: add cam clkctrl data
      clk: ti: dra7: add vpe clkctrl data
      ARM: dts: dra7: add cam clkctrl node
      ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP only
      ARM: dts: dra7-l4: Add ti-sysc node for CAM
      ARM: dts: DRA72: Add CAL dtsi node
      arm: dts: dra72-evm-common: Add entries for the CSI2 cameras
      arm: dtsi: dra76x: Add CAL dtsi node
      arm: dts: dra76-evm: Add CAL and OV5640 nodes
      ARM: dts: am437x-sk-evm: Add VPFE and OV2659 entries
      ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries
      ARM: dts: dra7: add vpe clkctrl node
      ARM: dts: dra7: Add ti-sysc node for VPE

Grygorii Strashko (1):
      clk: ti: dra7: fix parent for gmac_clkctrl

Peter Ujfalusi (1):
      dt-bindings: clock: Move ti-dra7-atl.h to dt-bindings/clock

Tero Kristo (1):
      ARM: dts: am43xx: add support for clkout1 clock

Tony Lindgren (9):
      clk: ti: omap5: Add missing AESS clock
      clk: ti: add clkctrl data dra7 sgx
      clk: ti: clkctrl: Fix hidden dependency to node name
      Merge branch 'omap-for-v5.6/ti-sysc-dt-cam' into omap-for-v5.6/dt
      ARM: dts: Configure rstctrl reset for am335x SGX
      ARM: dts: Configure sgx for dra7
      ARM: dts: Configure interconnect target module for am437x sgx
      ARM: dts: motorola-cpcap-mapphone: Configure calibration interrupt
      ARM: dts: omap4-droid4: Enable hdq for droid4 ds250x 1-wire battery nvmem

 .../devicetree/bindings/clock/ti-clkctrl.txt       | 11 ++-
 .../devicetree/bindings/clock/ti/dra7-atl.txt      |  4 +-
 arch/arm/boot/dts/am33xx.dtsi                      | 25 ++++++
 arch/arm/boot/dts/am4372.dtsi                      | 20 +++++
 arch/arm/boot/dts/am437x-sk-evm.dts                | 27 +++++-
 arch/arm/boot/dts/am43x-epos-evm.dts               | 23 +++++-
 arch/arm/boot/dts/am43xx-clocks.dtsi               | 54 ++++++++++++
 arch/arm/boot/dts/dra7-evm-common.dtsi             |  2 +-
 arch/arm/boot/dts/dra7-l4.dtsi                     | 71 ++++++++++++++--
 arch/arm/boot/dts/dra7.dtsi                        | 18 ++++
 arch/arm/boot/dts/dra72-evm-common.dtsi            | 33 +++++++-
 arch/arm/boot/dts/dra72x.dtsi                      | 42 ++++++++++
 arch/arm/boot/dts/dra76-evm.dts                    | 35 ++++++++
 arch/arm/boot/dts/dra76x.dtsi                      | 42 ++++++++++
 arch/arm/boot/dts/dra7xx-clocks.dtsi               | 46 ++++++++++-
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi     |  5 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    | 14 ++++
 arch/arm/mach-omap2/clockdomains7xx_data.c         |  2 +-
 drivers/clk/ti/clk-54xx.c                          | 15 ++++
 drivers/clk/ti/clk-7xx.c                           | 62 +++++++++++++-
 drivers/clk/ti/clk.c                               |  4 +-
 drivers/clk/ti/clkctrl.c                           | 96 +++++++++++++++++++---
 include/dt-bindings/clock/dra7.h                   | 23 ++++++
 include/dt-bindings/clock/omap5.h                  |  1 +
 include/dt-bindings/{clk => clock}/ti-dra7-atl.h   |  0
 25 files changed, 639 insertions(+), 36 deletions(-)
 rename include/dt-bindings/{clk => clock}/ti-dra7-atl.h (100%)

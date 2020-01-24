Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2728148F21
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 21:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403928AbgAXUL3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 15:11:29 -0500
Received: from muru.com ([72.249.23.125]:52192 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403994AbgAXUL3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jan 2020 15:11:29 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6ACBF8150;
        Fri, 24 Jan 2020 20:12:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] ti-sysc changes for omap4 & 5 crypto
Date:   Fri, 24 Jan 2020 12:11:23 -0800
Message-Id: <pull-1579896427-50330@atomide.com-2>
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

The following changes since commit 9fc85a7124b5ff9ec24ad391f9994f89ae611313:

  Merge branch 'omap-for-v5.6/sdma' into omap-for-v5.6/ti-sysc-drop-pdata (2019-12-30 10:17:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/ti-sysc-drop-pdata-crypto-signed

for you to fetch changes up to 885d21e4956dd70fcd84ed653a8368c9729cfb3e:

  Merge branch 'omap-for-v5.6/ti-sysc-omap45-rng' into omap-for-v5.6/ti-sysc-drop-pdata (2020-01-23 08:38:34 -0800)

----------------------------------------------------------------
Late changes for omap secure accelerators for v5.6 merge window

A series of changes to configure secure accelerators for omap4 & 5
to finally get hardware random number generator working.

Apologies on a late pull request on these changes, but this pull
request could not be sent out earlier because of a dependency to
recent clock changes. This is based on earlier changes to drop omap
legacy platform data with Tero Kristo's for-5.6-ti-clk branch merged
in.

----------------------------------------------------------------
Benoit Parrot (2):
      clk: ti: dra7: add cam clkctrl data
      clk: ti: dra7: add vpe clkctrl data

Colin Ian King (1):
      dmaengine: ti: omap-dma: don't allow a null od->plat pointer to be dereferenced

Grygorii Strashko (1):
      clk: ti: dra7: fix parent for gmac_clkctrl

Peter Ujfalusi (1):
      dt-bindings: clock: Move ti-dra7-atl.h to dt-bindings/clock

Tony Lindgren (15):
      Merge branch 'omap-for-v5.6/sdma' into omap-for-v5.6/ti-sysc-drop-pdata
      clk: ti: omap5: Add missing AESS clock
      clk: ti: add clkctrl data dra7 sgx
      clk: ti: clkctrl: Fix hidden dependency to node name
      ARM: dts: Add missing omap4 secure clocks
      ARM: dts: Add missing omap5 secure clocks
      ARM: dts: Configure omap4 rng to probe with ti-sysc
      ARM: dts: Configure omap5 rng to probe with ti-sysc
      ARM: dts: Configure interconnect target module for omap4 sham
      ARM: dts: Configure interconnect target module for omap4 aes
      ARM: dts: Configure interconnect target module for omap4 des
      ARM: OMAP2+: Drop legacy platform data for omap4 aes
      ARM: OMAP2+: Drop legacy platform data for omap4 sham
      ARM: OMAP2+: Drop legacy platform data for omap4 des
      Merge branch 'omap-for-v5.6/ti-sysc-omap45-rng' into omap-for-v5.6/ti-sysc-drop-pdata

 .../devicetree/bindings/clock/ti-clkctrl.txt       |  11 +-
 .../devicetree/bindings/clock/ti/dra7-atl.txt      |   4 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi             |   2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi            |   2 +-
 arch/arm/boot/dts/dra7xx-clocks.dtsi               |  14 +++
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    |   5 +
 arch/arm/boot/dts/omap4-l4.dtsi                    |  49 +++++++-
 arch/arm/boot/dts/omap4.dtsi                       | 110 ++++++++++++-----
 arch/arm/boot/dts/omap44xx-clocks.dtsi             |  11 +-
 arch/arm/boot/dts/omap5-l4.dtsi                    |  20 ++-
 arch/arm/boot/dts/omap54xx-clocks.dtsi             |  10 +-
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         | 135 ---------------------
 drivers/clk/ti/clk-44xx.c                          |  13 ++
 drivers/clk/ti/clk-54xx.c                          |  28 +++++
 drivers/clk/ti/clk-7xx.c                           |  62 +++++++++-
 drivers/clk/ti/clk.c                               |   4 +-
 drivers/clk/ti/clkctrl.c                           |  96 +++++++++++++--
 drivers/dma/ti/omap-dma.c                          |   6 +-
 include/dt-bindings/clock/dra7.h                   |  23 ++++
 include/dt-bindings/clock/omap4.h                  |  11 ++
 include/dt-bindings/clock/omap5.h                  |  12 ++
 include/dt-bindings/{clk => clock}/ti-dra7-atl.h   |   0
 22 files changed, 430 insertions(+), 198 deletions(-)
 rename include/dt-bindings/{clk => clock}/ti-dra7-atl.h (100%)

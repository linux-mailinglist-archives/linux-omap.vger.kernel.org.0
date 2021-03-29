Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F1A34C55B
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 09:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhC2Hzz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 03:55:55 -0400
Received: from muru.com ([72.249.23.125]:48346 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229762AbhC2Hzg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 03:55:36 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2D7418111;
        Mon, 29 Mar 2021 07:56:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Devicetree changes for omaps for genpd support
Date:   Mon, 29 Mar 2021 10:55:21 +0300
Message-Id: <pull-1617004205-537424@atomide.com-2>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <pull-1617004205-537424@atomide.com>
References: <pull-1617004205-537424@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e259c2926c016dd815e5547412356d378fc1f589:

  PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driver (2021-03-10 14:01:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dts-genpd-signed

for you to fetch changes up to 083516ad540a1104a0ae5ae7e83f2a2d8e39d2bc:

  Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd (2021-03-10 14:16:34 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for genpd support for v5.13

In order to move omap4/5 and dra7 to probe with devicetree data and genpd,
we need to add the missing interconnect target module configuration for
the drivers that do not still have it. This is similar to what we have
already done earlier for am3 and 4 earlier.

These patches are very much similar for all the three SoCs here. The dra7
changes were already available for v5.12 merge window, but were considered
too late to add for v5.12. The patches for omap4 and 5 follow the same
pattern, except for PCIe that is available only on dra7.

We do the changes one driver at a time, and still keep the legacy property
for "ti,hwmods" mostly around, except for cases when already not needed.
We will be dropping the custom property and related legacy data in a
follow-up series.

----------------------------------------------------------------
Tony Lindgren (38):
      ARM: dts: Update pcie ranges for dra7
      ARM: dts: Configure interconnect target module for dra7 pcie
      ARM: dts: Properly configure dra7 edma sysconfig registers
      ARM: dts: Move dra7 l3 noc to a separate node
      ARM: dts: Configure interconnect target module for dra7 qspi
      ARM: dts: Configure interconnect target module for dra7 sata
      ARM: dts: Configure interconnect target module for dra7 mpu
      ARM: dts: Configure interconnect target module for dra7 dmm
      ARM: dts: Configure simple-pm-bus for dra7 l4_wkup
      ARM: dts: Configure simple-pm-bus for dra7 l4_per1
      ARM: dts: Configure simple-pm-bus for dra7 l4_per2
      ARM: dts: Configure simple-pm-bus for dra7 l4_per3
      ARM: dts: Configure simple-pm-bus for dra7 l4_cfg
      ARM: dts: Configure simple-pm-bus for dra7 l3
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
      ARM: dts: Configure interconnect target module for omap5 dmm
      ARM: dts: Configure interconnect target module for omap5 emif
      ARM: dts: Configure interconnect target module for omap5 mpu
      ARM: dts: Configure interconnect target module for omap5 gpmc
      ARM: dts: Configure interconnect target module for omap5 sata
      ARM: dts: Move omap5 mmio-sram out of l3 interconnect
      ARM: dts: Move omap5 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap5 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap5 l4_per
      ARM: dts: Configure simple-pm-bus for omap5 l4_cfg
      ARM: dts: Configure simple-pm-bus for omap5 l3
      Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd

 arch/arm/boot/dts/dra7-l4.dtsi  |  76 ++++++++++----
 arch/arm/boot/dts/dra7.dtsi     | 215 +++++++++++++++++++++++++++-------------
 arch/arm/boot/dts/omap4-l4.dtsi |  39 +++++---
 arch/arm/boot/dts/omap4.dtsi    | 165 ++++++++++++++++++++----------
 arch/arm/boot/dts/omap4460.dtsi |  13 ++-
 arch/arm/boot/dts/omap5-l4.dtsi |  67 +++++++++----
 arch/arm/boot/dts/omap5.dtsi    | 204 ++++++++++++++++++++++++--------------
 7 files changed, 526 insertions(+), 253 deletions(-)

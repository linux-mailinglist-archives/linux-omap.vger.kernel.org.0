Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF0C3AC572
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 09:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhFRH5T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 03:57:19 -0400
Received: from muru.com ([72.249.23.125]:48274 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233697AbhFRH5B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Jun 2021 03:57:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C4C2C81AC;
        Fri, 18 Jun 2021 07:55:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Devicetree binding clean-up for omaps for v5.14
Date:   Fri, 18 Jun 2021 10:54:46 +0300
Message-Id: <pull-1624002812-396117@atomide.com-2>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1624002812-396117@atomide.com>
References: <pull-1624002812-396117@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 9e7f5ee1137397def6580461e27e5efcb68183ee:

  ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names (2021-05-27 15:12:33 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/dt-cleanup-signed

for you to fetch changes up to 9b11fec7345f21995f4ea4bafb0e108b9a620238:

  ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema (2021-06-11 10:35:08 +0300)

----------------------------------------------------------------
Devicetree binding clean-up for omaps for v5.14

Minor devicetree clean-up for omaps for the binding checks:

- Drop unsupported dmas for omap2/3 i2c
- Drop redundant ehrpwm compatible
- Drop am33xx-ecap compatible no longer needed
- Correct node names for ecap
- Drop unsupported interrupts for ecap
- Drop redundant ti,pcf8575
- Correct usage for ti,pindir-d0-out-d1-in

----------------------------------------------------------------
Aswath Govindraju (2):
      ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
      ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema

Geert Uytterhoeven (1):
      ARM: dts: dra7x-evm: Drop "ti,pcf8575"

Lokesh Vutla (4):
      ARM: dts: ti: drop usage of redundant compatible
      ARM: dts: ti: Drop usage of ti,am33xx-ecap from DT nodes
      ARM: dts: ti: Fix node name for all ecap dt nodes
      ARM: dts: am33xx: Drop interrupt property from ecap nodes

Vignesh Raghavendra (1):
      ARM: dts: omap2/3: Drop dmas property from I2C node

 arch/arm/boot/dts/am335x-cm-t335.dts    |  4 ++--
 arch/arm/boot/dts/am335x-evm.dts        |  2 +-
 arch/arm/boot/dts/am335x-evmsk.dts      |  2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi        | 30 +++++++++---------------------
 arch/arm/boot/dts/am437x-l4.dtsi        | 33 ++++++++++++---------------------
 arch/arm/boot/dts/am43x-epos-evm.dts    |  4 ++--
 arch/arm/boot/dts/da850.dtsi            | 21 ++++++++-------------
 arch/arm/boot/dts/dm816x.dtsi           |  4 ----
 arch/arm/boot/dts/dra7-evm.dts          |  6 +++---
 arch/arm/boot/dts/dra7-l4.dtsi          |  6 +++---
 arch/arm/boot/dts/dra72-evm-common.dtsi |  4 ++--
 arch/arm/boot/dts/dra76-evm.dts         |  6 +++---
 arch/arm/boot/dts/omap2.dtsi            |  4 ----
 arch/arm/boot/dts/omap3.dtsi            |  6 ------
 14 files changed, 46 insertions(+), 86 deletions(-)

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279AA132D05
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 18:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgAGR3s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 12:29:48 -0500
Received: from muru.com ([72.249.23.125]:50380 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728321AbgAGR3s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jan 2020 12:29:48 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0A9788022;
        Tue,  7 Jan 2020 17:30:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] few omap fixes for v5.5-rc cycle
Date:   Tue,  7 Jan 2020 09:29:41 -0800
Message-Id: <pull-1578418121-413328@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e709ed70d122e94cb426b1e1f905829eae19a009:

  bus: ti-sysc: Fix missing reset delay handling (2019-12-12 08:20:10 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/fixes-rc5

for you to fetch changes up to 03729cfa0d543bc996bf959e762ec999afc8f3d2:

  soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot (2019-12-17 15:18:36 -0800)

----------------------------------------------------------------
Fixes for omaps for v5.5-rc cycle

Here are few fixes for v5.5-rc cycle:

- Two corner case fixes related to ti-sysc driver clock issues

- Fixes for am57xx dts for pcie gpios

- Beagle-x15 regulator dts fix

- Fix for wkup_m3_ipc driver race

----------------------------------------------------------------
Dave Gerlach (1):
      soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot

Kishon Vijay Abraham I (3):
      ARM: dts: am57xx-beagle-x15/am57xx-idk: Remove "gpios" for  endpoint dt nodes
      ARM: dts: am571x-idk: Fix gpios property to have the correct  gpio number
      ARM: dts: beagle-x15-common: Model 5V0 regulator

Tony Lindgren (2):
      ARM: OMAP2+: Fix ti_sysc_find_one_clockdomain to check for to_clk_hw_omap
      bus: ti-sysc: Fix iterating over clocks

 arch/arm/boot/dts/am571x-idk.dts                |  6 +-----
 arch/arm/boot/dts/am572x-idk-common.dtsi        |  4 ----
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 25 +++++++++++++++++++++----
 arch/arm/mach-omap2/pdata-quirks.c              |  6 +++++-
 drivers/bus/ti-sysc.c                           | 10 ++++++++--
 drivers/soc/ti/wkup_m3_ipc.c                    |  4 ++--
 6 files changed, 37 insertions(+), 18 deletions(-)

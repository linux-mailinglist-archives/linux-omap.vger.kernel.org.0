Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710694252F7
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241144AbhJGM23 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:28:29 -0400
Received: from muru.com ([72.249.23.125]:41824 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241267AbhJGM22 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:28:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3C03C80C7;
        Thu,  7 Oct 2021 12:27:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fix for omaps for v5.15-rc cycle
Date:   Thu,  7 Oct 2021 15:26:31 +0300
Message-Id: <pull-1633609552-789682@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/fixes-rc4

for you to fetch changes up to 80d680fdccba214e8106dc1aa33de5207ad75394:

  ARM: dts: omap3430-sdp: Fix NAND device node (2021-10-06 08:05:08 +0300)

----------------------------------------------------------------
Fixes for omaps for v5.15

Few regression fixes for omaps for the v5.15-rc cycle. There is a fix
for boot time hangs that can happen on some am335x devices that started
when the pruss devicetree nodes were added. The other fixes are less
critical:

- Fix compiler warning for sysc_init_soc() that got recently introduced

- Fix external abort for am335x pruss as otherwise some am335x will hang

- Use CLKDM_NOAUTO quirk also for dra7 dcan1

- Fix older NAND device node regression for omap3-sdp

----------------------------------------------------------------
Nathan Chancellor (1):
      bus: ti-sysc: Add break in switch statement in sysc_init_soc()

Roger Quadros (1):
      ARM: dts: omap3430-sdp: Fix NAND device node

Tony Lindgren (3):
      soc: ti: omap-prm: Fix external abort for am335x pruss
      Merge branch 'pruss-fix' into fixes
      bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893

 arch/arm/boot/dts/omap3430-sdp.dts |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c   |  2 ++
 drivers/bus/ti-sysc.c              |  4 ++++
 drivers/soc/ti/omap_prm.c          | 27 +++++++++++++++------------
 4 files changed, 22 insertions(+), 13 deletions(-)

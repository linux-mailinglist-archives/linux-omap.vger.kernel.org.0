Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8C1398109
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 08:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhFBGWF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 02:22:05 -0400
Received: from muru.com ([72.249.23.125]:35230 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231175AbhFBGWF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 02:22:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5737A80E0;
        Wed,  2 Jun 2021 06:20:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] PM and build warning fixes for omaps
Date:   Wed,  2 Jun 2021 09:20:17 +0300
Message-Id: <pull-1622614772-543196@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-pm

for you to fetch changes up to bae989c4bc53f861cc1b706aab0194703e9907a8:

  ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power (2021-05-26 14:01:27 +0300)

----------------------------------------------------------------
PM and build warning fixes for omaps

While chasing system suspend related regressions, I noticed few other
issues related to PM would be good to have fixed:

- UART idling does not always work for hardware autoidle features
- am335x resume works only the first time unless musb module is loaded

Then there are three patches for omap1 related warnings caused by the gpio
changes, and one build warning fix for legacy mmc platform code when mmc
is built as a loadable module.

These can all be merged whenever suitable naturally. I've sent the more
urgent SATA regression fix separately although it appears in this pull
request too because of the branches merged.

----------------------------------------------------------------
Maciej Falkowski (3):
      ARM: OMAP1: Fix use of possibly uninitialized irq variable
      ARM: OMAP1: isp1301-omap: Add missing gpiod_add_lookup_table function
      ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power

Tony Lindgren (5):
      bus: ti-sysc: Fix missing quirk flags for sata
      Merge branch 'omap-for-v5.13/ti-sysc' into fixes
      Merge branch 'fixes-rc1' into fixes
      bus: ti-sysc: Fix am335x resume hang for usb otg module
      bus: ti-sysc: Fix flakey idling of uarts and stop using swsup_sidle_act

Yongqiang Liu (1):
      ARM: OMAP2+: Fix build warning when mmc_omap is not built

 arch/arm/mach-omap1/board-ams-delta.c | 14 --------
 arch/arm/mach-omap1/board-h2.c        |  4 ++-
 arch/arm/mach-omap1/pm.c              | 10 ++++--
 arch/arm/mach-omap2/board-n8x0.c      |  2 +-
 drivers/bus/ti-sysc.c                 | 60 +++++++++++++++++++++++++++++++----
 include/linux/platform_data/ti-sysc.h |  1 +
 6 files changed, 66 insertions(+), 25 deletions(-)

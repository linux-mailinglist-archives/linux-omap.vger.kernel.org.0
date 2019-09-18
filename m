Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4C2B66C7
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 17:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbfIRPK3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 11:10:29 -0400
Received: from muru.com ([72.249.23.125]:33626 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728260AbfIRPK3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 11:10:29 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 44547806C;
        Wed, 18 Sep 2019 15:11:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] fixes for omaps for v5.4 merge window
Date:   Wed, 18 Sep 2019 08:10:24 -0700
Message-Id: <pull-1568819401-72461@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4a65bbb9109ed7edd4b6ed7168ced48abb8561a2:

  soc: ti: pm33xx: Make two symbols static (2019-08-13 05:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/fixes-5.4-merge-window

for you to fetch changes up to a4c8723a162e6244fb01944fbf446750575dba59:

  bus: ti-sysc: Remove unpaired sysc_clkdm_deny_idle() (2019-09-06 12:57:46 -0700)

----------------------------------------------------------------
Fixes for omap variants

Few fixes for ti-sysc interconnect target module driver for no-idle
quirks that caused nfsroot to fail on some dra7 boards.

And let's fixes to get LCD working again for logicpd board that got
broken a while back with removal of panel-dpi driver. We need to now
use generic CONFIG_DRM_PANEL_SIMPLE instead.

----------------------------------------------------------------
Adam Ford (4):
      ARM: omap2plus_defconfig: Fix missing video
      ARM: dts: logicpd-torpedo-baseboard: Fix missing video
      ARM: dts: am3517-evm: Fix missing video
      ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux

Tony Lindgren (3):
      bus: ti-sysc: Fix clock handling for no-idle quirks
      bus: ti-sysc: Fix handling of invalid clocks
      bus: ti-sysc: Remove unpaired sysc_clkdm_deny_idle()

 arch/arm/boot/dts/am3517-evm.dts                 | 23 ++---------
 arch/arm/boot/dts/logicpd-som-lv.dtsi            | 26 ++++++------
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 37 +++--------------
 arch/arm/configs/omap2plus_defconfig             |  1 +
 arch/arm/mach-omap2/pdata-quirks.c               |  4 +-
 drivers/bus/ti-sysc.c                            | 52 +++++++++++++++++-------
 6 files changed, 64 insertions(+), 79 deletions(-)

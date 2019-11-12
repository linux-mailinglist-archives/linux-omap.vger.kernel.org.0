Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C352FF972A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 18:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfKLRdJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 12:33:09 -0500
Received: from muru.com ([72.249.23.125]:41910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726932AbfKLRdJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 12:33:09 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3CE078191;
        Tue, 12 Nov 2019 17:33:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] few more soc changes for omaps for v5.5
Date:   Tue, 12 Nov 2019 09:33:02 -0800
Message-Id: <pull-1573579927-542764@atomide.com-2>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <pull-1573579927-542764@atomide.com>
References: <pull-1573579927-542764@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bc794744cdc56f53b495debbe054946d1b620441:

  Merge branch 'omap-for-v5.5/pm' into omap-for-v5.5/soc (2019-10-23 10:42:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/soc-late-signed

for you to fetch changes up to 0b491904f053e41685162af5c5411b85b18c97a7:

  ARM: OMAP2+: Add missing put_device() call in omapdss_init_of() (2019-11-11 12:52:51 -0800)

----------------------------------------------------------------
Few late SoC changes for v5.5 merge window

These changes just clean up few typos, and there is one non-critical
correction of missing put_device() after calling of_platform_populate()
for display controller.

Naturally none of this is urgent and can be merged when suitable.

----------------------------------------------------------------
Ben Dooks (Codethink) (1):
      OMAP2: fixup doc comments in omap_device

Jonathan Neuschäfer (1):
      ARM: OMAP1: ams-delta FIQ: Fix a typo ("Initiaize")

Markus Elfring (1):
      ARM: OMAP2+: Add missing put_device() call in omapdss_init_of()

Tony Lindgren (1):
      Merge branch 'omap-for-v5.5/omap1' into omap-for-v5.5/soc

Uwe Kleine-König (1):
      ARM: OMAP1: drop duplicated dependency on ARCH_OMAP1

 arch/arm/mach-omap1/Kconfig         | 33 +++++++++++++--------------------
 arch/arm/mach-omap1/ams-delta-fiq.c |  2 +-
 arch/arm/mach-omap2/display.c       |  1 +
 arch/arm/mach-omap2/omap_device.c   | 19 +++++++------------
 4 files changed, 22 insertions(+), 33 deletions(-)

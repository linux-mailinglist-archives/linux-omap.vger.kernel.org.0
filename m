Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDAD2C608C
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 08:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392736AbgK0Hi3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 02:38:29 -0500
Received: from muru.com ([72.249.23.125]:49408 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387909AbgK0Hi2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Nov 2020 02:38:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B8FD68063;
        Fri, 27 Nov 2020 07:38:34 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.11 merge window
Date:   Fri, 27 Nov 2020 09:38:19 +0200
Message-Id: <pull-1606462656-588116@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/soc-signed

for you to fetch changes up to 2e023b938048c9857af09b96ce672e9a31dbfb38:

  ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code (2020-11-19 11:45:42 +0200)

----------------------------------------------------------------
SoC changes for omaps for v5.11 merge window:

Several non-urgent fixes for various issues found by automated tests.
So far we have not been hitting any of these so these can wait for the
merge window no problem.

----------------------------------------------------------------
Jing Xiangfeng (1):
      ARM: OMAP2+: Remove redundant assignment to variable ret

Tang Bin (1):
      ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code

Xu Wang (1):
      ARM: OMAP2+: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare

Youling Tang (2):
      ARM: OMAP2+: Fix memleak in omap2xxx_clkt_vps_init
      ARM: OMAP2+: Fix kfree NULL pointer in omap2xxx_clkt_vps_init

 arch/arm/mach-omap1/clock.c                  | 14 +++++++-------
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 11 +++++++----
 arch/arm/mach-omap2/display.c                |  6 ++----
 arch/arm/mach-omap2/omap_device.c            |  5 ++---
 4 files changed, 18 insertions(+), 18 deletions(-)

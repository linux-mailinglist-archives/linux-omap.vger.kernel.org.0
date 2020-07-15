Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D900F2214E1
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 21:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGOTJm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 15:09:42 -0400
Received: from muru.com ([72.249.23.125]:37104 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbgGOTIr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jul 2020 15:08:47 -0400
Received: from alpine.gateway.sonic.net (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D21908120;
        Wed, 15 Jul 2020 19:08:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Few fixes for omaps for v5.8
Date:   Wed, 15 Jul 2020 12:08:42 -0700
Message-Id: <pull-1594840100-132735@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a352fe371053d047481635da328ea781329c84a4:

  Merge branch 'omap-for-v5.8/fixes-rc1' into fixes (2020-06-16 09:26:03 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.8/fixes-rc5-signed

for you to fetch changes up to 2a4117df9b436a0e4c79d211284ab2097bcd00dc:

  ARM: dts: Fix dcan driver probe failed on am437x platform (2020-07-14 08:03:28 -0700)

----------------------------------------------------------------
Fixes for omaps for v5.8-rc cycle

Few fixes for issues noticed during testing:

- Two DEBUG_ATOMIC_SLEEP fixes for ti-sysc interconnect target module
  driver

- A regression fix for ti-sysc no-idle handling that caused issues
  compared to earlier platform data based booting

- A fix for memory leak for omap_hwmod_allocate_module

- Fix d_can driver probe for am437x

----------------------------------------------------------------
Chen Tao (1):
      ARM: OMAP2+: Fix possible memory leak in omap_hwmod_allocate_module

Tony Lindgren (3):
      bus: ti-sysc: Fix wakeirq sleeping function called from invalid context
      bus: ti-sysc: Fix sleeping function called from invalid context for RTC quirk
      bus: ti-sysc: Do not disable on suspend for no-idle

dillon min (1):
      ARM: dts: Fix dcan driver probe failed on am437x platform

 arch/arm/boot/dts/am437x-l4.dtsi | 14 ++++++++++----
 arch/arm/mach-omap2/omap_hwmod.c | 14 +++++++++++---
 drivers/bus/ti-sysc.c            | 23 ++++++++++++-----------
 3 files changed, 33 insertions(+), 18 deletions(-)

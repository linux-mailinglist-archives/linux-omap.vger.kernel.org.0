Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22235E20D3
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 18:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407311AbfJWQkC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 12:40:02 -0400
Received: from muru.com ([72.249.23.125]:39404 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407309AbfJWQkC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 12:40:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BF2FC816C;
        Wed, 23 Oct 2019 16:40:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] three fixes for omaps for v5.4
Date:   Wed, 23 Oct 2019 09:39:57 -0700
Message-Id: <pull-1571848757-282222@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 17a9e5bbbfe5a5a6356e47cdc1c1656e1e5e1f62:

  Merge tag 'wlcore-fix' into fixes (2019-10-11 09:15:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/fixes-rc4-signed

for you to fetch changes up to 6aed5a0e0f56213cc5e4bff674fb42e997f30df7:

  Merge branch 'watchdog-fix' into fixes (2019-10-18 08:47:39 -0700)

----------------------------------------------------------------
Three fixes for omaps for v5.4-rc cycle

Two regression fixes for omap3 iommu. I missed applying two omap3
related iommu pdata quirks patches earlier because the kbuild test
robot produced errors on them for missing dependencies.

Fix ti-sysc interconnect target module driver handling for watchdog
quirk. I must have tested this earlier only with watchdog service
running, but clearly it does not do what it needs to do.

----------------------------------------------------------------
Suman Anna (2):
      ARM: OMAP2+: Plug in device_enable/idle ops for IOMMUs
      ARM: OMAP2+: Add pdata for OMAP3 ISP IOMMU

Tony Lindgren (2):
      bus: ti-sysc: Fix watchdog quirk handling
      Merge branch 'watchdog-fix' into fixes

 arch/arm/mach-omap2/pdata-quirks.c | 11 +++++++++++
 drivers/bus/ti-sysc.c              | 18 ++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

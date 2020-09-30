Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6F927E0D8
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 08:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgI3GI1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 02:08:27 -0400
Received: from muru.com ([72.249.23.125]:45714 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3GI1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Sep 2020 02:08:27 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 47A4880BF;
        Wed, 30 Sep 2020 06:08:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] More SoC changes for omaps for v5.10
Date:   Wed, 30 Sep 2020 09:08:14 +0300
Message-Id: <pull-1601445968-476435@atomide.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 501e69b028a47e20cb0d842e267fc5aa5e5230aa:

  Merge branch 'omap-for-v5.10/omap1' into omap-for-v5.10/soc (2020-09-03 11:50:37 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/soc-part2-v2-signed

for you to fetch changes up to fb2c599f056640d289b2147fbe6d9eaee689f1b2:

  ARM: omap3: enable off mode automatically (2020-09-24 14:26:20 +0300)

----------------------------------------------------------------
One more SoC change for omaps for v5.10 merge window

Remove debugfs dependency for enabling off mode during idle
for omap3 by enabling it automatically based on the PMIC
configuration.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap3: enable off mode automatically

 arch/arm/mach-omap2/pm-debug.c |  2 --
 arch/arm/mach-omap2/pm.c       |  2 ++
 arch/arm/mach-omap2/pm.h       |  4 ----
 arch/arm/mach-omap2/pm34xx.c   | 26 +++++++++++++++++++++++++-
 4 files changed, 27 insertions(+), 7 deletions(-)

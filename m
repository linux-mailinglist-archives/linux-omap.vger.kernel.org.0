Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7057210431A
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2019 19:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfKTSQX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Nov 2019 13:16:23 -0500
Received: from muru.com ([72.249.23.125]:43090 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728080AbfKTSQX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Nov 2019 13:16:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3BF45811B;
        Wed, 20 Nov 2019 18:17:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] few ti-sysc fixes and updates for v5.5 merge window
Date:   Wed, 20 Nov 2019 10:16:19 -0800
Message-Id: <pull-1574273726-31367@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b82049f2c1395d0bf99f0ae291c748c9dcb7d507:

  Merge tag 'omap-for-v5.5/soc-late-signed' into omap-for-v5.5/ti-sysc-late (2019-11-20 10:01:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/ti-sysc-late-signed

for you to fetch changes up to d7d8d62a3f3b50b606c9395298b017bd9fd9c8d4:

  Merge branches 'omap-for-v5.5/soc' and 'omap-for-v5.5/ti-sysc' into omap-for-v5.5/ti-sysc-late (2019-11-20 10:04:05 -0800)

----------------------------------------------------------------
Few ti-sysc related fixes for v5.5 merge window

Just few minor changes that can be merged when suitable, but would
be good to have these in v5.5-rc1 to remove dependencies between branches
for more changes later on in v5.6:

- Add quirk handling for AESS (Audio Engine Sub System)

- We want to drop the useless gptimer option for omap4 as there are local
  timers

- A minor error path handling improvment for sysc_child_add_named_clock()
  that will make further patching a bit easier

----------------------------------------------------------------
Markus Elfring (1):
      bus: ti-sysc: Adjust exception handling in sysc_child_add_named_clock()

Tony Lindgren (3):
      bus: ti-sysc: Add module enable quirk for audio AESS
      ARM: OMAP2+: Drop useless gptimer option for omap4
      Merge branches 'omap-for-v5.5/soc' and 'omap-for-v5.5/ti-sysc' into omap-for-v5.5/ti-sysc-late

 arch/arm/mach-omap2/timer.c           |  4 ++--
 drivers/bus/ti-sysc.c                 | 21 ++++++++++++++++-----
 include/linux/platform_data/ti-sysc.h |  1 +
 3 files changed, 19 insertions(+), 7 deletions(-)

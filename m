Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6671744497
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 18:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392587AbfFMQht (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 12:37:49 -0400
Received: from muru.com ([72.249.23.125]:52928 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730629AbfFMHLA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Jun 2019 03:11:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2E960811B;
        Thu, 13 Jun 2019 07:11:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/4] soc changes for omap variants for v5.3
Date:   Thu, 13 Jun 2019 00:10:50 -0700
Message-Id: <pull-1560399818-512977@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/soc-signed

for you to fetch changes up to 45450f36e569e5162957df488b0174c9a952e1b0:

  soc: ti: pm33xx: Add a print while entering RTC only mode with DDR in self-refresh (2019-06-10 05:19:26 -0700)

----------------------------------------------------------------
ti-sysc soc changes for v5.3

Just two changes to make few platform data functions static, and to
call dev_info() if am437x is suspending to RTC-only mode. We want to
see this in case of issues as it depends on the board wiring for things
like DDR memory.

----------------------------------------------------------------
Keerthy (1):
      soc: ti: pm33xx: Add a print while entering RTC only mode with DDR in self-refresh

YueHaibing (1):
      ARM: OMAP2+: Make some variables static

 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 8 ++++----
 drivers/soc/ti/pm33xx.c                                 | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

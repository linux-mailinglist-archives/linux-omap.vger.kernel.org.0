Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F56C3982D7
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 09:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhFBHVJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 03:21:09 -0400
Received: from muru.com ([72.249.23.125]:35302 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhFBHVI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 03:21:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 98B9D8027;
        Wed,  2 Jun 2021 07:19:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Cleanup for omaps for v5.14
Date:   Wed,  2 Jun 2021 10:19:09 +0300
Message-Id: <pull-1622618286-677305@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/cleanup-signed

for you to fetch changes up to d61f263495d75cd0e45a50a2dc44ebc286db52b7:

  Merge branch 'omap-for-v5.13/genpd-cleanup' into omap-for-v5.14/cleanup (2021-05-21 12:42:41 +0300)

----------------------------------------------------------------
Clean up changes for omaps for v5.14 merge window

With the recent changes to drop legacy platform data for
am3/4, omap4/5, and dra7, we can drop the related unused
code. There is also a patch to remove leading spaces from
the Kconfig file.

----------------------------------------------------------------
Dario Binacchi (2):
      ARM: OMAP2+: CM: remove omap2_set_globals_cm()
      ARM: OMAP2+: remove omap2_set_globals_control()

Juerg Haefliger (1):
      ARM: OMAP1: Remove leading spaces in Kconfig

Lukas Bulwahn (1):
      MAINTAINERS: remove obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES

Tony Lindgren (1):
      Merge branch 'omap-for-v5.13/genpd-cleanup' into omap-for-v5.14/cleanup

 MAINTAINERS                     |  6 ------
 arch/arm/mach-omap1/Kconfig     | 12 ++++++------
 arch/arm/mach-omap2/cm.h        |  1 -
 arch/arm/mach-omap2/cm_common.c | 13 -------------
 arch/arm/mach-omap2/control.c   |  5 -----
 arch/arm/mach-omap2/control.h   |  1 -
 6 files changed, 6 insertions(+), 32 deletions(-)

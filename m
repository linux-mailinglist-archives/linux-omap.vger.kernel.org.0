Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FF613F449
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 19:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436997AbgAPSsr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 13:48:47 -0500
Received: from muru.com ([72.249.23.125]:51296 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389814AbgAPSsp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Jan 2020 13:48:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A060D8125;
        Thu, 16 Jan 2020 18:49:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] soc changes for omap smc for v5.6
Date:   Thu, 16 Jan 2020 10:48:11 -0800
Message-Id: <pull-1579200367-372444@atomide.com-2>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <pull-1579200367-372444@atomide.com>
References: <pull-1579200367-372444@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4601832f40501efc3c2fd264a5a69bd1ac17d520:

  ARM: OMAP2+: use separate IOMMU pdata to fix DRA7 IPU1 boot (2019-12-17 09:57:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/soc-smc-signed

for you to fetch changes up to 8ab871f8bdfcca627802b6992e556fba5722a268:

  ARM: OMAP2+: sleep43xx: Call secure suspend/resume handlers (2020-01-13 10:06:46 -0800)

----------------------------------------------------------------
SMC related changes for omaps for v5.6 merge window

A series of changes to use optee SMC calls if optee is initialized by
the bootloader. Based on the discussions on LAKML in mailing list thread
"arm_smccc_smc as generic smc interface?" we don't want to add more quirk
handling to arm_smccc_smc() and want to handle it locally instead.

----------------------------------------------------------------
Andrew F. Davis (4):
      ARM: OMAP2+: Add omap_secure_init callback hook for secure initialization
      ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
      ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available
      ARM: OMAP2+: sleep43xx: Call secure suspend/resume handlers

 arch/arm/mach-omap2/common.h      |  2 +-
 arch/arm/mach-omap2/io.c          | 11 +++++++++
 arch/arm/mach-omap2/omap-secure.c | 50 +++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h | 10 ++++++++
 arch/arm/mach-omap2/omap-smc.S    |  6 ++---
 arch/arm/mach-omap2/pm33xx-core.c | 24 +++++++++++++++++++
 6 files changed, 99 insertions(+), 4 deletions(-)

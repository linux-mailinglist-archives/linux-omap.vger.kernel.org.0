Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD28564E71
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jul 2022 09:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbiGDHLt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jul 2022 03:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbiGDHLh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Jul 2022 03:11:37 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72320334
        for <linux-omap@vger.kernel.org>; Mon,  4 Jul 2022 00:10:59 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C893B80C1;
        Mon,  4 Jul 2022 07:05:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Soc changes for omaps
Date:   Mon,  4 Jul 2022 10:10:53 +0300
Message-Id: <pull-1656918583-2801@atomide.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.20/soc-signed

for you to fetch changes up to fe71f6e1bbffb99ef28121a22a72859fb276af04:

  ARM: OMAP2+: Kconfig: Fix indentation (2022-06-28 08:50:20 +0300)

----------------------------------------------------------------
SoC changes omaps for v5.20 merge window

SoC changes omaps mostly for missing of_node_put() calls and cosmetic
Kconfig changes. These can be all merged when suitable, there is no urgent
need to merge this as fixes.

----------------------------------------------------------------
Juerg Haefliger (1):
      ARM: OMAP2+: Kconfig: Fix indentation

Liang He (2):
      ARM: OMAP2+: display: Fix refcount leak bug
      ARM: OMAP2+: pdata-quirks: Fix refcount leak bug

Miaoqian Lin (2):
      ARM: OMAP2+: Fix refcount leak in omapdss_init_of
      ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init

 arch/arm/mach-omap2/Kconfig        | 6 +++---
 arch/arm/mach-omap2/display.c      | 3 +++
 arch/arm/mach-omap2/pdata-quirks.c | 2 ++
 arch/arm/mach-omap2/prm3xxx.c      | 1 +
 4 files changed, 9 insertions(+), 3 deletions(-)

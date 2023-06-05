Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B0F721E17
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 08:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjFEG26 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 02:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjFEG25 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 02:28:57 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A03FCB1
        for <linux-omap@vger.kernel.org>; Sun,  4 Jun 2023 23:28:56 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5C53580C1;
        Mon,  5 Jun 2023 06:28:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Clean-up for omaps for v6.5
Date:   Mon,  5 Jun 2023 09:28:53 +0300
Message-ID: <pull-1685946511-835910@atomide.com>
X-Mailer: git-send-email 2.41.0
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

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/cleanup-signed

for you to fetch changes up to 937e87229ea04e94c4f1a2f3f5ae9d2c56989acd:

  ARM: omap2: Fix checkpatch issues (2023-06-02 12:33:48 +0300)

----------------------------------------------------------------
Clean-up for omaps for v6.5

Two patches for checkpatch warnings, and one change to use pr_err instead
of printk.

----------------------------------------------------------------
Franziska Naepelt (2):
      ARM: omap: Fix checkpatch issues
      ARM: omap2: Fix checkpatch issues

Prathu Baronia (1):
      arm: omap1: replace printk() with pr_err macro

 arch/arm/mach-omap1/pm.c                   |  2 +-
 arch/arm/mach-omap1/sram-init.c            |  2 +-
 arch/arm/mach-omap2/omap-wakeupgen.c       |  1 +
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 11 +++++------
 arch/arm/mach-omap2/omap_phy_internal.c    | 12 ++++++------
 arch/arm/mach-omap2/sdrc2xxx.c             |  2 --
 arch/arm/mach-omap2/sram.c                 |  4 ++--
 arch/arm/mach-omap2/ti81xx-restart.c       |  3 ++-
 8 files changed, 18 insertions(+), 19 deletions(-)

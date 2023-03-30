Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E706D0524
	for <lists+linux-omap@lfdr.de>; Thu, 30 Mar 2023 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjC3Mpe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Mar 2023 08:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjC3Mpe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Mar 2023 08:45:34 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CAA97A6
        for <linux-omap@vger.kernel.org>; Thu, 30 Mar 2023 05:45:31 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 488B180FE;
        Thu, 30 Mar 2023 12:45:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Clean-up for omaps for v6.4
Date:   Thu, 30 Mar 2023 15:45:22 +0300
Message-Id: <pull-1680180293-92168@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/cleanup-signed

for you to fetch changes up to 19050da1d1057a7bc73fd9039f94b7f63a00e54e:

  ARM: OMAP2+: hwmod: Use kzalloc for allocating only one element (2023-03-28 08:45:55 +0300)

----------------------------------------------------------------
Clean-up for omaps for v6.4

Some clean-up changes for omaps mostly to use of_property_read_bool() and
of_address_to_resource(). Also included is removal for an obsolete Kconfig
option, a typo fix, a return path change for am33xx_suspend_init(), and a
change to use kzalloc instead of kcalloc for a single element.

----------------------------------------------------------------
Jilin Yuan (1):
      ARM: OMAP2+: fix repeated words in comments

Kenneth Lee (1):
      ARM: OMAP2+: hwmod: Use kzalloc for allocating only one element

Lukas Bulwahn (1):
      ARM: OMAP2+: remove obsolete config OMAP3_SDRC_AC_TIMING

Rob Herring (2):
      ARM: OMAP2+: Use of_property_read_bool() for boolean properties
      ARM: OMAP2+: Use of_address_to_resource()

ye xingchen (1):
      ARM: OMAP2+: Remove the unneeded result variable

 arch/arm/mach-omap2/Kconfig       | 11 -----------
 arch/arm/mach-omap2/cm33xx.c      |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c  | 23 ++++++++++-------------
 arch/arm/mach-omap2/pm33xx-core.c |  6 +-----
 4 files changed, 12 insertions(+), 30 deletions(-)

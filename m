Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2EE77744B
	for <lists+linux-omap@lfdr.de>; Thu, 10 Aug 2023 11:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbjHJJTw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Aug 2023 05:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbjHJJT1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Aug 2023 05:19:27 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22C1F49FC
        for <linux-omap@vger.kernel.org>; Thu, 10 Aug 2023 02:17:27 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E58488225;
        Thu, 10 Aug 2023 09:17:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] SoC changes for omaps for v6.6
Date:   Thu, 10 Aug 2023 12:16:53 +0300
Message-ID: <pull-1691658952-110529@atomide.com-4>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1691658952-110529@atomide.com>
References: <pull-1691658952-110529@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/soc-signed

for you to fetch changes up to 2c32e600a068b44433e7b453121ef65f4b4210cf:

  Merge branch 'omap-for-v6.5/cleanup' into omap-for-v6.6/soc (2023-08-02 10:46:07 +0300)

----------------------------------------------------------------
SoC changes for omaps for v6.6

SoC changes to include the correct devicetree headers, and an update to
make use of_range_to_resource(). There is also a non-urgent fix for
pwrdm_read_prev_pwrst() array-bounds warning.

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()

Rob Herring (2):
      ARM: omap2: Use of_range_to_resource() for "ranges" parsing
      ARM: omap2: Explicitly include correct DT includes

Tony Lindgren (1):
      Merge branch 'omap-for-v6.5/cleanup' into omap-for-v6.6/soc

 arch/arm/mach-omap2/board-generic.c |  3 +--
 arch/arm/mach-omap2/omap4-common.c  |  3 +--
 arch/arm/mach-omap2/omap_hwmod.c    | 45 +++++--------------------------------
 arch/arm/mach-omap2/powerdomain.c   |  2 +-
 4 files changed, 9 insertions(+), 44 deletions(-)

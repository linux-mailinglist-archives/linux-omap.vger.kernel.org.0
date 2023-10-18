Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C14B7CD375
	for <lists+linux-omap@lfdr.de>; Wed, 18 Oct 2023 07:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjJRFTl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Oct 2023 01:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjJRFTl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Oct 2023 01:19:41 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8CDFEA
        for <linux-omap@vger.kernel.org>; Tue, 17 Oct 2023 22:19:38 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 97BEA8027;
        Wed, 18 Oct 2023 05:19:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date:   Wed, 18 Oct 2023 08:19:34 +0300
Message-ID: <pull-1697606314-911862@atomide.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06f114cf7cbe96a07c51c47114d79e9654275919:

  Merge branches 'fixes-mapphone' and 'fixes-ti-sysc' into fixes (2023-09-13 11:11:11 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-fixes-audio-clock-and-modem-signed

for you to fetch changes up to 0b9a4a67c60d3e15b39a69d480a50ce7eeff9bc1:

  clk: ti: Fix missing omap5 mcbsp functional clock and aliases (2023-10-13 11:02:02 +0300)

----------------------------------------------------------------
Few minor fixes for omaps

Regression fixes for mcbsp audio clock, and for ams-delta modem. And two
warning fixes. These all can be merged whenever and are not urgent by any
means. Feel free to defer to the merge window unless other fixes are still
pending.

----------------------------------------------------------------
Dan Carpenter (1):
      ARM: omap2: fix a debug printk

Janusz Krzysztofik (1):
      ARM: OMAP1: ams-delta: Fix MODEM initialization failure

Randy Dunlap (1):
      ARM: OMAP: timer32K: fix all kernel-doc warnings

Tony Lindgren (2):
      clk: ti: Fix missing omap4 mcbsp functional clock and aliases
      clk: ti: Fix missing omap5 mcbsp functional clock and aliases

 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi |  6 +++
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi     |  2 +
 arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi |  6 +++
 arch/arm/mach-omap1/board-ams-delta.c       | 60 ++++++++---------------------
 arch/arm/mach-omap1/timer32k.c              | 14 +++----
 arch/arm/mach-omap2/omap_hwmod.c            |  2 +-
 drivers/clk/ti/clk-44xx.c                   |  5 +++
 drivers/clk/ti/clk-54xx.c                   |  4 ++
 8 files changed, 47 insertions(+), 52 deletions(-)

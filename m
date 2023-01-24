Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768F3679927
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jan 2023 14:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbjAXNWF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Jan 2023 08:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbjAXNWE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Jan 2023 08:22:04 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D6995258
        for <linux-omap@vger.kernel.org>; Tue, 24 Jan 2023 05:22:04 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C891D8125;
        Tue, 24 Jan 2023 13:22:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Clean-up for omamps for v6.3
Date:   Tue, 24 Jan 2023 15:21:56 +0200
Message-Id: <pull-1674566471-434733@atomide.com-2>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <pull-1674566471-434733@atomide.com>
References: <pull-1674566471-434733@atomide.com>
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

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.3/cleanup-signed

for you to fetch changes up to 5fc1f76a85ce50b501b1d2ef04a29bc79910807d:

  ARM: OMAP2+: Fix spelling typos in comment (2023-01-19 12:19:39 +0200)

----------------------------------------------------------------
Clean-up for omaps for v6.3

Non-urgent fixes for missing of_node_put() and clk_put(), drop few
unnecessary includes, and fix a typo. None of these are urgent and
can be merged along with other clean-up when suitable.

----------------------------------------------------------------
Chen Hui (1):
      ARM: OMAP2+: Fix memory leak in realtime_counter_init()

Geert Uytterhoeven (2):
      ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/pinmux.h>
      ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/machine.h>

Liang He (1):
      ARM: OMAP2+: omap4-common: Fix refcount leak bug

Nir Levy (1):
      ARM: OMAP2+: Fix spelling typos in comment

 arch/arm/mach-omap2/devices.c      | 1 -
 arch/arm/mach-omap2/omap4-common.c | 1 +
 arch/arm/mach-omap2/pm33xx-core.c  | 1 -
 arch/arm/mach-omap2/sleep34xx.S    | 2 +-
 arch/arm/mach-omap2/timer.c        | 1 +
 5 files changed, 3 insertions(+), 3 deletions(-)

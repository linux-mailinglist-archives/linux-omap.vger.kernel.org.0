Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649BD638526
	for <lists+linux-omap@lfdr.de>; Fri, 25 Nov 2022 09:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKYIXR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Nov 2022 03:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKYIXQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Nov 2022 03:23:16 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 245C3303FC
        for <linux-omap@vger.kernel.org>; Fri, 25 Nov 2022 00:23:16 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C3D5380CD;
        Fri, 25 Nov 2022 08:23:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree related musb changes for omap3 for v6.2
Date:   Fri, 25 Nov 2022 10:23:12 +0200
Message-Id: <pull-1669364566-84575@atomide.com>
X-Mailer: git-send-email 2.38.1
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/musb-for-v6.2-signed

for you to fetch changes up to 42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977:

  ARM: OMAP2+: Drop legacy hwmod data for omap3 otg (2022-11-22 13:25:20 +0200)

----------------------------------------------------------------
Devicetree related musb changes for omap3 for v6.2

Recent musb driver regressions eposed two issues for musb legacy
probing. The changes to use device_set_of_node_from_dev() confuse
the legacy interconnect code. And we now have to manually populate
the musb core irq resources.

The musb driver has a fix for these, but it's not a good long term
solution. To fix the issue properly, let's just update musb to
probe with ti-sysc interconnect driver with proper devicetree data.
This allows dropping most of the musb driver workaround later on.
And with these changes we have the omap2430 musb glue layer behaving
the same way for all the SoCs using it.

We need to patch the ti-sysc driver quirks, and add devicetree
data to make things work. And we want to drop the legacy data too
to avoid pointless warnings.

As we have a musb driver workaround, these changes are not needed as
fixes and can wait for the merge window.

----------------------------------------------------------------
Tony Lindgren (3):
      bus: ti-sysc: Add otg quirk flags for omap3 musb
      ARM: dts: Update omap3 musb to probe with ti-sysc
      ARM: OMAP2+: Drop legacy hwmod data for omap3 otg

 arch/arm/boot/dts/am3517.dtsi              | 38 +++++++++---
 arch/arm/boot/dts/omap3.dtsi               | 40 +++++++++---
 arch/arm/boot/dts/omap34xx.dtsi            |  4 ++
 arch/arm/boot/dts/omap36xx.dtsi            |  4 ++
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 99 ------------------------------
 drivers/bus/ti-sysc.c                      |  6 ++
 6 files changed, 75 insertions(+), 116 deletions(-)

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E482E4C0E9F
	for <lists+linux-omap@lfdr.de>; Wed, 23 Feb 2022 09:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239113AbiBWI4S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Feb 2022 03:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiBWI4P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Feb 2022 03:56:15 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C25FA7C170
        for <linux-omap@vger.kernel.org>; Wed, 23 Feb 2022 00:55:48 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A3EA180A4;
        Wed, 23 Feb 2022 08:54:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date:   Wed, 23 Feb 2022 10:55:39 +0200
Message-Id: <pull-1645606483-876944@atomide.com>
X-Mailer: git-send-email 2.35.1
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

The following changes since commit 486343d3728be741db13854dc7e983c20cdd7c07:

  Merge tag 'omap-for-v5.17/fixes-for-merge-window-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/fixes (2022-02-07 17:42:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.17/fixes-signed

for you to fetch changes up to 8840f5460a23759403f1f2860429dcbcc2f04a65:

  ARM: dts: Use 32KiHz oscillator on devkit8000 (2022-02-18 10:08:45 +0200)

----------------------------------------------------------------
Fixes for omaps

Fixes for devkit8000 timer regression. Similar to the earlier beagleboard
fixes, we must not configure the clocksource drivers to use an alternative
timer configuration. It causes unnecessary issues with power management.
Only some old designs based on early beagleboard revisions with a miswired
timer need to use the alternative timer.

----------------------------------------------------------------
Anthoine Bourgeois (2):
      ARM: dts: switch timer config to common devkit8000 devicetree
      ARM: dts: Use 32KiHz oscillator on devkit8000

 arch/arm/boot/dts/omap3-devkit8000-common.dtsi | 18 ++++++++++++++
 arch/arm/boot/dts/omap3-devkit8000.dts         | 33 --------------------------
 drivers/clocksource/timer-ti-dm-systimer.c     |  3 +--
 3 files changed, 19 insertions(+), 35 deletions(-)

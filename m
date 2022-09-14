Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E777D5B820B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 09:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiINHcX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 03:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiINHcW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 03:32:22 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F374B6FA38
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 00:32:20 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6567C80F0;
        Wed, 14 Sep 2022 07:24:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] SoC fixes for omaps
Date:   Wed, 14 Sep 2022 10:32:16 +0300
Message-Id: <pull-1663140667-273537@atomide.com>
X-Mailer: git-send-email 2.37.1
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

The following changes since commit 0b3acd1cc0222953035d18176b1e4aa06624fd6e:

  Merge tag 'driver-core-6.0-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core (2022-09-02 10:55:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-6.0/fixes-signed

for you to fetch changes up to 2a906db2824b75444982f5e9df870106982afca8:

  Merge branch 'am5748-fix' into fixes (2022-09-06 09:45:27 +0300)

----------------------------------------------------------------
Two fixes for omaps

A fix to remove usb4 from am5748 as it does not exist on the SoC, and
a fix for am335x mmc dma that wired direct and should not use the xbar.

Note that the am5748 fix depends on the recent deferred probe regression
fixes to boot. I ended up picking the merge commit to base it on as it
describes what got fixed quite nicely rather than a -rc tag.

----------------------------------------------------------------
Romain Naour (1):
      ARM: dts: am5748: keep usb4_tm disabled

Tony Lindgren (1):
      Merge branch 'am5748-fix' into fixes

YuTong Chang (1):
      ARM: dts: am33xx: Fix MMCHS0 dma properties

 arch/arm/boot/dts/am33xx-l4.dtsi | 3 +--
 arch/arm/boot/dts/am5748.dtsi    | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

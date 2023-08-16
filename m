Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9767D77D95B
	for <lists+linux-omap@lfdr.de>; Wed, 16 Aug 2023 06:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjHPECv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Aug 2023 00:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241743AbjHPECs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Aug 2023 00:02:48 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 14ADA1FC3
        for <linux-omap@vger.kernel.org>; Tue, 15 Aug 2023 21:02:46 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7F90280BB;
        Wed, 16 Aug 2023 04:02:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date:   Wed, 16 Aug 2023 07:02:41 +0300
Message-ID: <pull-1692158536-457318@atomide.com>
X-Mailer: git-send-email 2.41.0
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/fixes-signed

for you to fetch changes up to 7aff940ec88658f7fd21137cf515956a7deaaf54:

  ARM: dts: am335x-bone-common: Add vcc-supply for on-board eeprom (2023-08-14 13:27:19 +0300)

----------------------------------------------------------------
Fixes for omaps

A fix external abort on non-linefetch for am335x that is fixed with a flush
of posted write. And two networking fixes for beaglebone mostly for revision
c3 to do phy reset with a gpio and to fix a boot time warning.

----------------------------------------------------------------
Shengyu Qu (2):
      ARM: dts: am335x-bone-common: Add GPIO PHY reset on revision C3 board
      ARM: dts: am335x-bone-common: Add vcc-supply for on-board eeprom

Tony Lindgren (2):
      bus: ti-sysc: Flush posted write on enable before reset
      Merge branch 'omap-for-v6.5/ti-sysc' into omap-for-v6.5/fixes

 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 9 +++++++++
 drivers/bus/ti-sysc.c                             | 2 ++
 2 files changed, 11 insertions(+)

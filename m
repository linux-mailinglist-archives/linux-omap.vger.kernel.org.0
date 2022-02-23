Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A30D4C0EAA
	for <lists+linux-omap@lfdr.de>; Wed, 23 Feb 2022 09:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239121AbiBWI7U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Feb 2022 03:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239118AbiBWI7T (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Feb 2022 03:59:19 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C48A57C7B4
        for <linux-omap@vger.kernel.org>; Wed, 23 Feb 2022 00:58:52 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8F6F780A4;
        Wed, 23 Feb 2022 08:57:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v5.18
Date:   Wed, 23 Feb 2022 10:58:47 +0200
Message-Id: <pull-1645606669-127734@atomide.com>
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.18/dt-signed

for you to fetch changes up to 668e2f58ed8b1920143ea1072ad8d02440132306:

  ARM: dts: am335x-sancloud-bbe-extended-wifi: New devicetree (2022-02-18 10:33:15 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.18

Devicetree changes for omaps for v5.18:

- The devicetree node naming for pdu001 RTC name gets corrected

- For logicpd-torpedo baseboard, isp1763 USB controller gets added

- New board variant for SanCloud BBE Extended WiFi gets added

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: logicpd-torpedo: Add isp1763 support to baseboard

Paul Barker (1):
      ARM: dts: am335x-sancloud-bbe-extended-wifi: New devicetree

Thierry Reding (1):
      ARM: dts: am334x: pdu001: Use correct node name for RTC

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/am335x-pdu001.dts                |   2 +-
 .../boot/dts/am335x-sancloud-bbe-extended-wifi.dts | 113 +++++++++++++++++++++
 arch/arm/boot/dts/logicpd-torpedo-35xx-devkit.dts  |   8 ++
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts  |   9 ++
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   |  41 +++++++-
 6 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts

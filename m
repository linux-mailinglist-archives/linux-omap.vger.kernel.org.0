Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731E85BCAF6
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 13:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiISLmo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 07:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiISLmn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 07:42:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00D672B191
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 04:42:41 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 21C488050;
        Mon, 19 Sep 2022 11:34:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps
Date:   Mon, 19 Sep 2022 14:42:37 +0300
Message-Id: <pull-1663587735-853102@atomide.com>
X-Mailer: git-send-email 2.37.1
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

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-6.1/dt-signed

for you to fetch changes up to 8e9d75fd2ec2ad6c7b19dbafe1be966fd13e0f1d:

  ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices (2022-09-07 08:18:45 +0300)

----------------------------------------------------------------
Devicetree changes for omaps

A series of changes for am335x baltos and netcom devices to update nand
transfer type and configure gpio-line-names.

----------------------------------------------------------------
Yegor Yefremov (6):
      ARM: dts: am335x-baltos: change nand-xfer-type
      ARM: dts: am335x-baltos: add GPIO names for ir3220 and ir5221 devices
      ARM: dts: am335x-baltos: add GPIO names for ir2110 device
      ARM: dts: am335x-netcan: add GPIO names for NetCAN Plus device
      ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 8-port devices
      ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices

 arch/arm/boot/dts/am335x-baltos-ir2110.dts   | 144 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir3220.dts   | 148 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir5221.dts   | 148 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos.dtsi         |   2 +-
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts | 144 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts | 144 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts | 156 +++++++++++++++++++++++++++
 7 files changed, 885 insertions(+), 1 deletion(-)

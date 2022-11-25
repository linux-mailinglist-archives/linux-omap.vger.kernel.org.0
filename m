Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284716384FB
	for <lists+linux-omap@lfdr.de>; Fri, 25 Nov 2022 09:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiKYIIv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Nov 2022 03:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiKYIIt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Nov 2022 03:08:49 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0636B1CFF2
        for <linux-omap@vger.kernel.org>; Fri, 25 Nov 2022 00:08:45 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7882C80CD;
        Fri, 25 Nov 2022 08:08:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree fixes for omaps for v6.2
Date:   Fri, 25 Nov 2022 10:08:42 +0200
Message-Id: <pull-1669363695-856423@atomide.com>
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

The following changes since commit 8950f345a67d8046d2472dd6ea81fa18ef5b4844:

  ARM: dts: am335x-pcm-953: Define fixed regulators in root node (2022-11-09 10:09:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.2/dt-signed

for you to fetch changes up to 4f15fc7c0f28ffcd6e9a56396db6edcdfa4c9925:

  ARM: dts: Unify pwm-omap-dmtimer node names (2022-11-22 14:15:09 +0200)

----------------------------------------------------------------
Devicetree fixes for omaps for v6.2

Two devicetree fixes for omaps. These fixes are not urgent and
can wait for the merge window:

- Fix up the node names and missing #pwm-cells property for
  ti,omap-dmtimer-pwm to avoid warnings when the the related
  yaml binding gets merged

- Fix TDA998x port addressing

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: am335x: Fix TDA998x ports addressing

Tony Lindgren (1):
      ARM: dts: Unify pwm-omap-dmtimer node names

 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi     | 7 ++++++-
 arch/arm/boot/dts/am335x-guardian.dts            | 3 ++-
 arch/arm/boot/dts/am335x-myirtech-myd.dts        | 7 ++++++-
 arch/arm/boot/dts/am3517-evm.dts                 | 2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi  | 4 ++--
 arch/arm/boot/dts/omap3-gta04.dtsi               | 2 +-
 arch/arm/boot/dts/omap3-n900.dts                 | 2 +-
 8 files changed, 20 insertions(+), 9 deletions(-)

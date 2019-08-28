Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4DEA0995
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfH1SfA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:35:00 -0400
Received: from muru.com ([72.249.23.125]:59018 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfH1SfA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 14:35:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B6BB48162;
        Wed, 28 Aug 2019 18:35:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] sgx soc glue changes for omaps for v5.4
Date:   Wed, 28 Aug 2019 11:34:52 -0700
Message-Id: <pull-1567016893-318461@atomide.com-4>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <pull-1567016893-318461@atomide.com>
References: <pull-1567016893-318461@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 7edd00f71f4b91ca31dbfa08926495fe5e77aab4:

  bus: ti-sysc: Detect d2d when debug is enabled (2019-08-26 08:33:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/ti-sysc-sgx-signed

for you to fetch changes up to 6cb0ac0fb9786d01f140dcfcd3d09ce850dd0a64:

  ARM: dts: ARM: dts: Configure interconnect target module for am3517sgx (2019-08-26 08:47:09 -0700)

----------------------------------------------------------------
SoC glue layer changes for SGX on omap variants for v5.4

For a while we've had omap4 sgx glue layer defined in dts and probed
with ti-sysc driver. This allows idling the sgx module for PM, and
removes the need for custom platform glue layer code for any further
driver changes.

We first drop the unused legacy platform data for omap4 sgx. Then for
omap5, we need add the missing clkctrl clock data so we can configure
sgx. And we configure sgx for omap34xx, omap36xx and am3517.

For am335x, we still have a dependency for rstctrl reset driver changes,
so that will be added later on.

Note that this branch is based on earlier ti-sysc branch for omap36xx
glue layer quirk handling.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: ARM: dts: Configure interconnect target module for am3517sgx

Tony Lindgren (4):
      ARM: OMAP2+: Drop legacy platform data for omap4 gpu
      clk: ti: add clkctrl data omap5 sgx
      ARM: dts: Configure sgx for omap5
      ARM: dts: Configure interconnect target module for omap3 sgx

 arch/arm/boot/dts/am3517.dtsi              | 24 ++++++++++++++
 arch/arm/boot/dts/omap34xx.dtsi            | 26 +++++++++++++++
 arch/arm/boot/dts/omap36xx.dtsi            | 28 ++++++++++++++++
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/boot/dts/omap5.dtsi               | 23 +++++++++++++
 arch/arm/boot/dts/omap54xx-clocks.dtsi     | 14 ++++++++
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 53 ------------------------------
 drivers/clk/ti/clk-54xx.c                  | 34 +++++++++++++++++++
 include/dt-bindings/clock/omap5.h          |  3 ++
 9 files changed, 152 insertions(+), 54 deletions(-)

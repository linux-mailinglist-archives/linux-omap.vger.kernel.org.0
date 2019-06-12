Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0BC41D78
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 09:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407344AbfFLHSm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 03:18:42 -0400
Received: from muru.com ([72.249.23.125]:52854 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406388AbfFLHSm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Jun 2019 03:18:42 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 27B7980E2;
        Wed, 12 Jun 2019 07:19:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] three fixes for omaps
Date:   Wed, 12 Jun 2019 00:18:39 -0700
Message-Id: <pull-1560323885-602179@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4ee23cd76c0ce8622976b3da0e2bc89e6d94f6d4:

  Merge branch 'omap-for-v5.2/ti-sysc' into fixes (2019-05-20 08:33:03 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/fixes-rc4

for you to fetch changes up to 8a0098c05a272c9a68f6885e09755755b612459c:

  ARM: dts: am335x phytec boards: Fix cd-gpios active level (2019-06-10 00:06:57 -0700)

----------------------------------------------------------------
Fixes for omap variants

Three fixes mostly for dra7 SoC variants that have some devices disabled
compared to the base SoC. These got broken by the change of making devices
probe with ti-sysc interconnect target module and went unnnoticed for a
while. And there is no clkcel bit for timer12 unlike timer1. Also included
is a GPIO direction fix for phytec SDIO card detection.

----------------------------------------------------------------
Keerthy (1):
      ARM: dts: dra72x: Disable usb4_tm target module

Teresa Remmet (1):
      ARM: dts: am335x phytec boards: Fix cd-gpios active level

Tony Lindgren (1):
      ARM: dts: Drop bogus CLKSEL for timer12 on dra7

 arch/arm/boot/dts/am335x-pcm-953.dtsi | 2 +-
 arch/arm/boot/dts/am335x-wega.dtsi    | 2 +-
 arch/arm/boot/dts/dra7-l4.dtsi        | 2 --
 arch/arm/boot/dts/dra72x.dtsi         | 4 ++++
 4 files changed, 6 insertions(+), 4 deletions(-)

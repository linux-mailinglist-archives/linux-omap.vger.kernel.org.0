Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 100EDDCB5A
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443105AbfJRQcd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:33 -0400
Received: from muru.com ([72.249.23.125]:38112 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2443108AbfJRQca (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 47121809F;
        Fri, 18 Oct 2019 16:33:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 00/10] Drop even more legacy platform data for omaps
Date:   Fri, 18 Oct 2019 09:32:10 -0700
Message-Id: <20191018163220.3504-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

This series of changes remove even more legacy platform data and
ti,hwmods devitree property for omap variants.

The patches are against v5.4-rc1 on top of the previous set:

[PATCH 00/21] Drop more legacy platform data for omaps

Please note that the earlier watchdog changes depend on the following
patch:

[PATCH] bus: ti-sysc: Fix watchdog quirk handling

Regards,

Tony


Tony Lindgren (10):
  ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp
  ARM: OMAP2+: Drop legacy platform data for omap5 mcbsp
  ARM: OMAP2+: Drop legacy platform data for am4 hdq1w
  ARM: OMAP2+: Drop legacy platform data for dra7 hdq1w
  ARM: OMAP2+: Drop legacy platform data for omap4 hdq1w
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 rng
  ARM: OMAP2+: Drop legacy platform data for dra7 rng
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 mcasp
  ARM: OMAP2+: Drop legacy platform data for omap4 mcasp
  ARM: OMAP2+: Drop legacy platform data for musb on omap4

 arch/arm/boot/dts/am33xx-l4.dtsi              |   3 -
 arch/arm/boot/dts/am437x-l4.dtsi              |   4 -
 arch/arm/boot/dts/dra7-l4.dtsi                |   2 -
 arch/arm/boot/dts/omap4-l4-abe.dtsi           |   4 -
 arch/arm/boot/dts/omap4-l4.dtsi               |   3 -
 arch/arm/boot/dts/omap5-l4-abe.dtsi           |   3 -
 .../omap_hwmod_33xx_43xx_common_data.h        |   4 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  10 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  74 -----
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |   1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  37 ---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    | 302 ------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    | 113 -------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     |  79 -----
 14 files changed, 639 deletions(-)

-- 
2.23.0

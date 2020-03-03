Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5F0178559
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgCCWPi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:38 -0500
Received: from muru.com ([72.249.23.125]:58656 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCCWPi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EB03780EE;
        Tue,  3 Mar 2020 22:16:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 00/14] Probe EDMA with dts data for am3, am4 and dra7
Date:   Tue,  3 Mar 2020 14:15:14 -0800
Message-Id: <20200303221528.49099-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's a series of changes to configure EDMA on am3, am4 and dra7 to
probe with ti-sysc interconnect target module and device tree data.
The series also drops the old legacy platform data.

Regards,

Tony


Tony Lindgren (14):
  bus: ti-sysc: Detect EDMA and set quirk flags for tptc
  ARM: dts: Configure interconnect target module for am3 tpcc
  ARM: dts: Configure interconnect target module for am3 tptc0
  ARM: dts: Configure interconnect target module for am3 tptc1
  ARM: dts: Configure interconnect target module for am3 tptc2
  ARM: dts: Configure interconnect target module for am4 tpcc
  ARM: dts: Configure interconnect target module for am4 tptc0
  ARM: dts: Configure interconnect target module for am4 tptc1
  ARM: dts: Configure interconnect target module for am4 tptc2
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 edma
  ARM: dts: Configure interconnect target module for dra7 tpcc
  ARM: dts: Configure interconnect target module for dra7 tptc0
  ARM: dts: Configure interconnect target module for dra7 tptc1
  ARM: OMAP2+: Drop legacy platform data for dra7 edma

 arch/arm/boot/dts/am33xx.dtsi                 | 121 ++++++++++++-----
 arch/arm/boot/dts/am4372.dtsi                 | 125 +++++++++++++-----
 arch/arm/boot/dts/dra7.dtsi                   |  96 +++++++++-----
 .../omap_hwmod_33xx_43xx_common_data.h        |   8 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  32 -----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  82 ------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |   4 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |   4 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     |  88 ------------
 drivers/bus/ti-sysc.c                         |   5 +
 10 files changed, 246 insertions(+), 319 deletions(-)

-- 
2.25.1

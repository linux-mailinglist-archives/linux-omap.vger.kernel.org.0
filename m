Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23032119F26
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfLJXR0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:26 -0500
Received: from muru.com ([72.249.23.125]:45020 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXR0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:26 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DD038820B;
        Tue, 10 Dec 2019 23:18:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 00/14] Probe am3, am4 and dra7 crypto accelerators with ti-sysc
Date:   Tue, 10 Dec 2019 15:17:08 -0800
Message-Id: <20191210231722.44215-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series updates crypto accelerators to probe with ti-sysc and device tree
data for am3, am4 and dra7.

Regards,

Tony


Tony Lindgren (14):
  ARM: dts: Configure interconnect target module for am3 sham
  ARM: dts: Configure interconnect target module for am4 sham
  ARM: dts: Configure interconnect target module for dra7 sham
  ARM: dts: Configure interconnect target module for am3 aes
  ARM: dts: Configure interconnect target module for am4 aes
  ARM: dts: Configure interconnect target module for dra7 aes
  ARM: dts: Configure interconnect target module for am4 des
  ARM: dts: Configure interconnect target module for dra7 des
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 sham
  ARM: OMAP2+: Drop legacy platform data for dra7 sham
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 aes
  ARM: OMAP2+: Drop legacy platform data for dra7 aes
  ARM: OMAP2+: Drop legacy platform data for am4 des
  ARM: OMAP2+: Drop legacy platform data for dra7 des

 arch/arm/boot/dts/am33xx.dtsi                 |  69 +++++++--
 arch/arm/boot/dts/am4372.dtsi                 | 105 +++++++++++---
 arch/arm/boot/dts/dra7-l4.dtsi                |  31 ++++
 arch/arm/boot/dts/dra7.dtsi                   | 118 +++++++++++-----
 .../omap_hwmod_33xx_43xx_common_data.h        |   4 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  16 ---
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  54 -------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |   2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  35 -----
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 132 ------------------
 10 files changed, 250 insertions(+), 316 deletions(-)

-- 
2.24.0

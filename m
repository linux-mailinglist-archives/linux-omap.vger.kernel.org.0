Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE138213D42
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jul 2020 18:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgGCQHn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jul 2020 12:07:43 -0400
Received: from muru.com ([72.249.23.125]:60612 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCQHn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 Jul 2020 12:07:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B794B806C;
        Fri,  3 Jul 2020 16:08:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/3] Simplify PM for am3/4, drop RTC pdata for am3/4/dra7
Date:   Fri,  3 Jul 2020 09:07:28 -0700
Message-Id: <20200703160731.53698-1-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are patches to simplify the RTC+DDR PM code for am3 and am4. We want
to do this to drop the RTC related legacy platform data for am3 and am4.
We also drop RTC legacy platform data for dra7.

Please test the RTC+DDR suspend on am437x-gp-evm if possible. I've tested
this series on am437x-sk-evm, but at least currently cannot do RTC+DDR
suspend and is limited to testing retention suspend only.

These patches depend on v5.8-rc3 for earlier suspend and resume related
fixes.

Additionally, for testing the LCD for suspend, the following patch is
needed for the missing omapdrm PM ops:

drm/omap: force runtime PM suspend on system suspend

Regards,

Tony


Tony Lindgren (3):
  soc: ti: pm33xx: Simplify RTC usage to prepare to drop platform data
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 rtc
  ARM: OMAP2+: Drop legacy platform data for dra7 rtcss

 arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  3 +-
 arch/arm/boot/dts/am43x-epos-evm.dts          |  4 ++
 arch/arm/boot/dts/dra7-l4.dtsi                |  1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 ----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 37 ---------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  8 ----
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 44 -----------------
 arch/arm/mach-omap2/pm33xx-core.c             | 25 ----------
 drivers/soc/ti/pm33xx.c                       | 47 +++++++++++++++++--
 include/linux/platform_data/pm33xx.h          |  3 --
 13 files changed, 47 insertions(+), 137 deletions(-)

-- 
2.27.0

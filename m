Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4004F716F0
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 13:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731276AbfGWL2U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 07:28:20 -0400
Received: from muru.com ([72.249.23.125]:55608 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730217AbfGWL2U (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 07:28:20 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5C77A808C;
        Tue, 23 Jul 2019 11:28:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] ti-sysc related warning fixes for v5.3-rc cycle
Date:   Tue, 23 Jul 2019 04:28:03 -0700
Message-Id: <20190723112811.44381-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

I noticed that with recent ti-sysc driver changes some new warnings
have crept in. Mostly they are caused by having different configuration
in the dts compared to the legacy platform data. Let's fix these first
before we continue dropping the legacy platform data.

I also noticed we need two fixes for the ti-sysc driver while looking
at the warnings.

Regards,

Tony

Tony Lindgren (8):
  ARM: OMAP2+: Fix missing SYSC_HAS_RESET_STATUS for dra7 epwmss
  ARM: OMAP2+: Remove unconfigured midlemode for am3 lcdc
  bus: ti-sysc: Fix handling of forced idle
  bus: ti-sysc: Fix using configured sysc mask value
  ARM: dts: Drop bogus ahclkr clocks for dra7 mcasp 3 to 8
  ARM: dts: Fix flags for gpio7
  ARM: dts: Fix incorrect dcan register mapping for am3, am4 and dra7
  ARM: dts: Fix lcdc sysc flags for am3

 arch/arm/boot/dts/am33xx-l4.dtsi              |  6 +++-
 arch/arm/boot/dts/am437x-l4.dtsi              |  4 +++
 .../boot/dts/am57xx-beagle-x15-common.dtsi    |  2 +-
 arch/arm/boot/dts/dra7-evm.dts                |  2 +-
 arch/arm/boot/dts/dra7-l4.dtsi                | 31 ++++++++-----------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  2 +-
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     |  3 +-
 drivers/bus/ti-sysc.c                         | 10 +++---
 8 files changed, 31 insertions(+), 29 deletions(-)

-- 
2.21.0

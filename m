Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D991DF774
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 23:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfJUVaQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 17:30:16 -0400
Received: from muru.com ([72.249.23.125]:38776 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727264AbfJUVaQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 17:30:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E154F80CC;
        Mon, 21 Oct 2019 21:30:49 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/3] Probe am335x musb with ti-sysc and drop platform data
Date:   Mon, 21 Oct 2019 14:30:08 -0700
Message-Id: <20191021213011.29110-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

This series of changes updates am335x musb to probe with ti-sysc interconnect
target module driver, removes some unnecessary board specific boiler plate,
and then drops the legacy platform data for musb.

Note that this patch depends on the following two patches:

[PATCH] bus: ti-sysc: Handle mstandby quirk and use it for musb
[PATCH] bus: ti-sysc: Use swsup quirks also for am335x musb

Regards,

Tony


Tony Lindgren (3):
  ARM: dts: Probe am335x musb with ti-sysc
  ARM: dts: Drop pointless status changing for am3 musb
  ARM: OMAP2+: Drop legacy platform data for am335x musb

 arch/arm/boot/dts/am335x-baltos.dtsi          | 12 ----
 arch/arm/boot/dts/am335x-bone-common.dtsi     | 22 -------
 arch/arm/boot/dts/am335x-boneblue.dts         | 22 -------
 arch/arm/boot/dts/am335x-chiliboard.dts       | 18 -----
 arch/arm/boot/dts/am335x-cm-t335.dts          | 20 ------
 arch/arm/boot/dts/am335x-evm.dts              | 25 -------
 arch/arm/boot/dts/am335x-evmsk.dts            | 25 -------
 arch/arm/boot/dts/am335x-guardian.dts         | 22 -------
 arch/arm/boot/dts/am335x-igep0033.dtsi        | 25 -------
 arch/arm/boot/dts/am335x-lxm.dts              | 22 -------
 .../boot/dts/am335x-moxa-uc-2100-common.dtsi  | 17 -----
 .../arm/boot/dts/am335x-moxa-uc-8100-me-t.dts | 22 -------
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts   | 22 -------
 arch/arm/boot/dts/am335x-pcm-953.dtsi         | 25 -------
 arch/arm/boot/dts/am335x-pdu001.dts           | 28 --------
 arch/arm/boot/dts/am335x-pepper.dts           | 20 ------
 arch/arm/boot/dts/am335x-pocketbeagle.dts     | 22 -------
 arch/arm/boot/dts/am335x-regor.dtsi           | 21 ------
 arch/arm/boot/dts/am335x-shc.dts              | 17 -----
 arch/arm/boot/dts/am335x-sl50.dts             | 22 -------
 arch/arm/boot/dts/am335x-wega.dtsi            | 26 --------
 arch/arm/boot/dts/am33xx-l4.dtsi              |  7 ++
 arch/arm/boot/dts/am33xx.dtsi                 | 66 +++++++++----------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    | 44 -------------
 24 files changed, 39 insertions(+), 533 deletions(-)

-- 
2.23.0

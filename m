Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E013862F2C4
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 11:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbiKRKmm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 05:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiKRKmk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 05:42:40 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 457FC97082
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 02:42:39 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3F759807E;
        Fri, 18 Nov 2022 10:32:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Sicelo Mhlongo <absicsz@gmail.com>
Subject: [PATCH 0/3] Update musb to probe with ti-sysc for omap3
Date:   Fri, 18 Nov 2022 12:42:23 +0200
Message-Id: <20221118104226.46223-1-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

After fixing the probe issues with [0], let's update omap3 to use ti-sysc
for musb so the driver behaves the same way for all the SoCs.

Regards,

Tony

[0] https://lore.kernel.org/linux-usb/20221118102532.34458-1-tony@atomide.com/T/#u

Tony Lindgren (3):
  bus: ti-sysc: Add otg quirk flags for omap3 musb
  ARM: dts: Update omap3 musb to probe with ti-sysc
  ARM: OMAP2+: Drop legacy hwmod data for omap3 otg

 arch/arm/boot/dts/am3517.dtsi              | 38 +++++++--
 arch/arm/boot/dts/omap3.dtsi               | 40 +++++++--
 arch/arm/boot/dts/omap34xx.dtsi            |  4 +
 arch/arm/boot/dts/omap36xx.dtsi            |  4 +
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 99 ----------------------
 drivers/bus/ti-sysc.c                      |  6 ++
 6 files changed, 75 insertions(+), 116 deletions(-)

-- 
2.38.1

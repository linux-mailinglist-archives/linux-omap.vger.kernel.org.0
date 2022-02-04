Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DDA4A9557
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 09:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346200AbiBDIn5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 03:43:57 -0500
Received: from muru.com ([72.249.23.125]:46434 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240214AbiBDIn5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 03:43:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5C6F380F0;
        Fri,  4 Feb 2022 08:43:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 0/5] Unify omap4/5 clocks with clock-output-names
Date:   Fri,  4 Feb 2022 10:43:34 +0200
Message-Id: <20220204084339.12341-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series adds clock-output-names for omap4/5 in order to unify the
clock naming for omap4/5 to follow am3/4 and dra7. This makes it possible
to stop using non-standard devicetree node names for clocks in the later
patches.

This series depends on the clock related changes posted as:

[PATCH 0/8] Clock changes for TI dts reg and node name issues

Regards,

Tony


Tony Lindgren (5):
  ARM: dts: Add clock-output-names for omap4
  ARM: dts: Drop custom clkctrl compatible and update omap4 l4per
  ARM: dts: Add clock-output-names for omap5
  ARM: dts: Drop custom clkctrl compatible and update omap5 l4per
  clk: ti: Stop using legacy clkctrl names for omap4 and 5

 arch/arm/boot/dts/omap443x-clocks.dtsi |   1 +
 arch/arm/boot/dts/omap446x-clocks.dtsi |   2 +
 arch/arm/boot/dts/omap44xx-clocks.dtsi | 173 +++++++++++++++++++-
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 160 ++++++++++++++++++-
 drivers/clk/ti/clk-44xx.c              | 210 ++++++++++++-------------
 drivers/clk/ti/clk-54xx.c              | 160 +++++++++----------
 drivers/clk/ti/clkctrl.c               |   4 -
 7 files changed, 515 insertions(+), 195 deletions(-)

-- 
2.35.1

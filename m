Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432865142DD
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354919AbiD2HJn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238451AbiD2HJm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:42 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D0EF6BE9C8;
        Fri, 29 Apr 2022 00:06:23 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 62F7580B5;
        Fri, 29 Apr 2022 07:03:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 00/19] Clean-up for lots of omap dtb warnings
Date:   Fri, 29 Apr 2022 10:05:54 +0300
Message-Id: <20220429070613.62360-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

With the recent omap clock driver changes, we can clean-up lots of make
dbs warnings. We get lots of warnings for make W=1 dtbs for
unique_unit_address, and make W=2 dtbs for node_name_chars_strict.

A lot of these come from omap3 because of large amount of SoC variants
and boards. This series reduces the warnings for omaps by over 80k
warnings.

Regards,

Tony


Tony Lindgren (19):
  ARM: dts: Group omap3 CONTROL_DEVCONF0 clocks
  ARM: dts: Group omap3 CONTROL_DEVCONF1 clocks
  ARM: dts: Group omap3 CM_FCLKEN1_CORE clocks
  ARM: dts: Group omap3 crypto accelerator clocks
  ARM: dts: Group omap3 CM_ICLKEN1_CORE clocks
  ARM: dts: Group omap3 CM_ICLKEN3_CORE clocks
  ARM: dts: Group omap3 CM_CLKSEL_CORE clocks
  ARM: dts: Group omap3 CM_FCLKEN_WKUP clocks
  ARM: dts: Group omap3 CM_ICLKEN_WKUP clocks
  ARM: dts: Group omap3 CM_CLKSEL_WKUP clocks
  ARM: dts: Group omap3 CM_CLKSEL1_PLL clocks
  ARM: dts: Group omap3 CM_CLKOUT_CTRL clocks
  ARM: dts: Group omap3 CM_FCLKEN_DSS clocks
  ARM: dts: Group omap3 CM_CLKSEL_DSS clocks
  ARM: dts: Group omap3 CM_FCLKEN_CAM clocks
  ARM: dts: Group omap3 CM_FCLKEN_PER clocks
  ARM: dts: Group omap3 CM_ICLKEN_PER clocks
  ARM: dts: Group omap3 CM_CLKSEL_PER clocks
  ARM: dts: Group omap3 CM_CLKSEL1_EMU clocks

 arch/arm/boot/dts/am35xx-clocks.dtsi          |   52 +-
 arch/arm/boot/dts/omap3430es1-clocks.dtsi     |  184 +-
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    |  275 ++-
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi |   79 +-
 arch/arm/boot/dts/omap36xx-clocks.dtsi        |   17 +-
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  |  136 +-
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 2044 +++++++++--------
 7 files changed, 1540 insertions(+), 1247 deletions(-)

-- 
2.35.2

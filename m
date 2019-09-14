Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD6B2CF5
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 23:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbfINVDE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 17:03:04 -0400
Received: from muru.com ([72.249.23.125]:32870 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfINVDE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Sep 2019 17:03:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 14B338105;
        Sat, 14 Sep 2019 21:03:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 0/7] Non-urgent fixes and improvments for omap3-rom-rng
Date:   Sat, 14 Sep 2019 14:02:53 -0700
Message-Id: <20190914210300.15836-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are fixes and improvments for omap3-rom-rng that's been broken for
a while.

The first four patches get it working, and then the last two patches add
support for runtime PM.

I did not add Sebastian's acks from v1 set as many of the patches
changed. Please review again :)

Regards,

Tony

Changes since v1:
- Use clk_prepare_enable() as pointed out by Sebastian
- Simplify runtime PM changes patch
- Add a new patch for devm changes as suggested by Sebastian


Tony Lindgren (7):
  ARM: OMAP2+: Check omap3-rom-rng for GP device instead of HS device
  hwrng: omap3-rom - Fix missing clock by probing with device tree
  hwrng: omap3-rom - Call clk_disable_unprepare() on exit only if not
    idled
  hwrng: omap3-rom - Initialize default quality to get data
  hwrng: omap3-rom - Update to use standard driver data
  hwrng: omap3-rom - Use runtime PM instead of custom functions
  hwrng: omap3-rom - Use devm hwrng and runtime PM

 .../devicetree/bindings/rng/omap3_rom_rng.txt |  27 +++
 arch/arm/boot/dts/omap3-n900.dts              |   6 +
 arch/arm/mach-omap2/pdata-quirks.c            |  14 +-
 drivers/char/hw_random/omap3-rom-rng.c        | 168 +++++++++++-------
 4 files changed, 139 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rng/omap3_rom_rng.txt

-- 
2.23.0

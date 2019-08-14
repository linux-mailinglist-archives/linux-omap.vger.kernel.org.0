Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7548D090
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 12:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfHNKUA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 06:20:00 -0400
Received: from muru.com ([72.249.23.125]:57520 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfHNKUA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 06:20:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A6F0580C8;
        Wed, 14 Aug 2019 10:20:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/3] Drop platform data for cpsw for am3/4 and dra7
Date:   Wed, 14 Aug 2019 03:19:46 -0700
Message-Id: <20190814101949.50006-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are changes to drop legacy platform data for cpsw for am3, am4
and dra7. Please review and test, I was not able to boot my beagle
x15 as it seems to have a power supply problem and have only tested
on am3 and 4.

Regards,

Tony


Tony Lindgren (3):
  ARM: dts: Add fck for cpsw mdio for omap variants
  ARM: OMAP2+: Drop legacy platform data for cpsw on am3 and am4
  ARM: OMAP2+: Drop legacy platform data for cpsw on dra7

 arch/arm/boot/dts/am33xx-l4.dtsi              |  4 +-
 arch/arm/boot/dts/am437x-l4.dtsi              |  6 +-
 arch/arm/boot/dts/dra7-l4.dtsi                |  4 +-
 .../omap_hwmod_33xx_43xx_common_data.h        |  3 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  6 --
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 50 --------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  9 ---
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  9 ---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 65 -------------------
 9 files changed, 6 insertions(+), 150 deletions(-)

-- 
2.21.0

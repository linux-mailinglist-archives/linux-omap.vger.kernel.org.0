Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C188D416
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfHNNCq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:02:46 -0400
Received: from muru.com ([72.249.23.125]:57566 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfHNNCq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:02:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4952980C8;
        Wed, 14 Aug 2019 13:03:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/5] Drop more legacy platform data for omap4
Date:   Wed, 14 Aug 2019 06:02:35 -0700
Message-Id: <20190814130240.56202-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's a series that drops more legacy platform data for omap4
for i2c, watchdogs and d2d modules.

Regards,

Tony


Tony Lindgren (5):
  ARM: dts: Drop custom hwmod property for omap4 i2c
  ARM: OMAP2+: Drop legacy watchdog platform data for omap4
  ARM: dts: Configure d2d dts data for omap4
  ARM: OMAP2+: Drop legacy platform data for omap4 d2d
  bus: ti-sysc: Detect d2d when debug is enabled

 arch/arm/boot/dts/omap4-l4-abe.dtsi        |   1 -
 arch/arm/boot/dts/omap4-l4.dtsi            |  39 +++++--
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 115 ---------------------
 drivers/bus/ti-sysc.c                      |   2 +
 4 files changed, 32 insertions(+), 125 deletions(-)

-- 
2.21.0

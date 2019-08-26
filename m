Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6864B9D54D
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbfHZSCm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:42 -0400
Received: from muru.com ([72.249.23.125]:58710 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729144AbfHZSCm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:42 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0ABEE80AA;
        Mon, 26 Aug 2019 18:03:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/6] drop more platform data for dra7
Date:   Mon, 26 Aug 2019 11:02:31 -0700
Message-Id: <20190826180237.31571-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are few more trivial changes to drop legacy platform data for dra7.

These are based on my omap-for-v5.4/ti-sysc-drop-pdata branch.

Regards,

Tony


Tony Lindgren (6):
  ARM: OMAP2+: Drop legacy platform data for dra7 mcspi
  ARM: OMAP2+: Drop legacy platform data for dra7 mcasp
  ARM: dts: Drop legacy custom hwmods property for dra7 uart
  ARM: dts: Drop legacy custom hwmods property for dra7 i2c
  ARM: dts: Drop legacy custom hwmods property for dra7 mmc
  ARM: dts: Drop legacy custom hwmods property for dra7 gpio

 arch/arm/boot/dts/dra7-l4.dtsi            |  39 --
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 410 ----------------------
 2 files changed, 449 deletions(-)

-- 
2.23.0

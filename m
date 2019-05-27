Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD912B483
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 14:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfE0MOJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 08:14:09 -0400
Received: from muru.com ([72.249.23.125]:51128 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbfE0MOI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 May 2019 08:14:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 79BD780F3;
        Mon, 27 May 2019 12:14:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 00/12] ti-sysc driver changes to drop custom hwmods property
Date:   Mon, 27 May 2019 05:13:36 -0700
Message-Id: <20190527121348.45251-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are changes to improve ti-sysc driver to the point where we can
finally drop the custom hwmods property for most cases. This series
drops hwmods property only for omap4 UART and MMC as those can be
tested with core retention idle.

I'll be posting more patches for dropping hwmods properties as they
get tested.

Regards,

Tony


Tony Lindgren (12):
  bus: ti-sysc: Support 16-bit writes too
  bus: ti-sysc: Make OCP reset work for sysstatus and sysconfig reset
    bits
  bus: ti-sysc: Allow QUIRK_LEGACY_IDLE even if legacy_mode is not set
  bus: ti-sysc: Enable interconnect target module autoidle bit on enable
  bus: ti-sysc: Handle clockactivity for enable and disable
  bus: ti-sysc: Handle swsup idle mode quirks
  bus: ti-sysc: Set ENAWAKEUP if available
  bus: ti-sysc: Add support for disabling module without legacy mode
  bus: ti-sysc: Do rstctrl reset handling in two phases
  bus: ti-sysc: Detect uarts also on omap34xx
  ARM: dts: Drop legacy custom hwmods property for omap4 uart
  ARM: dts: Drop legacy custom hwmods property for omap4 mmc

 arch/arm/boot/dts/omap4-l4.dtsi       |   9 --
 drivers/bus/ti-sysc.c                 | 182 ++++++++++++++++++++------
 include/linux/platform_data/ti-sysc.h |   1 +
 3 files changed, 140 insertions(+), 52 deletions(-)

-- 
2.21.0

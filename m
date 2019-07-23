Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3017E716FC
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 13:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389435AbfGWL2h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 07:28:37 -0400
Received: from muru.com ([72.249.23.125]:55670 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389427AbfGWL2f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 07:28:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A654F81BC;
        Tue, 23 Jul 2019 11:28:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/8] ARM: dts: Fix lcdc sysc flags for am3
Date:   Tue, 23 Jul 2019 04:28:11 -0700
Message-Id: <20190723112811.44381-9-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190723112811.44381-1-tony@atomide.com>
References: <20190723112811.44381-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The LCDC controller on am335x has a sysconfig register without a
SOFTRESET bit. Let's configure that by setting ti,sysc-mask = <0>
as otherwise we get the following warning:

ti-sysc 4830e000.target-module: idlemodes 00000087 != 00000007

And the legacy platform data has LCDC midle unconfigured so let's
remove that property.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -2038,7 +2038,7 @@
 			reg = <0xe000 0x4>,
 			      <0xe054 0x4>;
 			reg-names = "rev", "sysc";
-			ti,sysc-midle ;
+			ti,sysc-mask = <0>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>;
-- 
2.21.0

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851F933A6D2
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 17:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbhCNQsH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 12:48:07 -0400
Received: from muru.com ([72.249.23.125]:43142 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233726AbhCNQsA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 12:48:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 474E880B4;
        Sun, 14 Mar 2021 16:48:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP4: Fix PMIC voltage domains for bionic
Date:   Sun, 14 Mar 2021 18:47:56 +0200
Message-Id: <20210314164756.23286-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are now registering the mpu domain three times instead of registering
mpu, core and iva domains like we should.

Fixes: d44fa156dcb2 ("ARM: OMAP2+: Configure voltage controller for cpcap")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pmic-cpcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -246,10 +246,10 @@ int __init omap4_cpcap_init(void)
 	omap_voltage_register_pmic(voltdm, &omap443x_max8952_mpu);
 
 	if (of_machine_is_compatible("motorola,droid-bionic")) {
-		voltdm = voltdm_lookup("mpu");
+		voltdm = voltdm_lookup("core");
 		omap_voltage_register_pmic(voltdm, &omap_cpcap_core);
 
-		voltdm = voltdm_lookup("mpu");
+		voltdm = voltdm_lookup("iva");
 		omap_voltage_register_pmic(voltdm, &omap_cpcap_iva);
 	} else {
 		voltdm = voltdm_lookup("core");
-- 
2.30.2

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B85FCF9E7
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 14:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbfJHMfC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 08:35:02 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:55106 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730316AbfJHMfC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 08:35:02 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iHoha-00013Q-Mn; Tue, 08 Oct 2019 13:34:54 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iHohZ-0000Rf-W9; Tue, 08 Oct 2019 13:34:54 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@lists.codethink.co.uk,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Subject: [PATCH 07/11] ARM: OMAP2+: prm44xx: make prm_{save,restore}_context static
Date:   Tue,  8 Oct 2019 13:34:49 +0100
Message-Id: <20191008123453.1651-7-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008123453.1651-1-ben.dooks@codethink.co.uk>
References: <20191008123453.1651-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The prm_{save,restore}_context functions are not exported
so make them static to avoid the following warnings:

arch/arm/mach-omap2/prm44xx.c:748:6: warning: symbol 'prm_save_context' was not declared. Should it be static?
arch/arm/mach-omap2/prm44xx.c:759:6: warning: symbol 'prm_restore_context' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: linux-omap@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/prm44xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/prm44xx.c b/arch/arm/mach-omap2/prm44xx.c
index 1d9346f2a4ae..25093c1e5b9a 100644
--- a/arch/arm/mach-omap2/prm44xx.c
+++ b/arch/arm/mach-omap2/prm44xx.c
@@ -745,7 +745,7 @@ struct pwrdm_ops omap4_pwrdm_operations = {
 
 static int omap44xx_prm_late_init(void);
 
-void prm_save_context(void)
+static void prm_save_context(void)
 {
 	omap_prm_context.irq_enable =
 			omap4_prm_read_inst_reg(AM43XX_PRM_OCP_SOCKET_INST,
@@ -756,7 +756,7 @@ void prm_save_context(void)
 						omap4_prcm_irq_setup.pm_ctrl);
 }
 
-void prm_restore_context(void)
+static void prm_restore_context(void)
 {
 	omap4_prm_write_inst_reg(omap_prm_context.irq_enable,
 				 OMAP4430_PRM_OCP_SOCKET_INST,
-- 
2.23.0


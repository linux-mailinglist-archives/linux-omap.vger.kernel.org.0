Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A6DCF9D9
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 14:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbfJHMds (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 08:33:48 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:54885 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbfJHMds (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 08:33:48 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iHogT-0000vh-Be; Tue, 08 Oct 2019 13:33:45 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iHogS-0000Q1-Km; Tue, 08 Oct 2019 13:33:44 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-arm-kernel@lists.infraread.org
Cc:     linux-kernel@lists.codethink.co.uk,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 06/11] ARM: OMAP2+: do not export am43xx_control functions
Date:   Tue,  8 Oct 2019 13:33:36 +0100
Message-Id: <20191008123341.1551-6-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008123341.1551-1-ben.dooks@codethink.co.uk>
References: <20191008123341.1551-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Do not export am43xx_control_{save,restore}_context to avoid
the foloowing warnings:

arch/arm/mach-omap2/control.c:687:6: warning: symbol 'am43xx_control_save_context' was not declared. Should it be static?
arch/arm/mach-omap2/control.c:701:6: warning: symbol 'am43xx_control_restore_context' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
---
 arch/arm/mach-omap2/control.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/control.c b/arch/arm/mach-omap2/control.c
index c84b5e260617..73338cf80d76 100644
--- a/arch/arm/mach-omap2/control.c
+++ b/arch/arm/mach-omap2/control.c
@@ -684,7 +684,7 @@ static u32 am33xx_control_vals[ARRAY_SIZE(am43xx_control_reg_offsets)];
  *
  * Save the wkup domain registers
  */
-void am43xx_control_save_context(void)
+static void am43xx_control_save_context(void)
 {
 	int i;
 
@@ -698,7 +698,7 @@ void am43xx_control_save_context(void)
  *
  * Restore the wkup domain registers
  */
-void am43xx_control_restore_context(void)
+static void am43xx_control_restore_context(void)
 {
 	int i;
 
-- 
2.23.0


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EABD34F8D7
	for <lists+linux-omap@lfdr.de>; Wed, 31 Mar 2021 08:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbhCaGgN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 02:36:13 -0400
Received: from muru.com ([72.249.23.125]:49160 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233716AbhCaGgD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 31 Mar 2021 02:36:03 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0B6F980C3;
        Wed, 31 Mar 2021 06:37:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: OMAP2+: Fix uninitialized sr_inst
Date:   Wed, 31 Mar 2021 09:35:56 +0300
Message-Id: <20210331063556.30654-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix uninitialized sr_inst.

Fixes: fbfa463be8dc ("ARM: OMAP2+: Fix smartreflex init regression after dropping legacy data")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/sr_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/sr_device.c b/arch/arm/mach-omap2/sr_device.c
--- a/arch/arm/mach-omap2/sr_device.c
+++ b/arch/arm/mach-omap2/sr_device.c
@@ -188,7 +188,7 @@ static const char * const dra7_sr_instances[] = {
 
 int __init omap_devinit_smartreflex(void)
 {
-	const char * const *sr_inst;
+	const char * const *sr_inst = NULL;
 	int i, nr_sr = 0;
 
 	if (soc_is_omap44xx()) {
-- 
2.31.0

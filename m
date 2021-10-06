Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E87423789
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 07:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhJFFpb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 01:45:31 -0400
Received: from muru.com ([72.249.23.125]:41266 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhJFFpb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 01:45:31 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DE6C780E1;
        Wed,  6 Oct 2021 05:44:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] bus: ti-sysc: Fix variable set but not used warning for reinit_modules
Date:   Wed,  6 Oct 2021 08:43:35 +0300
Message-Id: <20211006054335.41997-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix drivers/bus/ti-sysc.c:2494:13: error: variable 'error' set but not
used introduced by commit 9d881361206e ("bus: ti-sysc: Add quirk handling
for reinit on context lost").

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2523,12 +2523,11 @@ static void sysc_reinit_modules(struct sysc_soc_info *soc)
 	struct sysc_module *module;
 	struct list_head *pos;
 	struct sysc *ddata;
-	int error = 0;
 
 	list_for_each(pos, &sysc_soc->restored_modules) {
 		module = list_entry(pos, struct sysc_module, node);
 		ddata = module->ddata;
-		error = sysc_reinit_module(ddata, ddata->enabled);
+		sysc_reinit_module(ddata, ddata->enabled);
 	}
 }
 
-- 
2.33.0

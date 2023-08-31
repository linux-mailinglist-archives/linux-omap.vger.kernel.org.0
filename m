Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D765A78F2A1
	for <lists+linux-omap@lfdr.de>; Thu, 31 Aug 2023 20:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243519AbjHaScC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Aug 2023 14:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbjHaScC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Aug 2023 14:32:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6BB63E64;
        Thu, 31 Aug 2023 11:31:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,217,1688396400"; 
   d="scan'208";a="174628364"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 03:31:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A0F87400D0C7;
        Fri,  1 Sep 2023 03:31:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/4] Match data improvements for palmas driver
Date:   Thu, 31 Aug 2023 19:31:49 +0100
Message-Id: <20230831183153.63750-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch series aims to add match data improvements for palmas driver.

This patch series is only compile tested.

v2->v3:
 * Patch#1 for removing trailing comma in the terminator entry for OF
   table.
 * Restored the OF table position and moved near to the user in patch#3.
 * Moved OF table near to the user in patch#3.
 * Updated commit description for patch#4.
v1->v2:
 * Moved the OF table just above its user.
 * Removed trailing comma from the terminator entry for the OF table.

Biju Das (4):
  mfd: palmas: Remove trailing comma in the terminator entry
  mfd: palmas: Constify .data in OF table and {palmas,tps65917}_irq_chip
  mfd: palmas: Move OF table
  mfd: palmas: Make similar OF and ID table

 drivers/mfd/palmas.c | 60 +++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 37 deletions(-)

-- 
2.25.1


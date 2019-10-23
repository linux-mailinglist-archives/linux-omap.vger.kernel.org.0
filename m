Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBFFE1221
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 08:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbfJWG3V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 02:29:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43706 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727574AbfJWG3V (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 02:29:21 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DC81D5ACD529EEF4E095;
        Wed, 23 Oct 2019 14:29:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Wed, 23 Oct 2019 14:29:00 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>
CC:     YueHaibing <yuehaibing@huawei.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] ARM: OMAP2+: Remove duplicated include from pmic-cpcap.c
Date:   Wed, 23 Oct 2019 06:29:00 +0000
Message-ID: <20191023062900.43576-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/arm/mach-omap2/pmic-cpcap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 2c2a178d988d..38b0307dc79d 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -15,8 +15,6 @@
 #include "voltage.h"
 
 #include <linux/init.h>
-#include <linux/kernel.h>
-#include "pm.h"
 #include "vc.h"
 
 /**






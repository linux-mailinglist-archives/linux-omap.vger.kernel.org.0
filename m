Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E442B2516D6
	for <lists+linux-omap@lfdr.de>; Tue, 25 Aug 2020 12:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbgHYKrU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Aug 2020 06:47:20 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41486 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgHYKrU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Aug 2020 06:47:20 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PAjKVu136657;
        Tue, 25 Aug 2020 10:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=yn0OmaXlVdIsJwcUdyYW+Kk02+g/l6M7ahIn4FwXthk=;
 b=RHPEP9kRltu6yfez+jWi1UjXRi3pvfhA636WJj9aN3Uo5IAedNdNi6gzzU/DnXTTBtXS
 X6s1KKzkKDLNpc0EHlImjWcHYSRHH57wD975Q790BZwBJ6ilAdqazL26isgMex7WvsbP
 ChTbD/RqjD9N/hSjAmmGCkNgS/WoSu2GAhZESypO4fOuz5dURx5b5VmnzABzIOgu0jlJ
 tAyVdQcrUpUrfDjzcQoZgwA2jTqggvV6pI7oUs54Ancx6NfVu/felzW2HNbbyNKjRGhg
 Nd6efXC0QTc5IcRW26lhpPd779j2rLcLnEWLqehcfkmFcUfauG2yF29aLPLjk6SXA8Lq AA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 333w6tr991-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 10:47:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PAiaA3153129;
        Tue, 25 Aug 2020 10:47:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 333rtxn0n3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 10:47:15 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07PAlEeV008592;
        Tue, 25 Aug 2020 10:47:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 Aug 2020 03:47:14 -0700
Date:   Tue, 25 Aug 2020 13:47:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Roger Quadros <rogerq@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jon Hunter <jon-hunter@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] memory: omap-gpmc: Fix a couple off by ones
Message-ID: <20200825104707.GB278587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=810 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 mlxlogscore=796 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250081
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These comparisons should be >= instead of > to prevent reading one
element beyond the end of the gpmc_cs[] array.

Fixes: cdd6928c589a ("ARM: OMAP2+: Add device-tree support for NOR flash")
Fixes: f37e4580c409 ("ARM: OMAP2: Dynamic allocator for GPMC memory space")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memory/omap-gpmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index cd9e80748591..fd245b82163a 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -989,7 +989,7 @@ static int gpmc_cs_remap(int cs, u32 base)
 	int ret;
 	u32 old_base, size;
 
-	if (cs > gpmc_cs_num) {
+	if (cs >= gpmc_cs_num) {
 		pr_err("%s: requested chip-select is disabled\n", __func__);
 		return -ENODEV;
 	}
@@ -1024,7 +1024,7 @@ int gpmc_cs_request(int cs, unsigned long size, unsigned long *base)
 	struct resource *res = &gpmc->mem;
 	int r = -1;
 
-	if (cs > gpmc_cs_num) {
+	if (cs >= gpmc_cs_num) {
 		pr_err("%s: requested chip-select is disabled\n", __func__);
 		return -ENODEV;
 	}
-- 
2.28.0


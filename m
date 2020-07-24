Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114CF22BFCF
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgGXHmp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:36624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgGXHmn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:43 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCFA820748;
        Fri, 24 Jul 2020 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576563;
        bh=q3j/pctKuGz1PK+SF65LyM0Wzy/rnfsCYc63Wa9bVUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1SbShUFsrFSezguh0KZ4msnaWbrWbFmyooWVoPuSdMhr4/GJgtOqtQ8AzQ+/5S5q5
         jyT0GRtOpmpaXUjvZIciOScRrTYTU4ZoJYRzYDvIE0O1t76s8OIKrkB8xzi2Q2e9k8
         HgW6k5sAzFpqaaSHPzkV4HwwZCNSymGXVAkUMuOw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 19/29] memory: mtk-smi: Add argument to function pointer definition
Date:   Fri, 24 Jul 2020 09:40:28 +0200
Message-Id: <20200724074038.5597-20-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix checkpatch warning:
    WARNING: function definition argument 'struct device *' should also have an identifier name

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/mtk-smi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 109c7e51d551..c21262502581 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -60,7 +60,7 @@ struct mtk_smi_common_plat {
 
 struct mtk_smi_larb_gen {
 	int port_in_larb[MTK_LARB_NR_MAX + 1];
-	void (*config_port)(struct device *);
+	void (*config_port)(struct device *dev);
 	unsigned int			larb_direct_to_common_mask;
 	bool				has_gals;
 };
-- 
2.17.1


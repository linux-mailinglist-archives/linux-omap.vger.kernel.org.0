Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4964740D6B1
	for <lists+linux-omap@lfdr.de>; Thu, 16 Sep 2021 11:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236481AbhIPJ47 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 05:56:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236019AbhIPJ4q (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Sep 2021 05:56:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 378ED61216;
        Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631786126;
        bh=JwWCjmG96CZuiWgSlG9dyPmxEM9GvaJcEKBMYRMsB90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MKTqSxcIt9p5H4pJmyp/Oz2PN3adV7AHogAAT8d74S4+05T1Hv1sedSSPJm4eh3ze
         qQJ2sNzbydSsI52T7JA1TjEvaEeePhI4fOBziTnEtac7yJhfMH6YMVmAbwdqm/32GI
         Ua2OxhexmmefTGPcIxMu1VZjG+3RGNw1uIAP9JT+Q2F0EmtpcriB7ahpjv4TzfoMIL
         IybzAi+bhHHP9aCVb8CKx9Iu9/Ky+HCtmhmo05rn2Huery+53QC4518C7ygCLxnto3
         i921Ceq5frvN9c3tyCE6HcpCu4Svjlmy3ydv1n9R6w+shpEkKW7ulm944yyeUhLE8B
         vCMRgQeslZMYA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQo72-001vTb-9T; Thu, 16 Sep 2021 11:55:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 05/23] dt-bindings: mmc: update mmc-card.yaml reference
Date:   Thu, 16 Sep 2021 11:55:04 +0200
Message-Id: <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631785820.git.mchehab+huawei@kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Changeset 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
renamed: Documentation/devicetree/bindings/mmc/mmc-card.txt
to: Documentation/devicetree/bindings/mmc/mmc-card.yaml.

Update its cross-reference accordingly.

Fixes: 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/mmc/host/omap_hsmmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 7a29ad542e4a..9dafcbf969d9 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1510,7 +1510,7 @@ static void omap_hsmmc_init_card(struct mmc_host *mmc, struct mmc_card *card)
 		 * REVISIT: should be moved to sdio core and made more
 		 * general e.g. by expanding the DT bindings of child nodes
 		 * to provide a mechanism to provide this information:
-		 * Documentation/devicetree/bindings/mmc/mmc-card.txt
+		 * Documentation/devicetree/bindings/mmc/mmc-card.yaml
 		 */
 
 		np = of_get_compatible_child(np, "ti,wl1251");
-- 
2.31.1


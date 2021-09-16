Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8BA40D5A1
	for <lists+linux-omap@lfdr.de>; Thu, 16 Sep 2021 11:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhIPJPl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 05:15:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235243AbhIPJPl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Sep 2021 05:15:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A8AE611C8;
        Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631783661;
        bh=JwWCjmG96CZuiWgSlG9dyPmxEM9GvaJcEKBMYRMsB90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h+l3xVhrI7zt21b+ioX8SbwwGExRKlakRD4WElIq+yjA1P3EhyxfM9Umri1Um4q5W
         ODLyWgFwxvJltlcWhcKl8mmrUVoCDDeY7Hoh0vlftiK9Vj+Oc+XoaO4Bwp5vQUbEzp
         camz4FsSyoxvKTBWmwIChphQzZG5dQr8vzueaZqwy5FAhhJvY5UyVo8DUyHN/z9xs/
         c0CGdsD7JoEDcMgLghH16PJJo7OlDhsCcS+v1z4fru7qcpTf8Hh4nvyzqchD2uynAG
         8bzUkXMn5IxQYaivNN9JgLjQGg1juBNfNsRQm0P0KuMn75CPiNzsTAtS9orz9oLIL2
         rkUOhF6TYUmhQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnTH-001sKt-EJ; Thu, 16 Sep 2021 11:14:19 +0200
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
Subject: [PATCH 05/24] dt-bindings: mmc: update mmc-card.yaml reference
Date:   Thu, 16 Sep 2021 11:13:58 +0200
Message-Id: <865336184bbf2306b5f185cd11d39ed69fddeca6.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
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


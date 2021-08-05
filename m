Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8459F3E1762
	for <lists+linux-omap@lfdr.de>; Thu,  5 Aug 2021 16:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241526AbhHEO4V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 10:56:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50750 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241472AbhHEO4T (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Aug 2021 10:56:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 175Eu3i6028597;
        Thu, 5 Aug 2021 09:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1628175363;
        bh=bAUzYeVyrODiXECRyzLMEMNE5HuzRxCzH/FaYIAtexU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EJTh5HUn1sZ7+3rEdVwZ35c+Wllz5PZfnFzX1Xmvq6PH51oZNiZisxb9zkQVEFTS2
         f9ISiGjL0egZiRSuph0GQSvnQz207ogT8HmMQ4TmlRxh2TpMH4a+SJo+ExDGoUvaue
         C3Jg1qK47d9apEzhPoM051tHaD+/lPrSGUWYqCYE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 175Eu2cF078167
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Aug 2021 09:56:03 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 5 Aug
 2021 09:56:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 5 Aug 2021 09:56:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 175Eu0YV006796;
        Thu, 5 Aug 2021 09:56:01 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     "David S. Miller" <davem@davemloft.net>, <netdev@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next 2/3] net: ethernet: ti: davinci_emac: switch to use skb_put_padto()
Date:   Thu, 5 Aug 2021 17:55:54 +0300
Message-ID: <20210805145555.12182-3-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805145555.12182-1-grygorii.strashko@ti.com>
References: <20210805145555.12182-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use skb_put_padto() instead of skb_padto() so skb->len also got updated, as
preparation for further removing frame padding from cpdma.
It also makes xmit path more clear and linear.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/net/ethernet/ti/davinci_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 637796670746..b1c5cbe7478b 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -943,7 +943,7 @@ static int emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
 		goto fail_tx;
 	}
 
-	ret_code = skb_padto(skb, EMAC_DEF_MIN_ETHPKTSIZE);
+	ret_code = skb_put_padto(skb, EMAC_DEF_MIN_ETHPKTSIZE);
 	if (unlikely(ret_code < 0)) {
 		if (netif_msg_tx_err(priv) && net_ratelimit())
 			dev_err(emac_dev, "DaVinci EMAC: packet pad failed");
-- 
2.17.1


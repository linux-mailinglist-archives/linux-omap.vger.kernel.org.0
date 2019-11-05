Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1AEFF2E
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389329AbfKEOB3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:29 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43890 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389290AbfKEOB3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:29 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1MQE071469;
        Tue, 5 Nov 2019 08:01:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962482;
        bh=LtkTVpWL6TMo5645N6f1i/Ciz76+fqNN9ZgDR0Mf4kQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fF5JqDG8JDj3W8+d+8u0LXMQK3EEmlRBxS40lG8cW6/6rAwK45Jcr8l+BMChbNKl9
         gqXQ79RMaSinl0Spzp0JRzxwHPauaYrPBd1+GRAwu4NwlKb8H4v+GBwFen6n46iZqd
         sGHeetRSAB5hAfdWeTttO2cEyaP73DBW9T6j/f08=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1Mo5007769
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:22 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:06 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFf068289;
        Tue, 5 Nov 2019 08:01:19 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 02/22] crypto: omap-sham: remove the sysfs group during driver removal
Date:   Tue, 5 Nov 2019 16:00:51 +0200
Message-ID: <20191105140111.20285-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105140111.20285-1-t-kristo@ti.com>
References: <20191105140111.20285-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver removal should also cleanup the created sysfs group. If not,
the driver fails the subsequent probe as the files exist already.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 2e9435577cea..0bf07a7c060b 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2270,6 +2270,8 @@ static int omap_sham_remove(struct platform_device *pdev)
 	if (!dd->polling_mode)
 		dma_release_channel(dd->dma_lch);
 
+	sysfs_remove_group(&dd->dev->kobj, &omap_sham_attr_group);
+
 	return 0;
 }
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

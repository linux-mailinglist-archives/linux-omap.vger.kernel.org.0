Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6B23B751A
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 17:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhF2P1A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 11:27:00 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:19604 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234549AbhF2P07 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Jun 2021 11:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624980251;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=vENqgZHTYh1cWUzL4NPUtQtHOHGI2z731aBN2EtzdX0=;
    b=K8NW2i0mZaQs4CZnC/l2+LiRfXPfVb65sq67hnzm8yveXIjc5NQlamP1KSlyLZdKXX
    kdrUck5exlhm4wRQKCz5wvw0Fo1rESUlU+oVUuGc2gKv1jyG4bklIyUxOXlcBHQSSr4k
    i1rDN1iZvKOqdOG5YN03jzguR2pbsJj5v1Q5Ib/w29GSd/bJ+ZLHV+mJfW7ybCMSF82C
    IwW8MhiRCYmzCMZe2CvUk41hwrgvepCYTmSDVQwiW5DN2V77csuTiMedPSU4qnpCFT6S
    PdmMSdvVC9R5BhyWMkUqeah8mUG4l0xP5z1wVccUwBO9huWL7TPLUy7BcRhSq6dG0jaA
    gWMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5HIJJh5o="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.27.5 DYNA|AUTH)
    with ESMTPSA id f0359ax5TFOBOYX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 29 Jun 2021 17:24:11 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] regulator: palmas: set supply_name after registering the regulator
Date:   Tue, 29 Jun 2021 17:24:03 +0200
Message-Id: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 98e48cd9283d ("regulator: core: resolve supply for boot-on/always-on regulators")

introduced a new rule which makes Palmas regulator registration fail:

[    5.407712] ldo1: supplied by vsys_cobra
[    5.412748] ldo2: supplied by vsys_cobra
[    5.417603] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to register 48070000.i2c:palmas@48:palmas_pmic regulator

This seems to block additions initializations and finally the
Pyra-Handheld hangs when trying to access MMC because there is
no mmc-supply available.

Fixes: 98e48cd9283d ("regulator: core: resolve supply for boot-on/always-on regulators")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/regulator/palmas-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index 337dd614695e..b49cc05f847f 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -975,7 +975,6 @@ static int palmas_ldo_registration(struct palmas_pmic *pmic,
 		else
 			config.init_data = NULL;
 
-		desc->supply_name = rinfo->sname;
 		config.of_node = ddata->palmas_matches[id].of_node;
 
 		rdev = devm_regulator_register(pmic->dev, desc, &config);
@@ -986,6 +985,7 @@ static int palmas_ldo_registration(struct palmas_pmic *pmic,
 			return PTR_ERR(rdev);
 		}
 
+		desc->supply_name = rinfo->sname;
 		/* Initialise sleep/init values from platform data */
 		if (pdata) {
 			reg_init = pdata->reg_init[id];
-- 
2.31.1


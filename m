Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB01C1613AE
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 14:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgBQNi0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 08:38:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:23670 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgBQNi0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 08:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581946704;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=cBUUlAZ6i+U9PJhnWDfCJgK6bPL4IpEvunrE61nzboc=;
        b=IonV6P7gZndFOVguOLjAdcZH4YnjBM8dzfr+KxzwFf/3krjV7jMTzdJuBoJHsmEmc+
        AKAw6nCg5LHNv8CgWbLsAaHgT6Rtr8S/ympNl50OUSDMJEfSDH41ggQgt0ucz0i8QaUm
        HFCo5ZBnZel0LEuKo75VuZ//LEgOm0OAfy/yVfmH+7qVrDQGqomQNbwi+pcDHWj4423Z
        ZHP2jwD/NRBgTtzIuPsrOCSKN5KPbTWF0/8O6qslGzmdO8XNbSq09NvqodGMPsufA4mC
        EsiKGwwIpCMCsb9OQ1v53aOcWt7qut6RvDdHLVs3oVhmZHCF+U6nnelMAizaG4sfGPMz
        JrZQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnsvhg="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HDcGNXg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 14:38:16 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
Date:   Mon, 17 Feb 2020 14:38:15 +0100
Message-Id: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If the gpios are probed after this driver (e.g. if they
come from an i2c expander) there is no need to print an
error message.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/extcon/extcon-palmas.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index edc5016f46f1..cea58d0cb457 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
 
 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
 							GPIOD_IN);
-	if (IS_ERR(palmas_usb->id_gpiod)) {
+	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(palmas_usb->id_gpiod)) {
 		dev_err(&pdev->dev, "failed to get id gpio\n");
 		return PTR_ERR(palmas_usb->id_gpiod);
 	}
 
 	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
 							GPIOD_IN);
-	if (IS_ERR(palmas_usb->vbus_gpiod)) {
+	if (PTR_ERR(palmas_usb->vbus_gpiod) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
 		dev_err(&pdev->dev, "failed to get vbus gpio\n");
 		return PTR_ERR(palmas_usb->vbus_gpiod);
 	}
-- 
2.23.0


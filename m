Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6433D1611E5
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 13:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgBQMTZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 07:19:25 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:24830 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgBQMTZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 07:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581941963;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=gi6Z2pwzRYEGvxwcjbLCS6+ym8OFZt57PA8B2Zkd+uM=;
        b=aSDyPP06m+lbobm6lcuF3nR2jl3p9KJQ6NfgxhuJCAwb8YzeNhDyYK+m6N9LUG4LNH
        3HNUo30ozzIHNNzCJkFTLm0yu5SDO02dQ1qAqJlgxgJbUqPiAut37ZNe6UF0xCH+IYJq
        t285SVv5Br78PEn1hSqRM4F0oqF7LDjp/nPHcqwn5nMZAoBHjzp3+gfcL3ZAEdGGj5Ns
        U4Fyyzej2xsPIeITQ3HS9n8YajlP+CjjkpjyQfSCz1yMDS5e64GSBHL35AnjccyxvOkn
        TGmQpU8NElzJ9nh085Kc1iqThcv6zlFO48j3NbvI6M9aoqueEICKRie2VxpN5ejnDHfy
        8UeQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnsvhg="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HCJ7Mm4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 13:19:07 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
Date:   Mon, 17 Feb 2020 13:19:06 +0100
Message-Id: <cf2554c724a8ddc5a3e3485228f3ab750980d4b4.1581941945.git.hns@goldelico.com>
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
index edc5016f46f1..701d7c9584fa 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
 
 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
 							GPIOD_IN);
-	if (IS_ERR(palmas_usb->id_gpiod)) {
+	if (PTR_ERR(palmas_usb->id_gpiod) != -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(palmas_usb->id_gpiod)) {
 		dev_err(&pdev->dev, "failed to get id gpio\n");
 		return PTR_ERR(palmas_usb->id_gpiod);
 	}
 
 	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
 							GPIOD_IN);
-	if (IS_ERR(palmas_usb->vbus_gpiod)) {
+	if (PTR_ERR(palmas_usb->vbus_gpiod) != -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
 		dev_err(&pdev->dev, "failed to get vbus gpio\n");
 		return PTR_ERR(palmas_usb->vbus_gpiod);
 	}
-- 
2.23.0


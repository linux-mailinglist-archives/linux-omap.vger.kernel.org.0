Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5EC3160DDA
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 09:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgBQIzr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 03:55:47 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:23678 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbgBQIzr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 03:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581929745;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=eH23xUz7bTdqA4S1ozloDBOylhj7VC8PtsgSktH+a/w=;
        b=Rg1DywqLaTkF5MjthtqqPkFas5Z4ZTN6aErgcIQpEApfugfp5BzRd0CBjhBfudEF63
        Usy4Nul+mFTxWPXQDKHIDR023lxxPZg5qBuJdeFPXdkUvx1rqP88Mygv/yF24+4cFTmZ
        R0UZ5J5P4HkPJCya9oeiVh/ieRYRfAtA9ekAMErpAmGQrTRyY3rYLdkmWRHYd3xy55q+
        GvPO/Rr3LvtVLSUr/3Ek3AmwZkr1LqIlsn9fsOKppA+6rMbXLvj6eDhrFuBsKDkld00x
        wm8DD8UMuK1nsE+8Y/2IrN/ytjM8ul67D6NCE362aD0iPER17bupDgT1SnF1oRzTe3/d
        /nMA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnsvhg="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1H8tgLO9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 09:55:42 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
Date:   Mon, 17 Feb 2020 09:55:42 +0100
Message-Id: <f65ad0ef2866e7d5b6743e13579c1efe8c572b4f.1581929741.git.hns@goldelico.com>
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
 drivers/extcon/extcon-palmas.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index edc5016f46f1..9c6254c0531c 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -206,14 +206,16 @@ static int palmas_usb_probe(struct platform_device *pdev)
 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
 							GPIOD_IN);
 	if (IS_ERR(palmas_usb->id_gpiod)) {
-		dev_err(&pdev->dev, "failed to get id gpio\n");
+		if (PTR_ERR(palmas_usb->id_gpiod) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get id gpio\n");
 		return PTR_ERR(palmas_usb->id_gpiod);
 	}
 
 	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
 							GPIOD_IN);
 	if (IS_ERR(palmas_usb->vbus_gpiod)) {
-		dev_err(&pdev->dev, "failed to get vbus gpio\n");
+		if (PTR_ERR(palmas_usb->vbus_gpiod) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get vbus gpio\n");
 		return PTR_ERR(palmas_usb->vbus_gpiod);
 	}
 
-- 
2.23.0


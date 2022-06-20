Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D855520B5
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jun 2022 17:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243670AbiFTPZO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jun 2022 11:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243880AbiFTPYt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jun 2022 11:24:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56CF2BDE;
        Mon, 20 Jun 2022 08:21:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92735B8120C;
        Mon, 20 Jun 2022 15:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE862C3411B;
        Mon, 20 Jun 2022 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655738515;
        bh=DRPgAE5eSHKVuERQNm8HAW9Y8Oo6XD7HXWlbayBgLEA=;
        h=From:To:Cc:Subject:Date:From;
        b=V2zEVThMzyBiHx3VZPGncWjhdETsYG7K3XNyZ/nVnOWb41ap5Fwi0m+93UgHhygT1
         rCmADDC7NKmXBnJsgoq19Zmah1q6Gh8w+UCjKn9mUIM2wdXPHETxnT0sTcPqlhUZDw
         NGHYl/bY5/7g4ZwA9kLXETF3dBq4viE95KjtfDd3AtwBB0STQ6YaTz6BK8Uss4EgjA
         Jy13HfhrUflwCzgA2tr3UrRV+UxbFOodQ6UIIYvcMs0+r/7/s3977QYPxskJqJdSej
         rPdg8TjSkCTlksEH6+dvV0VZf0CIul4CAUIoZHgz6EMboeDl9APnXGxBDwKWM3z/I4
         twwNPp0lKT4qw==
From:   Mark Brown <broonie@kernel.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone Black
Date:   Mon, 20 Jun 2022 16:21:50 +0100
Message-Id: <20220620152150.708664-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; h=from:subject; bh=DRPgAE5eSHKVuERQNm8HAW9Y8Oo6XD7HXWlbayBgLEA=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBisJBTSR3QEXrnym9ZH3pqR0OSRaCQHg5tEe7chXs2 aq5kWCCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYrCQUwAKCRAk1otyXVSH0CR0B/ 49mt6bum3wynGu6kkKGkZctn0lbG4ZaxQG2ijynk+yJyxOYTRPKLC8eTunpnZHTbUbglE3Of3eZ5tv pOfgP9Y6K0wZ4in4LbLShUBIhjI0582tEk2p0CYynKW9Jqsed1DcOj8dqaeBj6FkvcvFIDQ3ZYSKgx 8kKoqNsEn76V39EAaBrjuvQz/txMHbFvYSTVx5sp0P8LQiixiNKqfluvD5yqJGXojX5vX2L8iFnSV8 Rq+n16lKmofn0tSM5uIZ1zWWdsASHaNu/O91laWlBuQCDnYHGcKNCl23oX268v8+UruUOLfaBI8B8s kbT08fGC/SjZnawlxa2zkE4rwjLmJV
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The identification EEPROM on the BeagleBone Black baseboard is supplied
by VDD_3V3A which is supplied by LDO4 on the PMIC. Map this as per the DT
binding for the EEPROM. Since this supply is always-on this has no
practical impact but it does silence a warning at boot due to using a dummy
regulator.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/boot/dts/am335x-boneblack.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index 9312197316f0..b956e2f60fe0 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -168,3 +168,7 @@ &gpio3 {
 		"NC",
 		"NC";
 };
+
+&baseboard_eeprom {
+	vcc-supply = <&ldo4_reg>;
+};
-- 
2.30.2


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B014751DE2E
	for <lists+linux-omap@lfdr.de>; Fri,  6 May 2022 19:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237791AbiEFRNV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 May 2022 13:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240813AbiEFRNU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 May 2022 13:13:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2C46EB14
        for <linux-omap@vger.kernel.org>; Fri,  6 May 2022 10:09:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29AF6B80E9E
        for <linux-omap@vger.kernel.org>; Fri,  6 May 2022 17:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43442C385AC;
        Fri,  6 May 2022 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651856975;
        bh=+3fWsdvidtJdM0kB8+7iBLZBMIXLjE243U4SVnF0Bbc=;
        h=From:To:Cc:Subject:Date:From;
        b=EeJ6Loq6dzeIj9XzrDPJntxQamSqPRpgd77LWs3evyVmTXHzn1e8z1+fIQeQeoFiZ
         WMcJL15WTdwM4aUiKiGBy9h70AalsWXTmyK1ZeJCtaXPpfgX4NGnvUSdLhteNJ3x5a
         aMZ7in6y/hm3+kivf7eyJwRJHTJvQO0wC9viIl3kZVjiXW+55IVQNWLhPeBGwu/un6
         HwHVvrkjC3dWoFhGTARZwmP/1BZLpwT1gaf+7KkRm1RAfZ4Ty2pkRC89czpRyShNjQ
         vyL8WBoroF7CmB/SRW96BsDONQ/PNiohxFKu0PmEF/bTMZ1f2dRgcTNJ3hXZmqnR8v
         TAuU0rflS2cFw==
From:   Mark Brown <broonie@kernel.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone Black
Date:   Fri,  6 May 2022 18:09:27 +0100
Message-Id: <20220506170927.846120-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=798; h=from:subject; bh=+3fWsdvidtJdM0kB8+7iBLZBMIXLjE243U4SVnF0Bbc=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBidVYEwNfZcCP4Opi+9Mhixrz/GQ5AKio3LgvygWAR qy2GByyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnVWBAAKCRAk1otyXVSH0OZIB/ 9DOlypGrlHHXXdXLcq2lUMoGAimZ9OTc2MkTfChJTX633BMgHaMWTeAwMvyvfvNfnW5wc05t0wfRdT Ba1drG7/c8qmWFCl+uHCARlZaKeh4PKN2vOH40sfRGFmbCxPPsMac2kS86sKkF9ZIj7GqjkjKGTwGn qN4hRC4jfD5LLdqx+0JWajdIhov8Eu4HQIhPzlNHA/2sdVDuUWhSgDHaCxQuo/0uBnG1cqVpJVACzh tBos/caBgJ6OE14l6RC+pyau5K4fHez7/zHsqFn0yfHzKqI08OSLZZ8s9Dy9quk9MNeuSZefVpFR04 mNY8xpNO+UDIyLGOUywZHU72pb7A6Z
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
index 9312197316f0..b1d210c85c5b 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -168,3 +168,7 @@ &gpio3 {
 		"NC",
 		"NC";
 };
+
+&baseboard_eeprom {
+	vcc-supply = &ldo4_reg;
+};
-- 
2.30.2


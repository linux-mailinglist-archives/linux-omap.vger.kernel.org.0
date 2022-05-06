Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A5B51E22C
	for <lists+linux-omap@lfdr.de>; Sat,  7 May 2022 01:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445010AbiEFXea (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 May 2022 19:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445009AbiEFXe3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 May 2022 19:34:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D6113F0B
        for <linux-omap@vger.kernel.org>; Fri,  6 May 2022 16:30:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7453D61CD0
        for <linux-omap@vger.kernel.org>; Fri,  6 May 2022 23:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0BCC385A9;
        Fri,  6 May 2022 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651879844;
        bh=AwHPAhoB+u1SGHoLk6NWblhiqpS/bs/bmpiG63zAyew=;
        h=From:To:Cc:Subject:Date:From;
        b=BSSjZQAFDLVam8ORkMb2OLFfFXtpjYqth1RXUEdNTf//l9d/NlRfXJNFQzkxFoyN+
         pV7vymg1t5yqLtgwxnNr7lvqlxjmpmBMqPSmKa/9dhpuO4EE/SgmBsTy9sRzKXy19I
         R8Zy7RD8VqIvHiGNNYOp9/Ctv2Z2yAm7y2FogZ2aXJ9Ga9DxWR3H9J7/8WWyZFyxQu
         WW4usn3X9wYBbhBVl6CKOX4ayJBIjMuccgj1Qcf3uTDdjjbvhqWtgg6HruWRR+vUaD
         TYvkR5Ns8mp8iFBcuanplPozwuU4LVPOYfxyCI4YiqEnNOi5+f9pC4qVNHdFMdPr2o
         mXARngj9YfeiA==
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone Black
Date:   Sat,  7 May 2022 00:30:39 +0100
Message-Id: <20220506233039.1874405-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=869; h=from:subject; bh=AwHPAhoB+u1SGHoLk6NWblhiqpS/bs/bmpiG63zAyew=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBida9P+VCUh8t4eanFO55hj+LppmUgXIaqxRmritdb sPUqd3yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnWvTwAKCRAk1otyXVSH0JU0B/ wJ5xedlTNcAvBqgJTneWx3Q33MXsKFW7WXmiw1sMRGXDf9YS5EsF7H4TzdXLNWnB9gr/hfOSm/rx1A yIjlgRIt+zeJNkyldM3j8/eGtsfhNBsH7WL2mX86DYRXlGM73gmsRfERcBqtWWVBAqI1aO4q4YTZHl UJT29NkbD+iPye5qQOmiYUtG+6GfbDTliCpZCTvkxgxB+JQ2Q0SzPgsXAsqPJqrNFqbhDoakE324am Of9kyEPA15o6B1q7qklzYJduUJ1PQqEkhub7OsmmX64wBwzgDKiiabWMTIy4122ZgHjCkVi2KFX6N8 hhew4RSJxV5iuuzZPnKEENim6+g/dc
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

v2:
 - Fixed version, sorry - previous version was missing <>.

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


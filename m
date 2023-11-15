Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD23E7DF5CA
	for <lists+linux-omap@lfdr.de>; Thu,  2 Nov 2023 16:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbjKBPMQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Nov 2023 11:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbjKBPMP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Nov 2023 11:12:15 -0400
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B81DC;
        Thu,  2 Nov 2023 08:12:07 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
        by mx.skole.hr (mx.skole.hr) with ESMTP id 58B5C836CE;
        Thu,  2 Nov 2023 16:12:06 +0100 (CET)
From:   =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date:   Thu, 02 Nov 2023 16:11:09 +0100
Subject: [PATCH v7 03/10] pinctrl: single: add marvell,pxa1908-padconf
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231102-pxa1908-lkml-v7-3-cabb1a0cb52b@skole.hr>
References: <20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr>
In-Reply-To: <20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Leo Yan <leoy@marvell.com>,
        Zhangfei Gao <zhangfei.gao@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Karel Balej <balejk@matfyz.cz>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=3vMvyouTrSlTTv/1BlonUdvoKpdtri2jxGZJNXRvhAY=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlQ7w4R0WGAouL6TrH9chgMtCm0ZfVKWBiq89tl
 Dd9aHZwzXKJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZUO8OAAKCRCaEZ6wQi2W
 4SsIEACRIEDbXydKjDCcaYpSifjIjFL7Gii4p2KLIUEwwf8DLR3hGlFL2XK3Mkf1OzluaRtlbns
 99kOngBNHCviv0q71rWYiah0Ge4gWEW7tAG9hJbzPdtbTPkFLp27NmVahm+KfSpY48fuDg1Ud6M
 flhLAYaW61mObhsdXbbF7j5ch76+dAQhgztJJ/XFQw/FT/wuwstxos+FyfLIHPgwCegnAe1Im9J
 DX/mPZB5AsBVWEZyTGRfIbNA6ZiFeLfBvJUYPquuPtiNywJu7IYmmGIqdMxW9Uh7mNMq95Fgx4z
 KUN4K6hEozWfFDAtG7NZ6tPqgEzDTL/5Xkd1C+ZCI3244y61yhAJkw3alfHQjZhBR0VooZjWWBk
 J7pILsKh0H1UhbcGL0umo+/BXUPOWGzHpQp19pY2rqJatvAx+apYtPK9G2z6Cs4V7mE6QsHCv6Z
 oxNbC0jsYumBAbvXLIAWUxpNEW6RripDS37iwmRr1Xc7gHfB1WfVGn1rF73cDjlJISZgJqL/lTk
 X9y/t/JGj55a/s8qm8Ll/bixprzbDe+gknRthafU9xWdmtG9pKtItumjJGQpfIoLIXF9Gjb4lTj
 TnrJr/M/MO27shjg6VusjjJswjN1XxEDqP1qdq0IDW91U4hB8AfeIa4677WGAaXycrTnvBv5XsE
 KeLsd+RofQxj0mQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 461a7c02d4a3..a36f750cfe9f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1968,6 +1968,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
 	{ .compatible = "ti,dra7-padconf", .data = &pinctrl_single_dra7 },

-- 
2.42.0



Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259CC6FF399
	for <lists+linux-omap@lfdr.de>; Thu, 11 May 2023 16:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238233AbjEKOJ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 May 2023 10:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238036AbjEKOJv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 May 2023 10:09:51 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45DC5274
        for <linux-omap@vger.kernel.org>; Thu, 11 May 2023 07:09:49 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9659443fb56so1354460366b.2
        for <linux-omap@vger.kernel.org>; Thu, 11 May 2023 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683814188; x=1686406188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T51fHYXev4lGul6BLthLaAG/m0uxHvU5Lp/xoa5Sp/M=;
        b=KQPPhNfOR5LClxNydK6Lh4ahO2zqgWaEC4tnK6rgQKxvlr9vfH7w6RBD+wGYXFlFCk
         oCs9d2+w3MsjC8xGqIZCdQckb4h6aLxLNo1hvnoNqtgGe+6HRXoGNz7bffcB47v+Rn6/
         4tdNUh2fvdBzelzR1CUHZk7l0Iehl8TXcLy4l61pbp6fAiNEFaHqOj3blBPYF+406hkx
         Pf3PLBzP+XrriHBy8VwePGFlcRo7+Lm2mL+RmnfTmzrgQoNF2Rq5BQXbGuuJG7+NG1tk
         Z+ouLGE7VOoSNSRrWrxiJUmil2osnGPZoJ+8fV9cGlzUyfI5pGspCrreMX2/ugCUh59g
         JsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683814188; x=1686406188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T51fHYXev4lGul6BLthLaAG/m0uxHvU5Lp/xoa5Sp/M=;
        b=bR5B/JDAwFWdOxR2fhlfvKwK42ze8h2QJTT5AjyJth6A0ZzmVToYe5QRZ5HKikIYNs
         xAuYkQV+XEOB+InCSIKSfIXT/KjoauW8yKJrEvD9SDiLOmCBHkuOcpf2Ky/ay/GMHw3a
         qyCcFaVEs5zxUJpIpJF1E+INGappJZTnk/aCFzcslPDSLTp6TBbPNvAC01quHSLRHwjq
         x+BXk4TJvcbD8Bq5vXLMIX7gUWhMijvJ24YRethv6kijSuKrj4Gwlab0/kUHyNV2xhMf
         p1RxkmWtkCES7nHl0yrYGvdMi2BmxARHoOTBIZTvGU/3EGJ3qpHJK5Igc0YLnuYo3b5K
         oy9w==
X-Gm-Message-State: AC+VfDw/xbiO3s/VdNpTjJ2/dnx9keT15rJL8AgSpNPV89OYu+tI+fsx
        McdPtsgLKOu0/TXZTkXpSZEIVQ==
X-Google-Smtp-Source: ACHHUZ6uUO7u0Ag9xtoEfS6TEahd1zf/4l3JaTZbvBfSQKgb9yrmJt5fFwb2AYiDHq0299OUgUymUQ==
X-Received: by 2002:a17:907:1b17:b0:965:6075:d0e1 with SMTP id mp23-20020a1709071b1700b009656075d0e1mr17049791ejc.72.1683814188264;
        Thu, 11 May 2023 07:09:48 -0700 (PDT)
Received: from [127.0.1.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id gx1-20020a1709068a4100b00965a0f30fbfsm4057624ejc.186.2023.05.11.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:09:47 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
Date:   Thu, 11 May 2023 16:09:42 +0200
Subject: [PATCH v2 2/2] mfd: tps65219: Add gpio cell instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230511-tps65219-add-gpio-support-v2-2-60feb64d649a@baylibre.com>
References: <20230511-tps65219-add-gpio-support-v2-0-60feb64d649a@baylibre.com>
In-Reply-To: <20230511-tps65219-add-gpio-support-v2-0-60feb64d649a@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Jonathan Cormier <jcormier@criticallink.com>,
        Jerome Neanne <jneanne@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683814185; l=866;
 i=jneanne@baylibre.com; s=20230511; h=from:subject:message-id;
 bh=h/znsSZb4ku3m0TBnEL/O7SKys/mM4RedsLJul+D6qw=;
 b=F26UalLmLmw3Kr0fdb9s4cii+oNyMXopifxP1O3Ubdq2BKN7sl+gPNglcBjH9mpk3VOgx1Gvm
 dkRE/SpG25FC2ZYT4To06ucNDtw76hse4kNrGP2L7a81yW/oP57e0xT
X-Developer-Key: i=jneanne@baylibre.com; a=ed25519;
 pk=5rvbqNoG+28jQjC9/50ToY7TgKWf9rJukuCI8b6jkUo=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tps65219 PMIC GPIOs are exposed in a standard way:
gpiodetect
gpiochip0 [tps65219-gpio] (3 lines)

Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
---
 drivers/mfd/tps65219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 0e402fda206b..e1d090ba4258 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -106,7 +106,7 @@ static const struct mfd_cell tps65219_cells[] = {
 		.resources = tps65219_regulator_resources,
 		.num_resources = ARRAY_SIZE(tps65219_regulator_resources),
 	},
-	{ .name = "tps65219-gpios", },
+	{ .name = "tps65219-gpio", },
 };
 
 static const struct mfd_cell tps65219_pwrbutton_cell = {

-- 
2.34.1


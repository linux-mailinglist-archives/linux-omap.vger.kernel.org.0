Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3C772630A
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 16:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241129AbjFGOjo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 10:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241133AbjFGOjn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 10:39:43 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F8B19B6
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 07:39:40 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6042d610fso73384065e9.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686148779; x=1688740779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi5cyxzC3+NP4WFp104cxanaFNMsvwaBhA2yhJz87ao=;
        b=jF5QOH/c0RKGOEfIu11USF776tOYIYXFGaBlQIhRPL2IOSHTJekY/Gez2+3VXfbQYv
         hdKKqjipP0jMEkIKs+E8RkE9x8VbHGl4+qDQZ/3yr64skVCEx4QTCE/WD5xFL83/4/lh
         cM0hwG3Ely6lSnYH7uMjqdBrn9BjL3kwjwEuWwrbzUDxW/J1oyKbw4O2ndog6eUvsYY/
         27uDixAcZF5Yj/eEyW7WeEPJeoSBuiWjAUD9M6QzdjYLF9R2jUQs/nDrVaZTC5dvXgT7
         q25QsVpo1Sgx0UJlXJLnWEGQlOMudqL4xczYj0PTmmvx6nVmoY0v/VnHqLI75R1NDG5O
         pK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686148779; x=1688740779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi5cyxzC3+NP4WFp104cxanaFNMsvwaBhA2yhJz87ao=;
        b=bXJpxmm2ZWphaDQlrpme2fySsvLkE8nApD48zxrTmuFyd02q1ZPSFLR8TznH2UkPa/
         0oomMH3IAfh3+lQ5wGnWETREizvKMdLnm6DiGO+ddRc3oprYsrG/zHRTQGtHFCc0Er8A
         /Tr7Hsvky0rSI2Tgjqnbbeuzu9jhIfUk+97xYD2ojr6HbRXuq8rAWpdpzlbqTYX//a4V
         oysBtQwqbX0rcxnHvuOFOnGsd3/DI1Ujf8QtNRoxJNlsCiRtFAWm2kaK0+K7yAY4eja+
         B4bAw2RJEbSGAst1mDRyW4basH7cJUBbLlOrRsG0zkaZUKotQusYqge4gRHipo0rambW
         AY3w==
X-Gm-Message-State: AC+VfDxa4LZM6Z4MY22/DbMBcz2VbPrBFm8M38UpWqQcqckhhEqtzukX
        u9kz++lgFyja7Bo/Vct6EMmnDw==
X-Google-Smtp-Source: ACHHUZ7fTkUMcwABZYa33268kQ8V87RIByG5J5tCjNd4jcnCyzwFXcnxwKcekb7eaP+hPAjNWZygzA==
X-Received: by 2002:a1c:741a:0:b0:3f7:3991:e12e with SMTP id p26-20020a1c741a000000b003f73991e12emr5015351wmc.1.1686148778884;
        Wed, 07 Jun 2023 07:39:38 -0700 (PDT)
Received: from [127.0.1.1] (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003f7ea771b5dsm2380720wmi.1.2023.06.07.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:39:38 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
Date:   Wed, 07 Jun 2023 16:39:32 +0200
Subject: [PATCH v5 2/2] mfd: tps65219: Add gpio cell instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230511-tps65219-add-gpio-support-v5-2-ebb94281c854@baylibre.com>
References: <20230511-tps65219-add-gpio-support-v5-0-ebb94281c854@baylibre.com>
In-Reply-To: <20230511-tps65219-add-gpio-support-v5-0-ebb94281c854@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>
Cc:     khilman@baylibre.com, msp@baylibre.com, francesco@dolcini.it,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Jonathan Cormier <jcormier@criticallink.com>,
        Jerome Neanne <jneanne@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686148775; l=1009;
 i=jneanne@baylibre.com; s=20230511; h=from:subject:message-id;
 bh=nMeCcxVhE7+un5EdrNfRU6JWVC4UNE7togljBBNu77I=;
 b=/dkXVwKJ7qs6DQUwT8EiQ60yjyGUeQyRgvgLRQ/YulBHyErsjPLZHe7kyZKxjMdnPVYYnPz6c
 xQeN3TTb5D7DdHtDxTbMUaHZW1ZLIrWq27WjrgyX30qgeNoFTbb4wlI
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

tps65219-gpios is incorrect cell name (plural):
Changed to tps65219-gpio (singular)

Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


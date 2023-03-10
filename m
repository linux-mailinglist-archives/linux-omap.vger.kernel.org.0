Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF0D6B536A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 22:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjCJVvl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 16:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjCJVvJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 16:51:09 -0500
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D9A25E03
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:48:11 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id cy23so25985909edb.12
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=;
        b=eazgQcZCrt9Ga/ofEu9u0wbMTdh3cJMSnCEAxHjKojovwHbBqFaYNXexCjrVV8WZmL
         IjIGFy96UGzAd7OYJe6GFIzlkbF3Ce+Yund8jNyCNNz7d5wyWXhYAz4KQryGHzpw6P5A
         syVx3nyQgnSWls3X+D7pzRHVmTiJzgID7JidYHMUoBnhnMm99uyjwBAKRV3leKmTysBB
         LWBkPn+fPwm5N37Y/AGsnnys0xkUahlfSm66E7i7Ce6rBCVFLWiOXgRiu8s1O+WwY8Kz
         gL5AWlwpg49IakfXXEZeLLZuHFCmM5UBCoAA8vz8TKmJ5ULqYx/gkvsBPbR2vjlfodr6
         UD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=;
        b=EjycHeezrJH2LcHJWHoOGB7Q6FXR7RBlv5aq78XEXz/p/ub9rOUyJ81r0UjvxW4Ce3
         pVyaz23O9ITfSEecORs2K0vZ+SqJoG47EY3/pGVWebjo+IeDd0GtKd8dbnBn3MGJtpDz
         YGp0CuidtwTLuYb7YvB3/nVNmTD0FeaOZPxuUvt217skKEyhWVMMT1U+hMLvY8l2UI7b
         5lTtkRAr4Aa1uZ3BrLvyXFTZAZqdSOxIQk7i5YUUpRsX8ZLzTZ45yMzf8CIXzvPL57dL
         2LOUmhsnr7aU/cT1f8BClvTFrhcQAdPIjVamEnBIZMJHGZeX/7BGsoPaon1BK0ah9t2i
         vBJw==
X-Gm-Message-State: AO0yUKUqXlKKjxnXNItIXTqyQRWNT2e0HyTn6kQjyjqzU1wKVoJt7/KY
        h7dwp+Yq/fq2reDa3CaaHt1JJg==
X-Google-Smtp-Source: AK7set8Y8CbDyNpUk1qL/iKlbybJRcErNtYcWdpv7HASkaB+D40FRo/ph2ZBE+VfNIL0RyiGBCovDw==
X-Received: by 2002:a17:907:a603:b0:886:7e24:82eb with SMTP id vt3-20020a170907a60300b008867e2482ebmr27928777ejc.21.1678484759246;
        Fri, 10 Mar 2023 13:45:59 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:45:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/9] regulator: mp8859: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 22:45:47 +0100
Message-Id: <20230310214553.275450-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/mp8859.c:132:34: error: ‘mp8859_dt_id’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/mp8859.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index f2300714d5a9..f893dadf2abb 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -129,7 +129,7 @@ static int mp8859_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-static const struct of_device_id mp8859_dt_id[] = {
+static const struct of_device_id mp8859_dt_id[] __maybe_unused = {
 	{.compatible =  "mps,mp8859"},
 	{},
 };
-- 
2.34.1


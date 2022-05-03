Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156D6517DBA
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 08:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiECG5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 02:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiECG41 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 02:56:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21851A06C
        for <linux-omap@vger.kernel.org>; Mon,  2 May 2022 23:52:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id k23so31673071ejd.3
        for <linux-omap@vger.kernel.org>; Mon, 02 May 2022 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/Q3zfGtgiMHzbjJMnG2PTBdvq5LVXiuIrva5mDt1sI=;
        b=V1SsVkPhuDxv+i24Hg4azo6Fj3jkJpm/dIAlQxE3zYW/SBc1gHsMU2myuVkI6Q9f0c
         qCvvaNyZ4TRHQiAaTZWOeWnyik/ln/GslJFLL9yu8xtAzBMzLnsIUbcivktyassSWOTC
         ezcSbpV/rSPbV0WuDwT5My6T6h/jDhyFDfCz5XLfuqbbAceai1eCkFZLrNCZZ6I7zJ5N
         zszJv6PPiV/+z0eCJcd2tvL+EsRDyvBljOXjq7ASJg3ckrYvEnjgWYkL153vTwBp1ePA
         fa0ez0XiZ++ekSNmfgl5nry1FiB774ZZscJxBPMFTqwNLzUzn9IutrktCCw/QCCNwuSe
         S8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/Q3zfGtgiMHzbjJMnG2PTBdvq5LVXiuIrva5mDt1sI=;
        b=WcjxP27De5Bm7OTQ7/JAAC3kFWTS9pNKRiVyQwYFVuhUKi908bjGjLiCiE6P71FsqB
         KJ4taVuOF6WXEJ37+mr4VH+w0Tc6KEqJHXNB+RNAZ3jhJTBVZQRjEoOnTWYnyg6hVcyY
         TyYusPTQKznWVomAnhhC/MbVefplAeS4+VdwOzcHXkjlWfzNEMHPSWh+hRnUcrO80JOg
         wYg6mB/N3zBTcnT/jKbmTpUe+qwiT/vun1kbxYHlc9Fv/nbRAS123vmphzHk3Yk/Qssx
         OMkT+DAbI4DSEsD1k3THNR8cLCivTyKs4SB5WD2jC0VLymSlhKGP+4LoiDpymLoVPwBr
         Fexg==
X-Gm-Message-State: AOAM530LRFVkn7vIHppSO8C2cAT1RlUT1tImx3/PKePntqPVLUqg/PXj
        r3DNW2b+x8aPsTKPBwJFWFaXEQ==
X-Google-Smtp-Source: ABdhPJyQwRdpiF3Jb/6B4GvAdOz4XZNf3S/CRRMWr5NkJARVW4yJ+uqpZsPaR3UnFWYen80b2NKh/Q==
X-Received: by 2002:a17:907:9482:b0:6da:8ad6:c8b5 with SMTP id dm2-20020a170907948200b006da8ad6c8b5mr14137005ejc.372.1651560729585;
        Mon, 02 May 2022 23:52:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b006f3ef214e2fsm4382915ejc.149.2022.05.02.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 23:52:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/6] dmaengine: ti: deprecate '#dma-channels'
Date:   Tue,  3 May 2022 08:51:58 +0200
Message-Id: <20220503065201.51818-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
References: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The generic property, used in most of the drivers and defined in generic
dma-common DT bindings, is 'dma-channels'.  Switch to new property while
keeping backward compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Tony Lindgren <tony@atomide.com>
---
 drivers/dma/ti/cppi41.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 062bd9bd4de0..695915dba707 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -1105,8 +1105,12 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 	cdd->qmgr_num_pend = glue_info->qmgr_num_pend;
 	cdd->first_completion_queue = glue_info->first_completion_queue;
 
+	/* Parse new and deprecated dma-channels properties */
 	ret = of_property_read_u32(dev->of_node,
-				   "#dma-channels", &cdd->n_chans);
+				   "dma-channels", &cdd->n_chans);
+	if (ret)
+		ret = of_property_read_u32(dev->of_node,
+					   "#dma-channels", &cdd->n_chans);
 	if (ret)
 		goto err_get_n_chans;
 
-- 
2.32.0


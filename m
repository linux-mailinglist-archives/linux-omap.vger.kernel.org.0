Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76EC6B5361
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 22:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjCJVu4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 16:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbjCJVug (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 16:50:36 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F299D14863B
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:47:42 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id x3so26029290edb.10
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/rBHJ3jeIsF5DnV3iy779Hl1kpRg/pHkoneANxryCI=;
        b=WOf2iSCsXwS62ug/vDBqFMkRtix9/vWBUiRhgFZOjhuprtPBFxYrtqj4VBGgN2ub02
         wHxkiZKTM6hzdnOZtBSurXVOk91OJx4tnEONmxiSrFRN/D1dIi+SyczihywuT4uwFKcY
         km03HwIRfAA9d461o5IegH9QGU8Bnmba3XqD002qlz09rBVzu3oAlMpM46IWJDUNmgzn
         3bX1/YjTVYaH+Qao2tmS7iY4+dNs1ybWCR40VlOeEM2JKoUTLiPtyZYRw+YTrPCHQKNm
         xv83EEhaLiK7kgeZgp0fpScYcotjksoAhmVmIWurb2rCHY9TsrQao9bTr7AJ0x6ByhIX
         mu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/rBHJ3jeIsF5DnV3iy779Hl1kpRg/pHkoneANxryCI=;
        b=frW7mt/bPrqe7w2Y8f84ccrUOWLkO76jvkObpcZC6kTwBBSKo3zGctCCac5RjfBK3O
         B2aReahlk2adUrjKPgPV21lSz0c9cKUPWL/IZ6j+qMthRXSqpp7wRUHGRBXTd0grCh6n
         J3Be36pqZwWAvdaqcFT1jhaHiiotq1DMBVQUhVPEkrGii1qgyUn0DZ4wxZEv7WLOWMrY
         Y0F57BpcvQ8h+WgGLqiyznNaJ+l+bpxQzOpquVt54kzxiaMumpuQwU15KG0g6l1f+cp7
         0P+YPJxeIEnteDkXiDR03G1TaV8Vob/DxIQyCBBlzi85mChRrVpXbYdwcT+PtI/OMdgn
         tqnA==
X-Gm-Message-State: AO0yUKU6/SMYS3+kJN2u5lQEeAFHvH3reTSMsKPX0LaPtQ1KadsDL3Qi
        oBy9yUMzvB7RtHwVMM3EtLJYMA==
X-Google-Smtp-Source: AK7set+bDbd+tDtc8yzuKVJawgRnJ7VqI7if9gpDpNki1cjNuiiSF0MocAmariVO2bQ/AAQWG2Y7+g==
X-Received: by 2002:a17:906:c001:b0:8b2:d70c:34ae with SMTP id e1-20020a170906c00100b008b2d70c34aemr27335425ejz.71.1678484760561;
        Fri, 10 Mar 2023 13:46:00 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:00 -0800 (PST)
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
Subject: [PATCH 4/9] regulator: mt6397-regulator: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 22:45:48 +0100
Message-Id: <20230310214553.275450-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/mt6397-regulator.c:400:34: error: ‘mt6397_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/mt6397-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index b9bf7ade1f8a..526acc8fbe80 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -397,7 +397,7 @@ static const struct platform_device_id mt6397_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6397_platform_ids);
 
-static const struct of_device_id mt6397_of_match[] = {
+static const struct of_device_id mt6397_of_match[] __maybe_unused = {
 	{ .compatible = "mediatek,mt6397-regulator", },
 	{ /* sentinel */ },
 };
-- 
2.34.1


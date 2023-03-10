Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353AC6B536C
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 22:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbjCJVwE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 16:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbjCJVve (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 16:51:34 -0500
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E0641B59
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:48:23 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id ay14so26006623edb.11
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=;
        b=HUdcJC4Cd5zElccuX+GbRtfxo3va0E5mAFfwm70nVNKW9fWz+h4Mm47hy+d4b5Yx1b
         8hRPjxJCB/CYJ4Ni3e6sH/OqeNrVB7Mhu/frfhdBzlFpoKmqWFR+2p/w/zwO9qMY7hxw
         gDQGFVH3GwtaDwu8pooTrF1dvRJAvj6ZLbuEHWyuMUbT8e65YI17iUIVHwqPDKttWlR8
         0jI0k+N0klRxt5SdhxBlnFNzMsqIYzPP9d4DiisRSqecYBvd/Vvy2Ayt01LjJRw59ReL
         Zh7Ky9BdfEHdUuKsLXy9qNyzH3K50nYuyGGhPOfMSAbrVYWWGevxcNyamWZZamNET7T1
         qtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=;
        b=JfjGy7A1uTPRwQ8V7sAQXAlTCgBCzTQG2v9dK5rKWZEh2UZ8sLuQ7KM8gu/6YgY4Qj
         UKyemPG9WzgoRYnPY9oQcWhTfzGYgIzFHV/AcbiHt3sKTiHWmvYG7kyRPs6D2BlR5zB0
         NLSBYnb2qnX1qZAtsE/F0o0t5KhX3AwOT1jv/5cVm0tkuag15GrtZ1l1H4bUAvPvyGtF
         fGkbVFNzonyoyxkshyXfsgJt5t97Qx6XSiT/J1QahsHyYIqfFBpqkftKfGexcmvF+JVg
         CsTjgmzxc0nTLVsv6dM8NPyXm9Px9QxRbBk60avAGfFi3aYp3uEqj7DnTf19EWQFnwr5
         hmeg==
X-Gm-Message-State: AO0yUKW+JBh7vD+V01De1MMY//RBpb37c27KnAHQ/JiVSjQFQSIQKsba
        llmVUYyUQWGDLWXQErmnnBEdbw==
X-Google-Smtp-Source: AK7set+FDz8JZEWAMgcBwbvkCP7C1J/GKrOFdld1I4i17Xvc2r83YnSVN8MhDyC9T68rpj0eW9DONA==
X-Received: by 2002:aa7:c2d1:0:b0:4ca:4a5:91bb with SMTP id m17-20020aa7c2d1000000b004ca04a591bbmr26053986edp.13.1678484764382;
        Fri, 10 Mar 2023 13:46:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:03 -0800 (PST)
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
Subject: [PATCH 7/9] regulator: rpi-panel-attiny: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:45:51 +0100
Message-Id: <20230310214553.275450-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/regulator/rpi-panel-attiny-regulator.c:390:34: error: ‘attiny_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 34514976475e..3953fc1f389f 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -396,7 +396,7 @@ MODULE_DEVICE_TABLE(of, attiny_dt_ids);
 static struct i2c_driver attiny_regulator_driver = {
 	.driver = {
 		.name = "rpi_touchscreen_attiny",
-		.of_match_table = of_match_ptr(attiny_dt_ids),
+		.of_match_table = attiny_dt_ids,
 	},
 	.probe_new = attiny_i2c_probe,
 	.remove	= attiny_i2c_remove,
-- 
2.34.1


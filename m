Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBCF363D38
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbhDSISG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:18:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50428 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbhDSISE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 04:18:04 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP65-0007ts-NF
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 08:17:33 +0000
Received: by mail-ej1-f71.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so3353106ejz.5
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBlSlGEgsRYkWadTEY1QTDX93GegaXkwf2V4Jg/WsDg=;
        b=osWP921UHGVnZhFcwXGir5pbbLThS/Qxf4mBRFgJsi5gb78MQ+/p1BBxLioFxeIPo3
         DMmzM6pwGs9TCc3GeCfS4Lq0uM19is/uko+Oh6ZsP7PbWrsbqUS474E/5VBpAApfWJ+m
         gEnH/DtpOvyqXm47nHIg8fEZ3f1LMSFvZd8dqrCP1IfkUmONd1ENm1fp9omMJDPLH1wF
         hQ9YvpLbBc66gXIhkVrFCUHDXsTFPeSm6kFUb8WJVWTISWzEHeFyWD8rZ/N0tPeI3NgL
         rlBLFs2q1FLPixWOZMTXh9cpj9Q3Ls2wMr+7S3D1Wka0uxv9tVrT7eB6dRDebJ7ygf5Z
         LHmQ==
X-Gm-Message-State: AOAM530GGm1TVr8e20PKcIm0H+TlC9XR7rlRi07CE0SwvlJZ5Jj7kzjA
        i/UzkVLi5lDa/fD//uvNKU5cCAQJxKfiX7fC7IxpubxKy7M9+3t5psjCqveuw4QQWYVLI4jgCqd
        cnelIenHMZwAZhy8WwRF8ueO7fZZt+YcNkTfUPcU=
X-Received: by 2002:a17:906:5e15:: with SMTP id n21mr20554430eju.57.1618820253487;
        Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg+swdgj8EuewfKecTej+k1qH/AS1lZ95oqPWPHenRPBZ4PUCtQ7xGMn+3SRt0O+PhuF3UZw==
X-Received: by 2002:a17:906:5e15:: with SMTP id n21mr20554419eju.57.1618820253361;
        Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/7] mfd: da9052: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:22 +0200
Message-Id: <20210419081726.67867-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/da9052-i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index 47556d2d9abe..5d8ce8dca3fc 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -154,13 +154,8 @@ static int da9052_i2c_probe(struct i2c_client *client,
 		return ret;
 
 #ifdef CONFIG_OF
-	if (!id) {
-		struct device_node *np = client->dev.of_node;
-		const struct of_device_id *deviceid;
-
-		deviceid = of_match_node(dialog_dt_ids, np);
-		id = deviceid->data;
-	}
+	if (!id)
+		id = of_device_get_match_data(&client->dev);
 #endif
 
 	if (!id) {
-- 
2.25.1


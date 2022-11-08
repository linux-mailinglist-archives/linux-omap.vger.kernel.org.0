Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4875621B90
	for <lists+linux-omap@lfdr.de>; Tue,  8 Nov 2022 19:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbiKHSMI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Nov 2022 13:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbiKHSME (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Nov 2022 13:12:04 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3160E59FD1
        for <linux-omap@vger.kernel.org>; Tue,  8 Nov 2022 10:12:02 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id o4so22300745wrq.6
        for <linux-omap@vger.kernel.org>; Tue, 08 Nov 2022 10:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZusLhzKKZ9ZvXwH/3HZ+FFn0DEP+Zib5GkEH1QOxmpA=;
        b=TN4Kwq+GRjs5+zBvs1r+RGwFJlxGXQnDNX2FUczEPoh4sFnBht35WaD3gP66abT6bA
         4zwLVWULr58InVVYA+v0eGF9y1tELhTOccAdkikdImsNKMqLEarKsnalnyH2AJXDfJCH
         /fXnfYwQqbxzbjyJfYJV4tigjgjZajeV0lSH/C54DM9E4vp0IyNqlJ8tTsVju5vNKrzm
         qoSBuO3tLxLXDKQJwlM+EBW+NbxUd4GBaK+jwdjA9XgjDh0/8hIY3lS2q6hjG+OJs19h
         msrm5Bf4OQ2lt7alUFdQl+IQd2lXZSSsDKGzG8ennGFtTpgTuC8Qmx0ICnCRK8PLN9mC
         fM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZusLhzKKZ9ZvXwH/3HZ+FFn0DEP+Zib5GkEH1QOxmpA=;
        b=UgBe4QZZ9OS2WHEc8+ruUJJhQr4sVtKjkU4ofquY8iUkwEAVE5H4x/Atqx4CQkKt0b
         ceUFi9lbupvN8OOvUvomU+p2JKAJXcNWhoqnyCKg2O6GrAVgDe9/jwn+w6Lo00kjcYZz
         T8QLU351uyjJbed5Y3eByoQrS0CxUqTvHW/IgmVgP+FhpoeUBXLI+M59VQxRuyrVUhF0
         hDDgsAqIKX6vRqMM9SB2h6b19nvoGCeXubhmlpV4gH+Pa2VHk1fKLx0wDjeDavotUWZn
         d0ph0TrHNK+VXBugXA3x7sSvASUqN4OXGTlGx8vfquej5rjx4bcIvUrfvUtV/2rS6tVB
         nNDw==
X-Gm-Message-State: ACrzQf1aDUXNjSIjVizOvFjKbbywz5V/sNdd+fLXNNz1Vms9yGOYS5dE
        hbVfOGO5bNnfj2x81UT6n79wOw==
X-Google-Smtp-Source: AMsMyM4nmhFv4quY2vYfgtOUKdpkQVOiWer4D8KXYpzbCouckdtHyHJWCKbwiPT2dMzbP5aR8ISXRA==
X-Received: by 2002:adf:dc82:0:b0:236:e2b2:6f01 with SMTP id r2-20020adfdc82000000b00236e2b26f01mr28675227wrj.358.1667931120754;
        Tue, 08 Nov 2022 10:12:00 -0800 (PST)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:7d10:e9e8:fd9a:2f72])
        by smtp.gmail.com with ESMTPSA id q12-20020a5d61cc000000b002238ea5750csm13037109wrv.72.2022.11.08.10.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:12:00 -0800 (PST)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     nm@ti.com, ssantosh@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.ujfalusi@gmail.com,
        vkoul@kernel.org, dmaengine@vger.kernel.org,
        grygorii.strashko@ti.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     khilman@baylibre.com, glaroque@baylibre.com, nfrayer@baylibre.com
Subject: [PATCH v4 4/4] net: ethernet: ti: davinci_mdio: Deferring probe when soc_device_match() returns NULL
Date:   Tue,  8 Nov 2022 19:11:44 +0100
Message-Id: <20221108181144.433087-5-nfrayer@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108181144.433087-1-nfrayer@baylibre.com>
References: <20221108181144.433087-1-nfrayer@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When the k3 socinfo driver is built as a module, there is a possibility
that it will probe after the davinci mdio driver. By deferring the mdio
probe we allow the k3 socinfo to probe and register the
soc_device_attribute structure needed by the mdio driver.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
---
 drivers/net/ethernet/ti/davinci_mdio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 946b9753ccfb..095198b6b7be 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -533,6 +533,10 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 		const struct soc_device_attribute *soc_match_data;
 
 		soc_match_data = soc_device_match(k3_mdio_socinfo);
+
+		if (!soc_match_data)
+			return -EPROBE_DEFER;
+
 		if (soc_match_data && soc_match_data->data) {
 			const struct k3_mdio_soc_data *socdata =
 						soc_match_data->data;
-- 
2.25.1


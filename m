Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0239A523F71
	for <lists+linux-omap@lfdr.de>; Wed, 11 May 2022 23:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbiEKV23 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 May 2022 17:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242274AbiEKV22 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 May 2022 17:28:28 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F6B6E8E5
        for <linux-omap@vger.kernel.org>; Wed, 11 May 2022 14:28:26 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d25so3042131pfo.10
        for <linux-omap@vger.kernel.org>; Wed, 11 May 2022 14:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLKatxVhPsq6pfYbvJ1VD3CaIFC32VSzM2/Xwj7I4zw=;
        b=FpFlnZ8rrgMKvnwMiJ9oJRDdSUvZMl2q/zx5xxF21bryvooVqZBv0HrHsxjB46ZO/B
         3dJACFkypbNZMMCXYb8fZGhfw6fFCTBYzrgAzHqmwNn06nZZu9k/WQUHgMA0JavT+tiH
         bgkf2xZfmjASdDy5Yy8/lwHz7sKFe3m2c7k6HZzK8LtDPx+cWH8cj1HUTucmicIYka+z
         ST6vbMcQjzWOBgWX8vekgLvCxQBHJwoFLdIsUBeOnuy4JajLmBJDTtZSnLcrMg07yNls
         JE4mDKQLPJrXz8qzhM83Fa/KVDnmV/uwZ9z15NSF6sMDB2qFBA+lTlJ+zH1nXY5HMFBH
         Jlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLKatxVhPsq6pfYbvJ1VD3CaIFC32VSzM2/Xwj7I4zw=;
        b=iKlIziHSCA5bNNP//1xFIagUYRwyqNTkr5uZxty8fE94wkm3I6umRQMNnOjmwn3P0I
         Du+Ws1GjRC7MZATS3S/NVkEpDSSikAgYzwIS6Owqg54wO7SXb3pq+GH8j+RrqPR/OTdh
         H2myoh3wtjvAbuE7nIo/xB0ZJmULPDAAv04HCHqet1ueZ5vaamRd+1iU3H5T7wuNrv+L
         OO/ssevQH8PA04G84EjPqaBNrGSNK7C/fwglXW0iVL8LdE8ykfiIw9wy70FXUPfizaOR
         RPtV6sU4fB+Q48pGyq17kPHxqFE4+CYas6PmYhNdpXsESxZ6IU5vfvvl51oVjKXAub6L
         f09w==
X-Gm-Message-State: AOAM532CU+MsnDJzZye2NhuIqLqYB2lT/xkzqbIJFzNcSu7yEtJ2DDl9
        r9CyxPNn8RueqMWaXQZOF2eTwu1czrJUes/2
X-Google-Smtp-Source: ABdhPJxALwk/3ZfqcoBZTIZEBPgiQq9DetDad6VETVCE3Xb3lsuAf+NhLLPPaymIb62vYUGTxD/vjg==
X-Received: by 2002:a05:6a00:1307:b0:50d:b02e:11df with SMTP id j7-20020a056a00130700b0050db02e11dfmr2512701pfu.4.1652304505863;
        Wed, 11 May 2022 14:28:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id l63-20020a638842000000b003c14af505eesm363845pgd.6.2022.05.11.14.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 14:28:25 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
        Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH] arm64: dts: ti: k3-am625-sk: enable ramoops
Date:   Wed, 11 May 2022 14:28:24 -0700
Message-Id: <20220511212824.3652309-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Guillaume La Roque <glaroque@baylibre.com>

enable ramoops fetures to easily debug some issues

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 0de4113ccd5d..ff22bb7887d0 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -53,6 +53,15 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
 		};
+
+		ramoops@e0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xe0000000 0x0 0x00100000>;
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x0>;
+			pmsg-size = <0x8000>;
+		};
 	};
 
 	vmain_pd: regulator-0 {
-- 
2.34.0


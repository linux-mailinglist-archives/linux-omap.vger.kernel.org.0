Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE4852A15B
	for <lists+linux-omap@lfdr.de>; Tue, 17 May 2022 14:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344439AbiEQMVY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 May 2022 08:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbiEQMVX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 May 2022 08:21:23 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000C04578A
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 05:21:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j24so9262287wrb.1
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UHPga2rv4XEPsZ7eOj3JF1r7UfBdUQqURmJTlLH2NDY=;
        b=0g8BurUM/NcaRyMYeBisBnq+KemPvbNzX6Dwli45sQLELRbXThIZ95FjJ+MUCGxv5r
         TjKFTmdDO6tGNK4DoXDOXo09IW+hdePLlTmrq6NBPrXJcvGN36FV/JW8Bryb0KaIKleT
         yumFGMZCoJFWdbQl8HHvQCb97zyo3anSzy94CIsyirBQzSCaYC9lSfLMfyKsfC+ZCTqM
         MimdUrkjjgYZ42RoCx0elKQ6kRjh8HvIgC7YJFc53eyZHc5Z8+WXJ8Cf0yVT35q/AMAm
         5Dw1OcX0/v7/8I9+8R/fm1W+xyPdM8zISsE5364KgHnuWxS7cMAaCU8TID6AegU8ageO
         c1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UHPga2rv4XEPsZ7eOj3JF1r7UfBdUQqURmJTlLH2NDY=;
        b=d1nPavomgXexP/vgcDhtgL465OmGlqOnTUrYF9ihXmWYIu/7S/tB5YQ59L7pl/yPWv
         xOCA/A/h2dWkzw7CfTmBpsZYMH4ABQ5scGTLTfefqrT/K31wsXUsm7Ob0x8yvhE0kJ2b
         gmttaQ00aoH2j1feiqqEWgkUOF5lD9C25cTnXwBBQakJQ5WvNlYaaJ0052bXXFamNR0m
         TvqWMJjAwyddxHze8cwBsGHb/LnTi7SQSNKbEBenKn1DQ/ff5qzm2uxnYSXjl32PUL4t
         2pwbSSib74dyrxnqw3/VQLyt04hxxpFGit5cQ7z/AuEpYG7jgU3fwrwnd8Qahfda0VnU
         7yvQ==
X-Gm-Message-State: AOAM532XBNv7sBwN5jczVGfSL+GJvxK1NFRT20nLjWYyB2P/rJ+ezcof
        WUu1LEtwYJaBviCEDx80uWIphuhDfTh2+HXxH5A=
X-Google-Smtp-Source: ABdhPJxo4Hfk2/PkA70p+JTbdQOMGy8TB2bhssxaWMuDrGsBE2wxZ966OlitsqB2pFHKjuuNTlgFqw==
X-Received: by 2002:a05:6000:1145:b0:20d:12f9:82c2 with SMTP id d5-20020a056000114500b0020d12f982c2mr4410678wrx.680.1652790080120;
        Tue, 17 May 2022 05:21:20 -0700 (PDT)
Received: from localhost.localdomain ([88.127.185.201])
        by smtp.gmail.com with ESMTPSA id m39-20020a05600c3b2700b003942a244ec5sm1748704wms.10.2022.05.17.05.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:21:19 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linux-omap@vger.kernel.org, nm@ti.com, vigneshr@ti.com
Cc:     praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
        khilman@baylibre.com
Subject: [PATCH v3] arm64: dts: ti: k3-am625-sk: enable ramoops
Date:   Tue, 17 May 2022 14:21:18 +0200
Message-Id: <20220517122118.2976665-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.25.1
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

Enable ramoops fetures to easily debug some issues.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in :
v3:
- run dtbs_check

v2:
- Apply script create-mem_map.py  with args given by Nishanth Menon
- Spelling fix
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 0de4113ccd5d..62d8503b5923 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -36,6 +36,15 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;

+		ramoops@9ca00000 {
+			compatible = "ramoops";
+			reg = <0x00 0x9ca00000 0x00 0x00100000>;
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x00>;
+			pmsg-size = <0x8000>;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
--
2.25.1


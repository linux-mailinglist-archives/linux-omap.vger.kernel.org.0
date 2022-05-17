Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2C5E52A181
	for <lists+linux-omap@lfdr.de>; Tue, 17 May 2022 14:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345669AbiEQM2f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 May 2022 08:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234372AbiEQM2c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 May 2022 08:28:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA79D496AF
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 05:28:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id j24so9288931wrb.1
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YrRTOGMgO9zXdnByTZCf3fblVWtGAKIL40Lb6D388lQ=;
        b=lloC694fCJ2v7wRAkxLMWjNcK8KfUEdFRA+pF3ULM8O9PAD8ZELEzWc3NuIJJOXXmX
         kj8/vUsDiMoRuQQK+W5QLAPzGdHwQ5YKj+AWXV1SggbyS83Nybdl6lCve6Ex0yNgS0sn
         uubcOpxdjuye1lYN/TTvUKC8vjrTWn5YPMAMS0PtaaEsT1iHrePN7B5h6IOx821weKEs
         T+qymkaga2GsQ7Rn24G7Vkm1QPX8sSN8y7jBV7oeK9WWnKW3wcwUaZ9Vq863rYZc4S6C
         XQmuKd6g4NKPQ/uwTVKEpIcgH2hJTwiEWgT75qqdyPk2d7LTrkIzFQKOwNJCtwbR5Ipy
         SH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YrRTOGMgO9zXdnByTZCf3fblVWtGAKIL40Lb6D388lQ=;
        b=SgXYPe8d4sTojRf6Gh8dNAHmfJgOLbK1ctIDn4on4PJhYzJ1n8nC/X9O0f36ijMGXv
         mgKbtHrxLnSAsU8KoiWnJZqfmTlwb3gX2Q+ZnIWWWjI3sGbxdPx5Dlz9yZXsRXK2AHxz
         876zNnwS+h/UXYo2THzw1fkfLFHd8LK+4ePMNVLjYVOGrRYiHEA8dMIApKT+s5Pxycvq
         eaPiG6o0jIi887YkogogyiQmp3zDoz8hwYIwD37rIGLgONL04duQOTQRv8gVhRUlB47H
         pfxMln9l9o/UJrR8P3cXHDOEw9ay4Ul+I/66rIm1VEMLWsoOAbkt2+KQ2USUd9ZaCI0R
         rbow==
X-Gm-Message-State: AOAM5315ih3rIpOr2rhTzq5416jMQP3C5lHv98h9eHRpy9gH3Hr0Pw9T
        Lqll7mOD9J/paflphEDnqTf9aSkfn77P0aLgRzk=
X-Google-Smtp-Source: ABdhPJzRz6PWZLnvLsKBaESWu4K8g64TIbExE9OdlnhyFdgzCES/0g6ck3h0/Kt1xqds1GiuyHKYig==
X-Received: by 2002:a05:6000:110a:b0:20d:131e:bf0c with SMTP id z10-20020a056000110a00b0020d131ebf0cmr4294667wrw.108.1652790510161;
        Tue, 17 May 2022 05:28:30 -0700 (PDT)
Received: from localhost.localdomain ([88.127.185.201])
        by smtp.gmail.com with ESMTPSA id x10-20020adfbb4a000000b0020d0435c97bsm7517928wrg.92.2022.05.17.05.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:28:29 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linux-omap@vger.kernel.org, nm@ti.com, vigneshr@ti.com
Cc:     praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
        khilman@baylibre.com
Subject: [PATCH v4] arm64: dts: ti: k3-am625-sk: enable ramoops
Date:   Tue, 17 May 2022 14:28:28 +0200
Message-Id: <20220517122828.2985179-1-glaroque@baylibre.com>
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

Enable ramoops features to easily debug some issues.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in :
v4:
- fix typo in commit message

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


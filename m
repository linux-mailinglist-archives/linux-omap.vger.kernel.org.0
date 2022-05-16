Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E6C5287A2
	for <lists+linux-omap@lfdr.de>; Mon, 16 May 2022 16:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiEPOyN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 May 2022 10:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbiEPOyN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 May 2022 10:54:13 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908CC3B2A8
        for <linux-omap@vger.kernel.org>; Mon, 16 May 2022 07:54:11 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h14so1237646wrc.6
        for <linux-omap@vger.kernel.org>; Mon, 16 May 2022 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D27O9NvkzcYCoJ4tO1dGPcBhK7hAyt3CAH7+zzdmVTA=;
        b=v2XglobJ/BUFwMX7baRJyrTSPq+j5JYPK8QA6hHqiGlCN+OtYO2GFHwwCX46wQwMjL
         Xu8Q7HZwmlu1js+FyiMrRGZ5A8v0ZnnkoFk7FVYJyRb8O0ufDne6HBBAdfxZrKF4PMcb
         bzoYvJxl+sp+zGKHhg8z5Lfs/9uzX4hr+yNQByTB+Wz0amaIfYyPJJwg8D/pvBZq+Hs1
         VZyEVhCKD+9coWO3Ju5bs7FYS71o+VyIcV93cmFP1rgY/jQlsniy/bLJi4BdcDsGfE3L
         fXPmAO8fChCZ4Fhudg/Nld8gWtRensUuV/ChGntm7hC4X+vrJZOC/QruGsvEroSNpl1r
         gLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D27O9NvkzcYCoJ4tO1dGPcBhK7hAyt3CAH7+zzdmVTA=;
        b=wueUryKyirVkkEfalin3bKuC/bykHqN3F7uBaDD9cUeGWpV0etk5PAV7mDWAMoJ46z
         bDcrn0qLWI24pkmD2PZNW30ME/gZ/S7Se4WlEYf1CJ3yZxF7wTSs3z9DYOnx3soLtiUf
         Hwzkf/aNuUTNmEWwNDRZm8mmf06d84x13T+OpAxJKI+4liBHAMffBMqL0I2yob2zFKJB
         qmtQtOMbMomo7XYhnHeq1z7pGMTbFXbuuH14O9JzXjcbNKQpBFDw/YL4PRS3Gb7zNhap
         AVMfHIXTtNrXuJXl39NZO5muAwrWPTc2oRXXbyFEB6ybgYPAyvXoWC7JcB3RbXYJZe3F
         tUgA==
X-Gm-Message-State: AOAM533sHxxjdIn4bvvEfdmJYW0LGIAdo/strdDSo340CVWspxFB6bvE
        tS646SUT/+xTKpXx46X7xYByLH/Zwl4FYinQOQ0=
X-Google-Smtp-Source: ABdhPJzySvDA5dYQHOye20fhh39zrEsQgtMMSsbLRc3vJolGHJy0b03y8OU73B6E1w/8IHIcepVW4A==
X-Received: by 2002:a05:6000:15c1:b0:20c:5825:f043 with SMTP id y1-20020a05600015c100b0020c5825f043mr14474885wry.261.1652712849861;
        Mon, 16 May 2022 07:54:09 -0700 (PDT)
Received: from localhost.localdomain ([88.127.185.201])
        by smtp.gmail.com with ESMTPSA id g21-20020a1c4e15000000b003942a244ed0sm10394700wmh.21.2022.05.16.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:54:09 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linux-omap@vger.kernel.org, nm@ti.com, vigneshr@ti.com
Cc:     praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
        khilman@baylibre.com
Subject: [PATCH v2] arm64: dts: ti: k3-am625-sk: enable ramoops
Date:   Mon, 16 May 2022 16:54:08 +0200
Message-Id: <20220516145408.1000678-1-glaroque@baylibre.com>
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

Enable ramoops features to easily debug some issues

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in v2:
- Apply script create-mem_map.py  with args given by Nishanth Menon
- Spelling fix
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 0de4113ccd5d..dfb16c29a000 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -36,6 +36,15 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;

+		ramoops@0x9ca00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xe0000000 0x0 0x00100000>;
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x0>;
+			pmsg-size = <0x8000>;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
--
2.25.1


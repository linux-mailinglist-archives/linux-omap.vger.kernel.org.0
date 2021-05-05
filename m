Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73008373CF8
	for <lists+linux-omap@lfdr.de>; Wed,  5 May 2021 16:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhEEOEM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 May 2021 10:04:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54883 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233702AbhEEOEM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 May 2021 10:04:12 -0400
Received: from mail-qv1-f72.google.com ([209.85.219.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1leI7O-000085-UJ
        for linux-omap@vger.kernel.org; Wed, 05 May 2021 14:03:15 +0000
Received: by mail-qv1-f72.google.com with SMTP id 99-20020a0c80ec0000b029017de514d56fso1696505qvb.17
        for <linux-omap@vger.kernel.org>; Wed, 05 May 2021 07:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHlNQxBMJJJPApy8J9ScRibX6GAiaOm1NP7zfEL0aKw=;
        b=QYlINe26FtZ4eVXHEB9M9QYFpetOiOsRN46vT/lT7pES/oOGWX/1c9kvEVb7XGouX7
         k9Y7sEnbRUXQVzvgwn17KM/aUHarx4PHET78cxrK8/xbIJBIR/JNfvGoSrR0PJX4Oj3A
         Jl1WQXygpbszozntZ7PpPOh+cwDLOuqkho+0QGiGECJ5B+uIJLWFPoxBvmwXb4xUcS/m
         joBbFijq6k86vi7LExnRcUQbGvMzd+UAxW8W8vaY+lJTrVFU6T4jI8dKyWIly0chn1SA
         3qFZdzlKGt2uiGgIkiJAzqwe7hLRFaHy5g1NN+pEuAs8AptCN/tQSlsS2+YD88lbT+Qz
         6lig==
X-Gm-Message-State: AOAM531vv+AMyDV1rBxf1ao2OMn3uSlw4mmwI7W4xfdC1PvGmgimk8Hb
        YLHfFzIL1TbY+nxGqAqcW3O8pPGL5/tdu1ITHU5C/nlqInKS3ru7gl47I36ovb8m9GvVF37ThB5
        th14uOvmEbyv2eWK75dsyFCF00fe0x8+LXcJPy0s=
X-Received: by 2002:ac8:118d:: with SMTP id d13mr26914115qtj.294.1620223394007;
        Wed, 05 May 2021 07:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx77jKyRL1IlHqhDJ4GD0HwdRxVnhzwQKiw5Ri5Ut4bvfEkDj1ezNgIO6TQsyv10c+hqq6OQ==
X-Received: by 2002:ac8:118d:: with SMTP id d13mr26914106qtj.294.1620223393830;
        Wed, 05 May 2021 07:03:13 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id l8sm4956754qtv.18.2021.05.05.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:03:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] ARM: dts: am5729-beagleboneai: drop unused Broadcom WiFi properties
Date:   Wed,  5 May 2021 10:00:15 -0400
Message-Id: <20210505140015.60013-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The brcm,sd-head-align, brcm,sd_head_align and brcm,sd_sgentry_align are
not used by the driver and not present in dtschema:

  arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: wifi@1:
    'brcm,sd-head-align', 'brcm,sd_head_align', 'brcm,sd_sgentry_align' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/am5729-beagleboneai.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index 149cfafb90bf..d3b2e87a6266 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -582,10 +582,6 @@ brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 
-		brcm,sd-head-align = <4>;
-		brcm,sd_head_align = <4>;
-		brcm,sd_sgentry_align = <512>;
-
 		interrupt-parent = <&gpio3>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "host-wake";
-- 
2.25.1


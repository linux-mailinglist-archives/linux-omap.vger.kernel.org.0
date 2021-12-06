Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E8D46996F
	for <lists+linux-omap@lfdr.de>; Mon,  6 Dec 2021 15:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344631AbhLFOvh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Dec 2021 09:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237563AbhLFOvh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Dec 2021 09:51:37 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61333C061746;
        Mon,  6 Dec 2021 06:48:08 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l16so22927615wrp.11;
        Mon, 06 Dec 2021 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ylDqDiNFhrFOrEMT1tjxPKQ3zdbgTTDWbVBcNfC0XE=;
        b=MHJntkDYt46qzedpP2zqt4usAx6wgIzG5NzKS2fGq/o9yKHFGpRQHgarWXYZSwvk5M
         DSzFlusXgxbU1nvBWleJB/wDRqAEp1Xwd3qv3+RuLnynGaeXo+lcbSy1y62GWQOFNsyA
         9jYyZRpCQifswmVhg/vOvnpQ7ryt5aUhcY39cPY3e42c8gBG95o8ebBrbdnORV1d9lFT
         IWJTVCd3FX45cJCGS283z8fZfv/5TwVeV5eRXSMtUuAt5Hgo4OhpKgj7NqfBybe3r/cl
         px2h66yR4GgxKyJPTCAIwjPfqWIVcQTkgX8P/w+YdpHXCS5sGu3lUAoT6RVCykDKfOzV
         nHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ylDqDiNFhrFOrEMT1tjxPKQ3zdbgTTDWbVBcNfC0XE=;
        b=bSF/Fk3BdwATwIiPqwxH9Na2+D5CvZ89OcnQfYl/ATqhWx33oeZ+vNM43w8RlXYfNm
         wKU7j15zCKQvyn9r6E9pzPz9aER/IQNWO8T+HR3FG4Wz7vEZ0ES8PbyOSe1EOiJfitNY
         JjmY5fas0DgzdkPGOp0axkklNVNROpwja7aDC+nRxAuzgsb/Iuz7uj/IrcycbxBDWnDa
         ZzP5SJsE/aV0rXOcUgrfwj8y6h2XeXo76D0lgn/mVUD91I/Y0qv/uYIrJmP7zR2NQIrD
         f2qBnxdkz92iejM7E+C/lnfx/iqxzC1y2iys41czvmgfGfSqfN6TsoYozR2L6ixuIT1t
         Gjlg==
X-Gm-Message-State: AOAM531ba5pTgub+cN1OPlEQ8XXqrshCurjQmD24yIjGAn3kTN21S0DJ
        8QrTWP0mLy9ZsbYZhPuWaNg=
X-Google-Smtp-Source: ABdhPJxXVneGFV22ol2L9whNumbVicsFNmCQxF6yvOmPrfRj9+v/SG+YLxWRATU5fN9UqoADaAZHbg==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr43448204wrs.270.1638802086965;
        Mon, 06 Dec 2021 06:48:06 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id s8sm11438291wro.19.2021.12.06.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 06:48:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: Use correct vendor prefix for Asahi Kasei Corp.
Date:   Mon,  6 Dec 2021 15:48:01 +0100
Message-Id: <20211206144802.217073-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The old "ak" vendor prefix that was never officially accepted was still
being used in some examples. Convert to the correct vendor prefix (i.e.
"asahi-kasei").

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/i2c/i2c-gate.yaml             | 2 +-
 .../devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml   | 2 +-
 .../devicetree/bindings/iio/imu/invensense,mpu6050.yaml         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gate.yaml b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
index 66472f12a7e2..bd67b0766599 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
@@ -31,7 +31,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         ak8975@c {
-            compatible = "ak,ak8975";
+            compatible = "asahi-kasei,ak8975";
             reg = <0x0c>;
         };
     };
diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
index 7e2accc3d5ce..d1a6103fc37a 100644
--- a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
+++ b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
@@ -61,7 +61,7 @@ examples:
                 #size-cells = <0>;
 
                 magnetometer@c {
-                    compatible = "ak,ak8975";
+                    compatible = "asahi-kasei,ak8975";
                     reg = <0x0c>;
                 };
             };
diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
index edbc2921aabd..d69595a524c1 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
@@ -95,7 +95,7 @@ examples:
                 #address-cells = <1>;
                 #size-cells = <0>;
                 magnetometer@c {
-                    compatible = "ak,ak8975";
+                    compatible = "asahi-kasei,ak8975";
                     reg = <0x0c>;
                 };
             };
-- 
2.33.1


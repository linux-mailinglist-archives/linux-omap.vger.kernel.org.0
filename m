Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C4E12EB79
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 22:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgABVnQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 16:43:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:21530 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgABVnQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 16:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578001394;
        s=strato-dkim-0002; d=dawncrow.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=hKRL96bIhcBPbL4+CJ/FLns1GcJoYVkm0E4YP/w84Jw=;
        b=Pbkja9DGyNDWqqW+kQZ295Qdjyds9UU/i0uCpvO5YFRENQw2fhCYlz3rCdlMs6PUFv
        Q6c0Dr5UqBeLKOH9hpvLoVZehut+8lUilGGaKIBaKjtHC5tk4X54ta59O+v5KKhQBzso
        YI9hYISUThrFCbD6Abt3yt4mYO08jSMzKjdKGn0fA8y6NFj48fYFlV7yYEbSuzdS5PMf
        +aPJT1cPd79oRVITcZL/asLt4KQ+QcaYJJ0xsmADVUcQ1bZJUacYVSHSeu5r85Dhzd9d
        YRqSUFobVh7/Kc+jJU1B3wK+JFTnwZkoAVnWV1+skjEupWbQ8g7ZSQHIKLb1SeP/AdLJ
        SO8w==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOaLnXzn3ovD+FrFdXyk="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id I099d1w02Lh8LOI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 2 Jan 2020 22:43:08 +0100 (CET)
From:   =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
To:     linux@arm.linux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com,
        bcousson@baylibre.com, tony@atomide.com, linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ARM: dts: Add dtsi files for AM3703, AM3715 and DM3725
Date:   Thu,  2 Jan 2020 22:43:03 +0100
Message-Id: <20200102214304.8225-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DM3730 is considered as omap36xx.dtsi, while the rest has:
     DM3730 | DM3725 | AM3715 | AM3703
IVA    X    |   X    |        |       
SGX    X    |        |   X    |       
Where X is "supported"

Signed-off-by: André Hentschel <nerv@dawncrow.de>
---
 arch/arm/boot/dts/am3703.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/am3715.dtsi | 10 ++++++++++
 arch/arm/boot/dts/dm3725.dtsi | 10 ++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm/boot/dts/am3703.dtsi
 create mode 100644 arch/arm/boot/dts/am3715.dtsi
 create mode 100644 arch/arm/boot/dts/dm3725.dtsi

diff --git a/arch/arm/boot/dts/am3703.dtsi b/arch/arm/boot/dts/am3703.dtsi
new file mode 100644
index 000000000000..2b994ae790c9
--- /dev/null
+++ b/arch/arm/boot/dts/am3703.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 André Hentschel <nerv@dawncrow.de>
+ */
+
+#include "omap36xx.dtsi"
+
+&iva {
+	status = "disabled";
+};
+
+&sgx_module {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am3715.dtsi b/arch/arm/boot/dts/am3715.dtsi
new file mode 100644
index 000000000000..ab328e8c0bd8
--- /dev/null
+++ b/arch/arm/boot/dts/am3715.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 André Hentschel <nerv@dawncrow.de>
+ */
+
+#include "omap36xx.dtsi"
+
+&iva {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/dm3725.dtsi b/arch/arm/boot/dts/dm3725.dtsi
new file mode 100644
index 000000000000..d24e906a14b1
--- /dev/null
+++ b/arch/arm/boot/dts/dm3725.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 André Hentschel <nerv@dawncrow.de>
+ */
+
+#include "omap36xx.dtsi"
+
+&sgx_module {
+	status = "disabled";
+};
-- 
2.17.1


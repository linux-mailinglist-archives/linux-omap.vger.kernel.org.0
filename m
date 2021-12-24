Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B41347F13E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbhLXVw4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhLXVw4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:52:56 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9930EC061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:52:55 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id j21so37284006edt.9
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :reply-to:mime-version:content-transfer-encoding;
        bh=bLPKiuECka/YE3JJhoSvhijCqaMQjSLtYjjU3gVDyq8=;
        b=GQi3Sq3qWYQu+x4crrqxzV3WRSRDF3trB5dMo5Q62UGfpSb3p7KWKysN+5nLUAhBoQ
         4nC9YpB0fmKyZ1InYBb34WlJDQFYDIf3lKCHDjqZ+k61vxsipwn2nXvKLh+eDiI1KKkF
         kts2thtNPbBL2VmgACrqDIpX+kCCMmqK/uxRdjwLjafw9PSDG0fLoV7BJDLkrji6BHs8
         UaiSgoPRKu9zyZvtJ0By9OCITbcYWB84KxU3wcDnsIfJ12jYzli4rVdXbitWLhrwv/Nd
         OgaJHfSha3Xs6LCoDBrWCPfls8o1QPMABDyOywTfjUQQctPPDvaAAw/42qvKji46rRU7
         mhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:reply-to:mime-version
         :content-transfer-encoding;
        bh=bLPKiuECka/YE3JJhoSvhijCqaMQjSLtYjjU3gVDyq8=;
        b=b9wLaCPi8wRNg7mqLCpJ+5ddSDcskbyIsc65ZOa/pOPmxOr+cSkuHBWjqJ/lGa5Dsj
         LjZa4TinREOFuG7bQPyNt7nZT/cvwQjUwl6G+fquemzfJKoaTj3NMOlwxRsHwYnICx1b
         UslyFwfkV8+K1+tSo0xw3WQl/OjKG1dB5/23Gd9FBL7Cm22P0hQG5I8+pqtd0g90Gb+r
         gmQmy42LZgNqpSOGSggXnz2ichyHbwPLJHhORnR6VhSDDsB+2PKkuuzmMB1Gj+L4yzZ/
         qPF2E0wY/rQ7JZZ5A9nTiZgI/pv8Bbu34dZz2MH30bGUQF8X/U0M2tHYPKYt6a3VTj5j
         +GDQ==
X-Gm-Message-State: AOAM5333RWk1VLUrcPfD/CigYmQKkwsrmm7oHp/suUmbwiz2mdnqIN2/
        b63Fg6xy5/gZjMsQuTKmAPTktO5o720=
X-Google-Smtp-Source: ABdhPJyHepFlhUHgKm3A6/PpNzGPyddR1kcdEX3ZbP0u9JoGtjfGHT1fGMreqPPWBw54adqE02sFbQ==
X-Received: by 2002:a17:906:888f:: with SMTP id ak15mr6382425ejc.0.1640382774229;
        Fri, 24 Dec 2021 13:52:54 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id di5sm3021692ejc.45.2021.12.24.13.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:52:53 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     peter.vasil@gmail.com, linux-omap@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: regulator: Nokia Tahvo/Betty ASIC Vcore regulator
Date:   Fri, 24 Dec 2021 22:39:21 +0100
Message-Id: <20211224214512.1583430-3-peter.vasil@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224214512.1583430-1-peter.vasil@gmail.com>
References: <20211224214512.1583430-1-peter.vasil@gmail.com>
Reply-To: peter.vasil@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Vasil <peter.vasil@gmail.com>

One of the functions of Tahvo/Betty ASIC MFD chip is a voltage regulator for
Vcore output, adjustable from 1.005V to 1.475V. On Nokia N8x0 Internet Tablet
devices, this controls power to the Epson S1D13745 framebuffer IC.
---
 .../nokia,tahvo-vcore-regulator.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/nokia,tahvo-vcore-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/nokia,tahvo-vcore-regulator.yaml b/Documentation/devicetree/bindings/regulator/nokia,tahvo-vcore-regulator.yaml
new file mode 100644
index 000000000000..5e1e98c32311
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nokia,tahvo-vcore-regulator.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nokia,tahvo-vcore-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nokia Tahvo/Betty ASIC Vcore regulator
+
+maintainers:
+  - Peter Vasil <peter.vasil@gmail.com>
+
+description: |
+  One of the functions of Tahvo/Betty ASIC MFD chip is a voltage regulator
+  for Vcore output, adjustable from 1.005V to 1.475V.
+  On Nokia N8x0 Internet Tablet devices, this controls power to the Epson
+  S1D13745 framebuffer IC.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: nokia,tahvo-vcore-regulator
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    tahvo {
+        tahvo_vcore {
+            compatible = "nokia,tahvo-vcore-regulator";
+            regulator-name = "tornado_vcore";
+            regulator-min-microvolt = <1500000>;
+            regulator-max-microvolt = <3000000>;
+            regulator-always-on;
+        };
+    };
+...
-- 
2.25.1


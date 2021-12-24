Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C19147F13D
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhLXVw0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhLXVwZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:52:25 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9129EC061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:52:25 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z29so37278889edl.7
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :reply-to:mime-version:content-transfer-encoding;
        bh=aCFRmkGW1kiPPRJMQqssI2gy7cLzuzG2T5taIc2Nj7E=;
        b=GYPJqg7+7V5S0t7MRIb3h1hxQJdA7eJ5qYHedVRAyDKEuWN1o+QGQu/yha6Kl5M7l6
         DPNXm2NEbbTkGFJgg/GNxYE0JRYTdToiIwF/tkuT5FE8iiUuUW1oWP6NszbMMWLgaM9g
         aZ/1vsleodHiB4AWnJRLG0SwPV5CagaYRRZ8xlemRp7KQWtuBHLI3z/MoPPUIZuxG5DD
         0mZnN8LA3W/HSlS+keecH6Jh1tflXzlnlVCnwnoBomJGBOX6RSYdAOvL8cdH73m5nDjr
         2AAvGIMgwTGdTarfjXSrdAaz5nr8hxzD+UH8OClL1jYWBX/UkdoCWMujDyLDGp0LnBNp
         z9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:reply-to:mime-version
         :content-transfer-encoding;
        bh=aCFRmkGW1kiPPRJMQqssI2gy7cLzuzG2T5taIc2Nj7E=;
        b=qvikWRFNAALIgbgGtDGcek9hUPrdBZVcARHFo8JQSjG0uT7OniimxJpF31MXd68S4G
         o0H9CCyhN9s2syPNaaUZfO8h4opIVo86Omz+JeyDXpqG3UcQxhMvXfJOIfvAmknF6pEh
         F1aiaybgmGk+LqTWCSItxAH0hfoTl+wjCIBLIfDExtseDyChwG3CLDlwtyLvYKnm6x5v
         JBYyExBtgS/WNbnWaF9la+6w9+MW8hKqWEUeoB6ILGFOAGrTiMB5AiMKyC7ZRPGW2zg7
         BaCt2vkU4eyDhTYbwT8Ip9ZPv3pezd2vx2H4l07mTBwtqZEwPglwIuiysIF1Sozpxew6
         Okcw==
X-Gm-Message-State: AOAM533Z/bsR0KXBPLiP/td9Fp4bORRkUoAlYSOHTDT5Nmwv5JMOicAj
        kj7n2FpfyD2zNYKsB3kC+0s=
X-Google-Smtp-Source: ABdhPJyRziL/zw/qNwTj66zOwrkHrzN1VZ6IlfBMjavgdZV+gwHbjI0KgOXJG3d4m9sXZBnYEAFzGQ==
X-Received: by 2002:a17:907:2ce3:: with SMTP id hz3mr6280563ejc.737.1640382743610;
        Fri, 24 Dec 2021 13:52:23 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id di5sm3021692ejc.45.2021.12.24.13.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:52:23 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     peter.vasil@gmail.com, linux-omap@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: leds: Nokia Tahvo/Betty ASIC LEDPWM controller
Date:   Fri, 24 Dec 2021 22:39:19 +0100
Message-Id: <20211224214512.1583430-2-peter.vasil@gmail.com>
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

One of the functions of Tahvo/Betty ASIC MFD chip is a PWM output able
to drive LED with 127 levels of brightness.
On Nokia N8x0 Internet Tablet devices, this controls the LCD backlight.
---
 .../bindings/leds/nokia,tahvo-ledpwm.yaml     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/nokia,tahvo-ledpwm.yaml

diff --git a/Documentation/devicetree/bindings/leds/nokia,tahvo-ledpwm.yaml b/Documentation/devicetree/bindings/leds/nokia,tahvo-ledpwm.yaml
new file mode 100644
index 000000000000..6f6d9e4a9425
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/nokia,tahvo-ledpwm.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/nokia,tahvo-ledpwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nokia Tahvo/Betty ASIC LEDPWM controller
+
+maintainers:
+  - Peter Vasil <peter.vasil@gmail.com>
+
+description:
+  One of the functions of Tahvo/Betty ASIC MFD chip is a PWM output able to
+  drive LED with 127 levels of brightness.
+  On Nokia N8x0 Internet Tablet devices, this controls the LCD backlight.
+
+properties:
+  compatible:
+    const: nokia,tahvo-ledpwm
+
+additionalProperties: false
+
+examples:
+  - |
+
+    tahvo {
+        tahvo_ledpwm {
+            compatible = "nokia,tahvo-ledpwm";
+        };
+    };
+
+...
-- 
2.25.1


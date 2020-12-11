Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9702D77E7
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 15:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406242AbgLKOcP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 09:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406231AbgLKOcE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 09:32:04 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE55EC06179C
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:44 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id f11so11095791ljm.8
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Bzi7zWZFpWpBLLqpvQtDsZO5++kcCplDxHRmHja9cI=;
        b=wNs3tztSbGhGSRdYNRMXcDgK6uUS0awig2xMeSst6auDjET0p9T9rOVFLI5qvluxc7
         ymXTxQ73aXPPtjzZ7UY3F6u3qOwFCq37sQyfbo1pq4b8/jW3S8/1ALQLgH1PHI2XAvL4
         Zqvel5eommqICdE6Huv/wZOYMQn9bfItnwovECGzxmyge4BRt5sIU4ZAJihXSBN6uVq+
         5jNWG3kt1MI4+RhmnpZIAup2di0tVdSpWC64hrgamWjVfCr6Fv6mlsHnlBAV3rt1Lqkn
         F6XibwLkOHliAAGLD2v8wCWzRgT9BeF8CGtuoI1badhxWovRvT0WzqM87aWYvirxuJVo
         RDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Bzi7zWZFpWpBLLqpvQtDsZO5++kcCplDxHRmHja9cI=;
        b=ncKhGhzcHckr0EQu24qxEjtrluo5Vv6Xl4tdSE0eINoT4XvHNCPDY3MmJlzpnuS+Qm
         rTeXIJH0QPJqIQaldx9dlo5CTZMKNaUMq9pHTMILBC+nDsgtRaxwMfDajGelHZ19z/eZ
         EBTgT1mYHEVq1ZlqQYkZb4rHZ+68BGEVJgVS06sVN87bEzPUWOcN1/OpgHtmtzQLRD5N
         vL2TsOpwdZ5r82KTcmxpJsJcYEpPvknimxtE3AapmKcn+UkIs6+WJEUHQhFWOEx+HouQ
         iRK1buTNNIHbBk9oEA/QwooGCA6dVkE2WmP6JsORP2S1PxpwgJ6jGUFXr02fC87lAqyB
         Wd7w==
X-Gm-Message-State: AOAM530O/xpOY337UmlzxTHnrltPHicTHr/YnFHJZTN+ZxCbsUxy2aN9
        n2jAIAAOICSTWoNncFpVc+hL8Q==
X-Google-Smtp-Source: ABdhPJzO9zBWlpmTNhxt4K9gNK6CiFckMTzOZLq2gunHPlU2EbcAdva/+hJeIHrbnLPzyuTM/Rhobg==
X-Received: by 2002:a2e:a407:: with SMTP id p7mr2894336ljn.78.1607697043341;
        Fri, 11 Dec 2020 06:30:43 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:42 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
Date:   Fri, 11 Dec 2020 15:29:29 +0100
Message-Id: <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add a YAML binding document for PRU consumers. The binding includes
all the common properties that can be used by different PRU consumer
or application nodes and supported by the PRU remoteproc driver.
These are used to configure the PRU hardware for specific user
applications.

The application nodes themselves should define their own bindings.

Co-developed-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
new file mode 100644
index 000000000000..2c5c5e2b6159
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common TI PRU Consumer Binding
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  A PRU application/consumer/user node typically uses one or more PRU device
+  nodes to implement a PRU application/functionality. Each application/client
+  node would need a reference to at least a PRU node, and optionally define
+  some properties needed for hardware/firmware configuration. The below
+  properties are a list of common properties supported by the PRU remoteproc
+  infrastructure.
+
+  The application nodes shall define their own bindings like regular platform
+  devices, so below are in addition to each node's bindings.
+
+properties:
+  prus:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: phandles to the PRU, RTU or Tx_PRU nodes used
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      firmwares for the PRU cores, the default firmware for the core from
+      the PRU node will be used if not provided. The firmware names should
+      correspond to the PRU cores listed in the 'prus' property
+
+  ti,pruss-gp-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    enum: [0, 1, 2, 3, 4]
+    description: |
+      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
+      This selects the internal muxing scheme for the PRU instance. Values
+      should correspond to the PRU cores listed in the 'prus' property. The
+      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
+      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
+      same slice in the associative array. If the array size is smaller than
+      the size of 'prus' property, the default out-of-reset value (0) for the
+      PRU core is used.
+
+required:
+  - prus
+
+dependencies:
+  firmware-name: [ prus ]
+  ti,pruss-gp-mux-sel: [ prus ]
+
+additionalProperties: true
+
+examples:
+  - |
+    /* PRU application node example */
+    pru-app {
+        prus = <&pru0>, <&pru1>;
+        firmware-name = "pruss-app-fw0", "pruss-app-fw1";
+        ti,pruss-gp-mux-sel = <2>, <1>;
+    };
-- 
2.29.0


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBC12DC4B5
	for <lists+linux-omap@lfdr.de>; Wed, 16 Dec 2020 17:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgLPQyQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Dec 2020 11:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgLPQyP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Dec 2020 11:54:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAD3C061282
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 08:52:56 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o13so26869766lfr.3
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 08:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5+8efIdVtbBOyRgwR2gsKbazlVl9dyJTRR6AM0J3hA=;
        b=naV+sYPr/FeUiJPKbdTmkFZhtvKy2MlJohFV1u3ZnaiKvZDrGjU+Z2/US65bBUa7im
         ak++7BQirUk8jgjX4Wgfy4hhi9QC++hUHWbpYH+EsPDunSA7ztqnvU1TlD+E0CUzIA1n
         KahlnGo+D/L5gdYR++KqfeC0lo4rLpbNLedOwuATKjyX8cdyLhNsE0WyaxaElzxj7H1G
         ZxDoWdPKVyihee6Mf6O3HbLlSzPwWrrK1e9CRKgGaUmRrSGisZ3JQUmUr48q7Vwpad5G
         rGEDEcAezUrak2k2C1gnJEYwlGwgymjWFX8LZ8fmfmxYvkSLSh5S6GHOEjBYArh73O/W
         28Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5+8efIdVtbBOyRgwR2gsKbazlVl9dyJTRR6AM0J3hA=;
        b=RvSZ/qRBVurVeA3vk1i9SCrJrWha1taUYtFpkGDh8AltaSLtqtfIoks941ugY2+kA1
         HMbVF2Wz1R9cscMg3xcnOvo6dJ+oFFER3NTC+z98XTn2MtvBLfOB9fryXeR1bfGl+2kD
         5ep54QE6pZvWP6UemG2yyu73PD4dfoCnAkOZzi0PD7y/BPYFfQ4KwqCKpQiXABu4jGOC
         1lwLZ3wJPhyS/MlviZX3c12fyAB/GTM7TS/8nj6OsgYeG59PAHfYyA6/uAv5r0AkTDxD
         r3l59tehKImAr949H6jsJj4MJGXIkPgz3s7AIYAmKLBlapbVt2Ci4Zh3D/zQ2mmrDzcY
         aHJQ==
X-Gm-Message-State: AOAM533FIz/7V3EyJATcqm+YeodBtO9SIpYUw7myyB8fnl7EIA7lPSRI
        WKpTGRFhyxZ9ng2nYq881o5Pqw==
X-Google-Smtp-Source: ABdhPJz6dLYEFbMk50Y/Jv+SKtcOl2M/+YqNdLfUXkfBdGXJO8ecriLaUdGxdKhrDWMRvcdFMS2LdQ==
X-Received: by 2002:a05:6512:687:: with SMTP id t7mr12789469lfe.432.1608137573634;
        Wed, 16 Dec 2020 08:52:53 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id t3sm281645lfe.263.2020.12.16.08.52.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 08:52:53 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com, t-kristo@ti.com
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
Date:   Wed, 16 Dec 2020 17:52:35 +0100
Message-Id: <20201216165239.2744-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
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
v1->v2:
- Change the 'prus' property name to 'ti,prus' as suggested by Rob
  Herring.
---
 .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
new file mode 100644
index 000000000000..d6de34f9e6f1
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
+  ti,prus:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: phandles to the PRU, RTU or Tx_PRU nodes used
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      firmwares for the PRU cores, the default firmware for the core from
+      the PRU node will be used if not provided. The firmware names should
+      correspond to the PRU cores listed in the 'ti,prus' property
+
+  ti,pruss-gp-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    enum: [0, 1, 2, 3, 4]
+    description: |
+      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
+      This selects the internal muxing scheme for the PRU instance. Values
+      should correspond to the PRU cores listed in the 'ti,prus' property. The
+      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
+      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
+      same slice in the associative array. If the array size is smaller than
+      the size of 'ti,prus' property, the default out-of-reset value (0) for the
+      PRU core is used.
+
+required:
+  - ti,prus
+
+dependencies:
+  firmware-name: [ 'ti,prus' ]
+  ti,pruss-gp-mux-sel: [ 'ti,prus' ]
+
+additionalProperties: true
+
+examples:
+  - |
+    /* PRU application node example */
+    pru-app {
+        ti,prus = <&pru0>, <&pru1>;
+        firmware-name = "pruss-app-fw0", "pruss-app-fw1";
+        ti,pruss-gp-mux-sel = <2>, <1>;
+    };
-- 
2.29.0


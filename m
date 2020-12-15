Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFEEE2DADBF
	for <lists+linux-omap@lfdr.de>; Tue, 15 Dec 2020 14:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgLONG5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Dec 2020 08:06:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36170 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbgLONGu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Dec 2020 08:06:50 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD4JVD035358;
        Tue, 15 Dec 2020 07:04:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1608037459;
        bh=kh1JyF3myH9RigEpk6YlMVXN1XqHXg4sQ+Mvc4uclGU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cgn3PlV1xMKPyBJekMu8/0uS5SpY7Eo4U7o68m/SaHRoxSlFs/nY5cMlryyl2JpsW
         HkLUPRDqUM4eA0lw+FG80s174wKvXI9yLe8MI+oBXGMqbZ9J81vQl+au3KDxkbQ4Hd
         L6XYd1UttQ5C+EWR8MSDb6nbR1pfskYUbvRbwhlU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD4JwR087832
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Dec 2020 07:04:19 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:04:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:04:18 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD49vM024224;
        Tue, 15 Dec 2020 07:04:16 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <jarkko.nikula@bitmer.com>, <robh+dt@kernel.org>
CC:     <alsa-devel@alsa-project.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jsarha@ti.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: ti,j721e: Update maintainer and author information
Date:   Tue, 15 Dec 2020 15:05:12 +0200
Message-ID: <20201215130512.8753-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215130512.8753-1-peter.ujfalusi@ti.com>
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

My employment with TI is coming to an end, add the copyright and author comments
as they due and change the maintainer mail address.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 .../devicetree/bindings/sound/ti,j721e-cpb-audio.yaml         | 4 +++-
 .../devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml     | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
index 805da4d6a88e..ec06789b21df 100644
--- a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 Texas Instruments Incorporated
+# Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/sound/ti,j721e-cpb-audio.yaml#
@@ -7,7 +9,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments J721e Common Processor Board Audio Support
 
 maintainers:
-  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+  - Peter Ujfalusi <peter.ujfalusi@gmail.com>
 
 description: |
   The audio support on the board is using pcm3168a codec connected to McASP10
diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
index bb780f621628..ee9f960de36b 100644
--- a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 Texas Instruments Incorporated
+# Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/sound/ti,j721e-cpb-ivi-audio.yaml#
@@ -7,7 +9,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments J721e Common Processor Board Audio Support
 
 maintainers:
-  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+  - Peter Ujfalusi <peter.ujfalusi@gmail.com>
 
 description: |
   The Infotainment board plugs into the Common Processor Board, the support of the
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


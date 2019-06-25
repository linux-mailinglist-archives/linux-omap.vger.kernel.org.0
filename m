Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB3C55C58
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 01:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfFYXd1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 19:33:27 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35406 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfFYXd0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 19:33:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXLQ8119957;
        Tue, 25 Jun 2019 18:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561505601;
        bh=1DErTvT2KlLb2z9kFjTlCdKTYhl3D5n6LbvTFoH70Js=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zWtAh9YRDFqR5Uxg8wxcTAZWHyUGYnq+DSop2/GhuLsP9rbm9T7bV/Q5WiVusk0gm
         ns8wHEae7HLjazGWH67n0BISQh8biZkUpWZLr1eERdYFyDVxprSTje8QT9uL6ayV1J
         M6zAVaHOarTnU6ksAfH/5SmDpOh0eXjnaVRySl6U=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PNXLpV023544
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Jun 2019 18:33:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 25
 Jun 2019 18:33:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 25 Jun 2019 18:33:21 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXLAH021963;
        Tue, 25 Jun 2019 18:33:21 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x5PNXKm12229;
        Tue, 25 Jun 2019 18:33:20 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/5] dt-bindings: ti-sysc: Add SPDX license identifier
Date:   Tue, 25 Jun 2019 18:33:12 -0500
Message-ID: <20190625233315.22301-3-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625233315.22301-1-s-anna@ti.com>
References: <20190625233315.22301-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the appropriate SPDX license identifier to the common
TI sysc bindings header file.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 include/dt-bindings/bus/ti-sysc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/bus/ti-sysc.h b/include/dt-bindings/bus/ti-sysc.h
index 7138384e2ef9..babd08a1d226 100644
--- a/include/dt-bindings/bus/ti-sysc.h
+++ b/include/dt-bindings/bus/ti-sysc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* TI sysc interconnect target module defines */
 
 /* Generic sysc found on omap2 and later, also known as type1 */
-- 
2.21.0


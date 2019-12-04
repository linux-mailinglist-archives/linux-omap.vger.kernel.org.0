Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89153113129
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 18:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfLDRxy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 12:53:54 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58070 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbfLDRxy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 12:53:54 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrFbd023151;
        Wed, 4 Dec 2019 11:53:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575481995;
        bh=N5idhFfsXlX/1acVzF6uxJVB9ECJXLwI65LF19ADOy4=;
        h=From:To:CC:Subject:Date;
        b=UCrMLvK6Cq/hXBICCNHlvXkIzDniLCMH1MiWJXCbZE7qe2N5YgrPBKHPBrJnKPCKX
         Wcr4oFrBeHu8ZblDlaI6b4MuSbUht3wL2R0hihmkEbLfu/t2oz0Mk9XF05wqvaFfRX
         iQ0fzs8ykpjFd3P1HWh7D6ROKQNSvG6SSweyipQw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4HrFju040851
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Dec 2019 11:53:15 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 11:53:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 11:53:14 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrBu9048941;
        Wed, 4 Dec 2019 11:53:12 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH 0/2] drm/tilcdc: Remove "ti,tilcdc,tfp410" and mark  "ti,tilcdc,panel" obsolete
Date:   Wed, 4 Dec 2019 19:53:09 +0200
Message-ID: <cover.1575481630.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Nobody should any more use the old tilcdc bundled drivers anymore. The
driver is fully capable of using the generic drm bridge and panel
drivers.  However, the obsolete "ti,tilcdc,panel" binding is still
widely used in many mainline supported platforms that I do not have
access to and who knows how many custom platforms. So I am afraid we
have to keep the old bundled tilcdc panel driver around.

Jyri Sarha (2):
  drm/tilcdc: Remove obsolete bundled tilcdc tfp410 driver
  dt-bindings: display: Add obsolete note to "ti,tilcdc,panel" binding

 .../bindings/display/tilcdc/panel.txt         |   6 +
 .../bindings/display/tilcdc/tfp410.txt        |  21 -
 drivers/gpu/drm/tilcdc/Makefile               |   1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   3 -
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c        | 379 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.h        |  15 -
 6 files changed, 6 insertions(+), 419 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_tfp410.h

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


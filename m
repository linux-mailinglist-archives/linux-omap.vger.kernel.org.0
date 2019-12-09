Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595FA116F48
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 15:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfLIOmh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 09:42:37 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57326 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbfLIOmg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Dec 2019 09:42:36 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgK4k048715;
        Mon, 9 Dec 2019 08:42:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575902540;
        bh=iIPdTi3vkObZXA5TwQ23lL3Sn4gIOMSE9/ixyE3RfWc=;
        h=From:To:CC:Subject:Date;
        b=ibA8c8hrTE5yVO7Bk4hpX8ew1i7BowlvdOLgBfo+pbE7G6qscbIKfGyNptot88Vc5
         645l4Q77fe01tcKUDwpkCB+T+QgM/CdK1oMy+Iotw4oVCiBCCvnWyfbwaSbKMboHqN
         cTe7fUa0auWNt/7a2XDz06FI7DQQCUxC2StSxrc0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9EgKKl074901
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Dec 2019 08:42:20 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:42:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:42:19 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgGve122297;
        Mon, 9 Dec 2019 08:42:17 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH v2 0/3] drm/tilcdc: Remove "ti,tilcdc,tfp410" and mark "ti,tilcdc,panel" obsolete
Date:   Mon, 9 Dec 2019 16:42:13 +0200
Message-ID: <cover.1575901747.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since v1:
- Add Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  to "drm/tilcdc: Remove obsolete bundled tilcdc tfp410 driver"
- Add "drm/tilcdc: panel: Add WARN() with a comment to tilcdc-panel probe"

Nobody should any more use the old tilcdc bundled drivers anymore. The
driver is fully capable of using the generic drm bridge and panel
drivers.  However, the obsolete "ti,tilcdc,panel" binding is still
widely used in many mainline supported platforms that I do not have
access to and who knows how many custom platforms. So I am afraid we
have to keep the old bundled tilcdc panel driver around.

I'll wait with merging the "ti,tilcdc,panel" patches until these
patches have been merged:
https://lists.freedesktop.org/archives/dri-devel/2019-December/247301.html
https://lists.freedesktop.org/archives/dri-devel/2019-December/247594.html
So I can refer to them as an example in the comments. 

But I'll merge "drm/tilcdc: Remove obsolete bundled tilcdc tfp410
driver" trough drm-misc in couple days if I do not hear any
objections.

Jyri Sarha (3):
  drm/tilcdc: Remove obsolete bundled tilcdc tfp410 driver
  dt-bindings: display: Add obsolete note to "ti,tilcdc,panel" binding
  drm/tilcdc: panel: Add WARN() with a comment to tilcdc-panel probe

 .../bindings/display/tilcdc/panel.txt         |   6 +
 .../bindings/display/tilcdc/tfp410.txt        |  21 -
 drivers/gpu/drm/tilcdc/Makefile               |   1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   3 -
 drivers/gpu/drm/tilcdc/tilcdc_panel.c         |  10 +
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c        | 379 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.h        |  15 -
 7 files changed, 16 insertions(+), 419 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_tfp410.h

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


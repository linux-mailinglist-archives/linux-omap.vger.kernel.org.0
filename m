Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDCDE7201
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389245AbfJ1Mm7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:42:59 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54456 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389229AbfJ1Mm6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:42:58 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgvPc067052;
        Mon, 28 Oct 2019 07:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266577;
        bh=Yz1BgUME6cvxTTqAS0w5bXD+zTBDG2uq+6hnZdt0R4M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GtxJLjhiK7D+ofcX6HEQPIEpw7ocMXBawr+nOqYTSlOj0eznVkTpT7LA6C4n+nem6
         I+SyG2koZkG8z9f00pt8l4xrE7ebsv5mRvUtczNYPYMNG8RUYB3WNUDhGBOapklzZ1
         mk0zeylUs82ISrfuWsZ/wStpvxo7uw+NujPjLBIY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SCgvue074467
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:42:57 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:42:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:42:45 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgogs063574;
        Mon, 28 Oct 2019 07:42:55 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 02/17] remoteproc/omap: Switch to SPDX license identifiers
Date:   Mon, 28 Oct 2019 14:42:23 +0200
Message-ID: <20191028124238.19224-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028124238.19224-1-t-kristo@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Use the appropriate SPDX license identifiers in various OMAP remoteproc
source files and drop the previous boilerplate license text.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
index f6d2036d383d..1e6fef753c4f 100644
--- a/drivers/remoteproc/omap_remoteproc.h
+++ b/drivers/remoteproc/omap_remoteproc.h
@@ -1,35 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
 /*
  * Remote processor messaging
  *
  * Copyright (C) 2011 Texas Instruments, Inc.
  * Copyright (C) 2011 Google, Inc.
  * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- *   notice, this list of conditions and the following disclaimer.
- * * Redistributions in binary form must reproduce the above copyright
- *   notice, this list of conditions and the following disclaimer in
- *   the documentation and/or other materials provided with the
- *   distribution.
- * * Neither the name Texas Instruments nor the names of its
- *   contributors may be used to endorse or promote products derived
- *   from this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
 #ifndef _OMAP_RPMSG_H
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

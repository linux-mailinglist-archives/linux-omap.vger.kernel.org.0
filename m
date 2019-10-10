Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5D6D2280
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 10:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733183AbfJJIVW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 04:21:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41352 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733171AbfJJIVW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 04:21:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LDlK124177;
        Thu, 10 Oct 2019 03:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570695673;
        bh=v+aHyvI5bQJgIm9EBPSgjVf4wn8nsgL9LdT/0uGlq6I=;
        h=From:To:CC:Subject:Date;
        b=B4+V8GfgZ3hy79Dqd0Ug2HplVejMcgcjUiC7E+AEjKdwCtdF++ZperGDOvYTjette
         ohwHf8ZqSuTWz9GcX92UXfNDbZCF/eJymuyIh6gE8ytSknzeCXVCBB7U3bBdqvYa/Z
         VPwbcJWGzC8YJrUvSd/z/dKs1h2+Yu+gI20nugbU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A8LDIv104139
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 03:21:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 03:21:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 03:21:12 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LAtA012630;
        Thu, 10 Oct 2019 03:21:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 0/5] ARM: dts: omap4+: Add PRM nodes for reset support
Date:   Thu, 10 Oct 2019 11:21:03 +0300
Message-ID: <20191010082108.15448-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

This series adds the OMAP PRM nodes for reset support for am3, am4,
omap4, omap5 and dra7 SoCs. The driver support has been queued up by
Santosh [1].

-Tero

[1] https://patchwork.kernel.org/cover/11179573/


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

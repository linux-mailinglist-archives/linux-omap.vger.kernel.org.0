Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A319FC4F
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfH1H5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48480 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfH1H5D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uwAR014887;
        Wed, 28 Aug 2019 02:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979018;
        bh=VdXrExgyaXcOAe+YurJLt+xFYNVg90SxQDxdtAksr2c=;
        h=From:To:CC:Subject:Date;
        b=ZxrzXh49uLTntOlkKMcTimJ0H1Y2C5reEPDOS0T2ryiTbl1rIy2ZGKHr6PoGfRhMV
         rrCbrVsV2BN7shiym9brnqZt0CYdq78jK2KD/tL3hrW+ka2Eiuhyq7aXbalcOQHSfe
         aJvuPLMwzIupDXncZQY4sC/WyfiE3Bl1or4SrVmc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7uwx9127375
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:56:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:56:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:56:57 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFj107124;
        Wed, 28 Aug 2019 02:56:56 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 00/10] ARM: dts: omap changes for IOMMU / reset support
Date:   Wed, 28 Aug 2019 10:56:34 +0300
Message-ID: <20190828075644.4493-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series adds reset nodes for OMAP4+ family of SoCs, and fixes the
IOMMUs to support these also.

This series depends on the earlier posted clock series [1], PRM support
series [2], and the pdata quirks [3] and [4].

-Tero

[1] https://marc.info/?l=linux-clk&m=156697558331203&w=2
[2] https://marc.info/?l=linux-omap&m=156697680731569&w=2
[3] https://marc.info/?l=linux-omap&m=156517109506492&w=2
[4] https://marc.info/?l=linux-omap&m=156697839332083



--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC6FA368D
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 14:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfH3MSh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 08:18:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39230 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbfH3MSh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 08:18:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UCIRSs119921;
        Fri, 30 Aug 2019 07:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567167507;
        bh=snTTmJmckSgiJtRBVI0YVB/NDSXaOu6BJL2FsvLymhs=;
        h=From:To:CC:Subject:Date;
        b=aGm2C+xLI31fMTlzAls4CpjG2fPmxqLu6RjN96n2nCwfLEFNi4qUF59EWkf+yoKVu
         e9FhObmXPltfw19e2e1nx0L2rk3Mq8coKeONKV2YJo0l9wccQdkdkkfaOf38bnIvmo
         COL4aJQLUO4dwnYPfUKCICKVqe8+yjxHTdgbgXac=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UCIRiC128353
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 07:18:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 07:18:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 07:18:27 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UCIP6G083824;
        Fri, 30 Aug 2019 07:18:25 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv3 00/10] soc: ti: add OMAP PRM driver (for reset)
Date:   Fri, 30 Aug 2019 15:18:06 +0300
Message-ID: <20190830121816.30034-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

V3 of the series, ended up re-sending the whole series as I squashed one
patch from v2 and because of that the ordering has changed a bit. Changes
in v3 contain fixes for the comments from Philipp Zabel.

- added spinlock to protect register writes
- added own xlate function to prevent bad reset IDs to be registered
- use mask for the valid reset detection instead of parsing reset map
- fixed reset status bit handling
- used iopoll macro instead of handwritten poll loop for timeouts
- squashed patch #6 into #4 from v2 of the series
- some other minor fixes.

This series still depends on the clk driver changes for the reset<->clk
syncing [1].

-Tero

[1] https://marc.info/?l=linux-clk&m=156697558331203&w=2


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

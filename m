Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C28CCF37D
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 09:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbfJHHTf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 03:19:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34648 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfJHHTf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 03:19:35 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x987JMKp025092;
        Tue, 8 Oct 2019 02:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570519162;
        bh=rCXlC/0Ouxgo3/I2fG4Zti8IrW21Lx+Z4z7M+qCJFmc=;
        h=From:To:CC:Subject:Date;
        b=o9wT8pghy4BM4biHgi+UJL2bURwHryzXXllKdr98fzSC/Cto6AvJ0GOtsajfEzyzH
         vQuaKpy+GOa3x/JGitiHVWzXf+COIa3D/4oI9nKtfCmymLeNL5NeJU3095bwWSPmIk
         /Q6YVcYLv3IpppfCjGUmrAfiG6+7rLrk+FA0fMW8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x987JMP2046032
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 02:19:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 02:19:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 02:19:19 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x987JJj3027770;
        Tue, 8 Oct 2019 02:19:20 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv7 0/9] soc: ti: add OMAP PRM driver (for reset)
Date:   Tue, 8 Oct 2019 10:19:04 +0300
Message-ID: <20191008071913.28740-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This is just a re-send of v6 on request from Santosh to gather all
patches in a single clean series.

Applied Reviewed by tags to patch 1/9 only, (I actually dropped one
erroneous line from it also, I missed removing the clocks entry from
the examply so that one is gone; kept the reviewed by tags though)
and dropped patch 10 from the series (that one should be applied by Tony.)

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE26B0DFC
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 13:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731278AbfILLjj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 07:39:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54830 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbfILLji (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 07:39:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdOeZ125277;
        Thu, 12 Sep 2019 06:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568288364;
        bh=7Iw3fUMtV4hNW4/QB09e9+QOCc3irMbkdk0YIaz6zGA=;
        h=From:To:CC:Subject:Date;
        b=s8C+ihCg0cyec/6MhJgi/qgpDtYZZ8Ee05skQdYkW0FJJ+nbvKuqJUIvTJIoeiCGv
         GrnAL00DhUMyUYunwgnUNKK+0v6r+9ChLZ5BpLFGB1NAS2aIgq6Amumlo6kj8E6mQO
         2lAt48U+IW3znT1CVbJM1MVx8b7zW+ND+px1IIyA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CBdOMQ007757
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 06:39:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:39:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:39:23 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdKcp120606;
        Thu, 12 Sep 2019 06:39:21 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <s-anna@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
Date:   Thu, 12 Sep 2019 14:39:06 +0300
Message-ID: <20190912113916.20093-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

V5 of the series, re-sent the whole series as one patch was dropped.
Changes compared to v3/v4:

- removed dependency towards clock driver (patch #5 was completely
  dropped compared to v3/v4)
- dropped clocks property from dt binding
- re-added the pdata patch which was accidentally dropped out (it has
  dependency towards this series.)

The new implementation (without clock driver dependency) relies on the
bus driver to sequence events properly, otherwise some timeouts will
occur either at clock driver or reset driver end.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

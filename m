Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEC59FB51
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfH1HUF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:20:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52968 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1HUF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:20:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JpAn112202;
        Wed, 28 Aug 2019 02:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566976792;
        bh=jQh9SSBn95nOSdIqagWp7AmXioHLcjP6O7Zi0zdlr0w=;
        h=From:To:CC:Subject:Date;
        b=jvWE6mjv30ov9ozTrT9q5g5T7bkRdhc9z+saB5ZT0bCu7csWESY+j9/rtCMhepb2N
         +2CHGwMMgg0H5FIsdmfw3C3sbt6Z6u83xLrl+Z6UqAm6VO748sioyiMY9BhW/tlBUw
         mQtX7drMznmi6zEHqJcl8NWfENKNWErt4IVHmSWY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7JpQO082666
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:19:51 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:19:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:19:50 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JmfC052201;
        Wed, 28 Aug 2019 02:19:49 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCHv2 00/11] soc: ti: add OMAP PRM driver (for reset)
Date:   Wed, 28 Aug 2019 10:19:30 +0300
Message-ID: <20190828071941.32378-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

V2 of the series mostly has comments fixed from Suman.
- Added a link between reset + clock drivers to sync up the state between
  these; this is to avoid facing any timeout issues on either end due to
  sequencing of events (Patch #5.) This has been implemented via TI only
  private driver APIs, as at least I am not aware of anybody else needing
  similar mechanism and it is pretty SoC architecture specific.
- Dropped any powerdomain related data for now as it is not used for
  anything yet.
- Added checks against illegal reset IDs.
- Added checks for pdata validity during probe.
- Reset data is added for am4/omap5 SoCs.
- Some other minor tweaks.

This series depends on the clock driver changes [1] due to patch #5,
otherwise there will be build breakage.

Also, just as a background note, this driver has been implemented
under drivers/soc/ti due to the fact that I did not figure out any
better home for it. In its current form it would be suitable to
reside under drivers/reset, but there is a plan to extend this to
support powerdomain handling also (PRM stands for Power and Reset
Management.)

-Tero

[1] https://marc.info/?l=linux-clk&m=156697558331203&w=2


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

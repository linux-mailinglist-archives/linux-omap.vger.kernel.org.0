Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB15B2DADB0
	for <lists+linux-omap@lfdr.de>; Tue, 15 Dec 2020 14:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgLONFv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Dec 2020 08:05:51 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60648 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbgLONFs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Dec 2020 08:05:48 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD4Daa053244;
        Tue, 15 Dec 2020 07:04:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1608037453;
        bh=HZc58tX62PwkKvPlgQQvf+b5yzUbad2EgN3Bk3JTNIc=;
        h=From:To:CC:Subject:Date;
        b=q0TGzEEAco3alyV3haiAPGByEdp8UidlsJJURNP+spsKK2IFMOo0w8F89Uw32RAGM
         3TXdGM/m6nuUsCZnSK/jZIdv0IQnetctiQYH7MbiTFJIN4koEnwiiyCzQvSaopMUPt
         Uj9eCeCUxaqFdkZ7NLafBaF5+Ypt0vigJsbicw2A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD4DQJ087758
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Dec 2020 07:04:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:04:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:04:12 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD49vK024224;
        Tue, 15 Dec 2020 07:04:10 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <jarkko.nikula@bitmer.com>, <robh+dt@kernel.org>
CC:     <alsa-devel@alsa-project.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jsarha@ti.com>
Subject: [PATCH 0/2] ASoC: ti: Maintainer mail address change
Date:   Tue, 15 Dec 2020 15:05:10 +0200
Message-ID: <20201215130512.8753-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

My TI address is going to bounce after Friday (18.12.2020), switch my email
address to my private one for now.

Regards,
Peter
---
Peter Ujfalusi (2):
  MAINTAINERS: Update email address for TI ASoC and twl4030 codec
    drivers
  ASoC: dt-bindings: ti,j721e: Update maintainer and author information

 .../devicetree/bindings/sound/ti,j721e-cpb-audio.yaml       | 4 +++-
 .../devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml   | 4 +++-
 MAINTAINERS                                                 | 6 +++---
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


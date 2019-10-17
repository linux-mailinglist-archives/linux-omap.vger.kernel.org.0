Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0918DABF3
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406145AbfJQM0O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:14 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47722 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405292AbfJQM0O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:14 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQ2xB091647;
        Thu, 17 Oct 2019 07:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315162;
        bh=fMmVOfCqoVUHk+dNrTZbSqbpuNW+ocsZ+vAJ6khMGKw=;
        h=From:To:CC:Subject:Date;
        b=atK56Y0hft/Pr0Ms9Qg2zAOTY47128M9WSaa1dPk6ELTnklCoO/tXXB5TMMdDX1Ii
         YGBjsGuO5w8CFfNmWStYkJNWM9quL+rTfgXoABtBIEhsUuH7czddtkLz3kbO6G0Umu
         ZVKSlyNJtTnavuh46KbmiFg+FruerE9aS+alknlc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HCQ2u2016061
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 07:26:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:25:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:01 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNV073246;
        Thu, 17 Oct 2019 07:25:59 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 00/10] crypto: omap fixes towards 5.5
Date:   Thu, 17 Oct 2019 15:25:39 +0300
Message-ID: <20191017122549.4634-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series fixes a number of bugs with omap crypto implementation.
These have become evident with the changes to the cryptomanager, where
it adds some new test cases and modifies some existing, namely the split
update tests. Also, while fixing the cryptomanager induced bugs, some
other surfaced with tcrypt/IPSec tests, so fixed them aswell.

Patch #9 is against crypto core modifying the crypto_wait_req
common API to have a timeout for it also, currently it waits forever
and it is kind of difficult to see what test fails with crypto manager.
This is not really needed for anything, but it is kind of nice to have
(makes debugging easier.)

This series has been tested on top of 5.4-rc2, with following setups,
on AM57xx-beagle-x15 board:

- crypto manager self tests
- tcrypt performance test
- ipsec test with strongswan

This series depends on the skcipher API switch patch from Ard Biesheuvel
[1].

-Tero

[1] https://patchwork.kernel.org/patch/11188595/


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

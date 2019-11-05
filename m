Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15406EFF27
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389275AbfKEOBY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:24 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35096 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388428AbfKEOBY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:24 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1HZ0038118;
        Tue, 5 Nov 2019 08:01:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962477;
        bh=RP4Ucuajyf524U1izdJjzrZ0VRKWOJe6gn4DTKlqz8M=;
        h=From:To:CC:Subject:Date;
        b=hlAfEyurzDoPMO1PV+Bf5soNdgeTt+piP3B5R6jk4Ey0zEfsp63kSzdSmk9CjrDCf
         w+eIYY9Vuk62p7XkXzOUEhxN84kUQjmSM2qnFxIEHQXZkSBYZN4sbV7/iKNp3enJ+i
         g37on3loNZ6M514wh4qwPDK1nDndvANb3XEGGGQ4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1HSt007666
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:17 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:17 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFd068289;
        Tue, 5 Nov 2019 08:01:16 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 00/22] crypto: omap-sham: fixes towards 5.5
Date:   Tue, 5 Nov 2019 16:00:49 +0200
Message-ID: <20191105140111.20285-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series applies on top of the skcipher API conversion patch from Ard
Biesheuvel [1].

Fixes any known OMAP crypto issues with the crypto manager test suite,
including the extra tests. Tested via ipsec, tcrypt and with an
rmmod/modprobe loop while the extra tests for crypto manager are enabled.

Couple of additional bug fixes are also done, like proper cleanup of the
sysfs entries, and huge data handling for SHA.

Please note patch #9 is not related to omap-crypto, just a nice to have
tweak for testing purposes. I find it quite annoying myself that if
the HW engine is broken for some reason and hangs, the crypto manager
test suite does not throw any failure for that but just hangs itself
also.

-Tero

[1] https://patchwork.kernel.org/patch/11188595/


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

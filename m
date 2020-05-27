Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05EAB1E4206
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 14:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbgE0MYn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 08:24:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60652 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgE0MYn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 08:24:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOaK0122831;
        Wed, 27 May 2020 07:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590582276;
        bh=oJSP5+cX9ke8231P0E3sWbmgs/qaxjOijAgXEYUcRPQ=;
        h=From:To:CC:Subject:Date;
        b=UdpoE/lM9wvekTYRuiySy+jupioXmaGefisAJpeCGEzkZ2Kuz4ZSKnni1NNi7uaV5
         wObg0/ExR6L0fpcf/k5SdwHMjJ511b7gy/FpLPtJlTjVheLhX6eUt9D16I7dFQdi4U
         YCpISriiaYAyjDBYhHruczfzPbooHMJVrxHyFDfo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCOadD130228
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 May 2020 07:24:36 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:35 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOYRd101979;
        Wed, 27 May 2020 07:24:34 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [RESEND PATCHv3 0/7] crypto: omap: various fixes
Date:   Wed, 27 May 2020 15:24:22 +0300
Message-ID: <20200527122429.14888-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Resent the whole series as-per request. Only patch changed compared to
v2 [1] is patch #3. Cache flushing logic has been fixed on it based on
comments.

-Tero

[1] https://patchwork.kernel.org/cover/11540265/ 


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

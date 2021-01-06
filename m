Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5E12EC57F
	for <lists+linux-omap@lfdr.de>; Wed,  6 Jan 2021 22:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbhAFVHq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 16:07:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42506 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbhAFVHp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Jan 2021 16:07:45 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 106L5JB3039931;
        Wed, 6 Jan 2021 15:05:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1609967119;
        bh=L12PL6fV1pxKWKnarr6ev77TpWmo7Qc/1tbFWmLBank=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=b1qMYkrJQs/bY874vOcBuWO06etKG6qqMdfJbvoXaK7ldpFTPLMJJabkaVBMZOCxI
         l2cpKS/PHrWxjcpl3i7ErI4mI7WxGRog/qnPTbZbxjAYtYgbA6xpLFJx2C5iR8Xf1T
         tKNC8iLn8D4RNur6ciZP1Z2eToTFn8G4yxHZSup0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 106L5JBF027095
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Jan 2021 15:05:19 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 15:05:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 15:05:18 -0600
Received: from [10.250.66.86] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 106L5Gil109040;
        Wed, 6 Jan 2021 15:05:16 -0600
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
To:     David Lechner <david@lechnology.com>,
        <grzegorz.jaszczyk@linaro.org>
CC:     <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
        <lee.jones@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <praneeth@ti.com>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <ssantosh@kernel.org>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
 <9603a894-495b-3c73-0916-aea52f98fe9f@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <3be186ef-5f1b-c3c7-f6c9-ccac6ebecaf7@ti.com>
Date:   Wed, 6 Jan 2021 15:05:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9603a894-495b-3c73-0916-aea52f98fe9f@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 1/4/21 2:11 PM, David Lechner wrote:
> 
>> Please see the individual patches for exact changes in each patch, following is
>> the only change from v1:
>>  - Change the 'prus' property name to 'ti,prus' as suggested by Rob Herring,
>>  which influences patch #1 and patch #2
> 
> It looks like "soc: ti: pruss: Add pruss_{request, release}_mem_region() API"
> was also dropped in v2. Was this intentional?

No, it is not dropped. That patch is part of a different similarly titled
"Introduce PRU platform consumer API" series [1], which is dependent on this
series and is against a different folder (maintainer): drivers/soc/ti.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=400787


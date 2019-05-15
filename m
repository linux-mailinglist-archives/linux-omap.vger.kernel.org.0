Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 472EB1EDC2
	for <lists+linux-omap@lfdr.de>; Wed, 15 May 2019 13:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbfEOLNM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 May 2019 07:13:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56526 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729655AbfEOLNL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 May 2019 07:13:11 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4FBD9OR058630;
        Wed, 15 May 2019 06:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557918789;
        bh=1EvbyRlsOqqU6Qy/FHZ8ilhfbNaV4fjqsgFD0Yxvf2A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rD3y0QGhw60LU1XY/6XAij8GRBUZDJy42D2GvTRWThdPSiq6tIanINLhC9EIz5GTm
         o7D9TlkFevQqwpKkjDriajzd9spp5YQ83urcdlqL8ESFasPJzYwjhVzzzGJYTh/K82
         /T1QtgqD9z0JULaRfuzEzddPxPFlXDABnecu8SIQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4FBD9tk040276
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 May 2019 06:13:09 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 15
 May 2019 06:13:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 15 May 2019 06:13:09 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4FBD6dI110173;
        Wed, 15 May 2019 06:13:07 -0500
Subject: Re: [PATCH 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
To:     Mark Brown <broonie@kernel.org>
CC:     <lee.jones@linaro.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190515100848.19560-1-j-keerthy@ti.com>
 <20190515100848.19560-4-j-keerthy@ti.com>
 <20190515110851.GD5613@sirena.org.uk>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <82581f9a-5aaa-b56c-f9d5-4188b60b3e6b@ti.com>
Date:   Wed, 15 May 2019 16:43:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515110851.GD5613@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 15/05/19 4:38 PM, Mark Brown wrote:
> On Wed, May 15, 2019 at 03:38:48PM +0530, Keerthy wrote:
> 
>> @@ -172,6 +178,9 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
>>   	if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87565_Q1) {
>>   		min_idx = LP87565_BUCK_10;
>>   		max_idx = LP87565_BUCK_23;
>> +	} else if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87561_Q1) {
>> +		min_idx = LP87565_BUCK_3210;
>> +		max_idx = LP87565_BUCK_3210;
> 
> This if/else chain should be a switch statement.

Okay. I will convert that in v2.

Thanks,
Keerthy

> 

Return-Path: <linux-omap+bounces-3878-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3ACAD95A0
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 21:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6356E189FC0D
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 19:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6040F22F74E;
	Fri, 13 Jun 2025 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oqNI0oqZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4AC3FE7;
	Fri, 13 Jun 2025 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843376; cv=none; b=DjU/PcN0nYecZ1Mul5HIDwOC6mQmyb/buMLGH2DERExArViIeN87Ocx6zmt/clwbrfsOOek6rdAGYDpmlym/6BYy7YnxPpX8w69bqrYs7hLmM4yBOKg7CuFj9WkhmqGERy4x0ow2XcuOzGBFVpY+u6/POcM1Hd4/ipYUx5E95GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843376; c=relaxed/simple;
	bh=W4I5UKFGEei0TFtNkAiGwf0mYsRbiWddQC+MdG717DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p2GslI4YCmzDoa1vV2sujhfAb2BzxnjVvpty5WghwwMHiyLStFXtvHYsV5wc/wG1wEpVSz6at/rOlojpVP0Kijg8LAzDkC0ap4IyZXKCXCT0wU3DQG6MLZ2UZWA1isTNeZynrxVx7ggNEeoH8k6q1O3shS+NOP49s8kOULRisa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oqNI0oqZ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55DJZo4K3212181;
	Fri, 13 Jun 2025 14:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749843350;
	bh=c/WDngCiRjpG1UxqqDCPOLzohqNN1YopoW5BhaboqDE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oqNI0oqZ6OOD6G0vIoYdvJC0Un0InQXPjzjaSm+GptKPTc+xCYMSwfTbFcm3yJ8MS
	 7PDScGB+vh/9RjgBtCgHIOBq33EgBOmXAaAZg26f/VGPjAWx2P0LES9YyqBxVcgq8J
	 y4VeiyL+lbzz+0lsW5cJz5Yzh044qYLZxbtVbySY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55DJZod32950749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 14:35:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 14:35:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 14:35:49 -0500
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55DJZnj74021381;
	Fri, 13 Jun 2025 14:35:49 -0500
Message-ID: <b06d77bb-3b1d-4d15-94a1-05f1e04ae026@ti.com>
Date: Fri, 13 Jun 2025 14:35:49 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: tps65219: Update TPS65214 MFD cell's GPIO
 compatible string
To: Lee Jones <lee@kernel.org>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <afd@ti.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
 <20250527190455.169772-2-s-ramamoorthy@ti.com>
 <20250613131538.GS381401@google.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <20250613131538.GS381401@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 6/13/25 8:15 AM, Lee Jones wrote:
> On Tue, 27 May 2025, Shree Ramamoorthy wrote:
>
>> This patch reflects the change made to move TPS65215 from 1 GPO and 1 GPIO
>> to 2 GPOs and 1 GPIO. TPS65215 and TPS65219 both have 2 GPOs and 1 GPIO.
>> TPS65214 has 1 GPO and 1 GPIO. TPS65215 will reuse the TPS65219 GPIO
>> compatible string.
>>
>> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
>> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
>>
>> Fixes: 7947219ab1a2 ("mfd: tps65219: Add support for TI TPS65214 PMIC")
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/mfd/tps65219.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
>> index fd390600fbf0..297511025dd4 100644
>> --- a/drivers/mfd/tps65219.c
>> +++ b/drivers/mfd/tps65219.c
>> @@ -190,7 +190,7 @@ static const struct resource tps65219_regulator_resources[] = {
>>   
>>   static const struct mfd_cell tps65214_cells[] = {
>>   	MFD_CELL_RES("tps65214-regulator", tps65214_regulator_resources),
>> -	MFD_CELL_NAME("tps65215-gpio"),
>> +	MFD_CELL_NAME("tps65214-gpio"),
> Neither of these exist anywhere.
>
> I'll assume they will be available soon.

I'll be upstreaming v5 of this gpio series [0] after I complete internal reviews!
[0]: https://lore.kernel.org/all/20250425203315.71497-1-s-ramamoorthy@ti.com/

>
>>   };
>>   
>>   static const struct mfd_cell tps65215_cells[] = {
>> -- 
>> 2.43.0
>>

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer



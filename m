Return-Path: <linux-omap+bounces-3263-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F56A27AE5
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2025 20:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0ACE167416
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2025 19:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B86218AD6;
	Tue,  4 Feb 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dUmwDAYB"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8855F153828;
	Tue,  4 Feb 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696203; cv=none; b=pUowxXrrDqiiN4bDJfokm/wH+Sq9cvKhFpquZrmXoBF/jsDSzMnAIenJvW7CnMxsvu4YN1uvsManfdn06n8diFlgGwSsuO/nGzQih1jBHoW4FZBBe2dpBz4QX970MNQ10UpNZc3iH9DbOPqWav3t6+sE19WfzzDU3DPGm+tZ/Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696203; c=relaxed/simple;
	bh=b4lG0grI4DA3hkJUXvapkD8ACE9OrDCTHg9y5xuY66o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a5FAFcVjr3Kv9WVIGrjz+y+cF6fkPx24Qvc6W6HA/WRNLWIALgKGoCpamu/97WUoAcnuhfX8bsZn9xvITNoVIF++EEEWm0PodYLR8vVCfRsg4NZeCfLq/SWB00kFxdTbD3NfBsLUsyferbZm6+CSPBjsFB34xM6H6gDOv384A2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dUmwDAYB; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514J9Lb42450620
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 13:09:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738696161;
	bh=9UznfyhxXl/v9zHInozAixapXW1F8apNcxOMuxzIt5Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dUmwDAYBaSKhoQ8VLvB0cE7a6ENYXEl/1lpLNIqCn6vxUWhcjzp/lro3ALTypSU8f
	 bDyE8uapnM0kqb5Ko0Dda9osNmpRrEDfZxxy4n7CkqoNNomR/+Q3LJ33/n07CNYIXe
	 wMLVBf4P/eegmZ258V5Exg4aGysDMNdrDi+5A7+o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514J9L2k075089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 13:09:21 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 13:09:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 13:09:21 -0600
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514J9KRN014651;
	Tue, 4 Feb 2025 13:09:20 -0600
Message-ID: <4198b469-f874-431f-a2de-b4ffa2975c08@ti.com>
Date: Tue, 4 Feb 2025 13:09:20 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] regulator: dt-bindings: Add TI TPS65214 PMIC
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250131221139.342967-1-s-ramamoorthy@ti.com>
 <20250131221139.342967-3-s-ramamoorthy@ti.com>
 <746798a0-1a35-4a3f-aa9b-6edfd724bf10@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <746798a0-1a35-4a3f-aa9b-6edfd724bf10@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 2/1/25 5:42 AM, Krzysztof Kozlowski wrote:
> On 31/01/2025 23:11, Shree Ramamoorthy wrote:
>>   
>> @@ -98,6 +102,16 @@ required:
>>   additionalProperties: false
>>   
>>   allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,tps65214
>> +    then:
>> +      properties:
>> +        regulators:
>> +          patternProperties:
>> +            "^ldo[3-4]$": false
> So now, when you combined these patches, you can easily see that you are
> duplicating your other "then:" from patch #1. Just combine these into
> enum. Don't duplicate.
>
> Best regards,
> Krzysztof

Thank you for reviewing! I'll add in this feedback, and send a v5 soon pending any other feedback.


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer



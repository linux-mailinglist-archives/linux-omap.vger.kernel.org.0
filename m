Return-Path: <linux-omap+bounces-2995-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 740EBA030E6
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 20:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A903A3BF1
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 19:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3593D1D799D;
	Mon,  6 Jan 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T07Ep/6w"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56F360;
	Mon,  6 Jan 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193049; cv=none; b=N0wQh7O/LUNvHKAIvTm2vnXBAaad6lITdGGurowBnmP9BlqrCSZTqG8IP0ASGRjeX0J6v5xpJXY/k4oZuTxEkCpzOELH81g29ENSQShCD+v+frYWAO3Y2+UpmK2Ul+0641I0HXjO/9kHyYmweeN5GdKuvyN9/One0xAhKbGr/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193049; c=relaxed/simple;
	bh=EgC/Z7k7Grc9e4Ks/Ril7tMe8+6QxsHGPDbnzNI0utA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UT3PHlCNZzRLgHj9A2+eg9noAX19lS8ROEZF6E8i0y+UeV6kyXHjsUnNSHmRusjwLKQEx0pfo2iDwXDfnGX3HNL4SHX44G4Lwb88fx1seSTkxmX6vkeJjb3B6J7QGeeQi6FN8tOFIL4+cPO8wkfOeJAjXOExlHlQmfviOcowE2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T07Ep/6w; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506JoN592837882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 13:50:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736193023;
	bh=9Kt8ScPVLK6tYBQ0wEeE9yjWjm7iORURj74R0zFPyj0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=T07Ep/6wX/tSN7qwakv/ttD/uyYYraPQv/eK/oqGQNhJ4Yll8jB/Gl8BzBMMIJE4s
	 GdCzyIA2n+lFWG89/s4JbPvOVcjPOlPLDagPmcUtJLVtrPFUHXWm3j4r3H8VevCvZC
	 qZI/oIMHLadJ4R9+CW1fON2CEEwdnz/UvEWJculA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506JoNBp028795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 13:50:23 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 13:50:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 13:50:22 -0600
Received: from [10.250.35.198] ([10.250.35.198])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506JoMKV069843;
	Mon, 6 Jan 2025 13:50:22 -0600
Message-ID: <bb27a9d5-af4c-440b-972c-a50582333d0b@ti.com>
Date: Mon, 6 Jan 2025 13:50:22 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: Add TI TPS65215 PMIC
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <christophe.jaillet@wanadoo.fr>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
 <20250103230446.197597-2-s-ramamoorthy@ti.com>
 <f7wlc35b3tdonu3k34v64evnh3zypfpb42t7ixumkwjminw53r@odkwfpuru6e6>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <f7wlc35b3tdonu3k34v64evnh3zypfpb42t7ixumkwjminw53r@odkwfpuru6e6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/4/2025 4:13 AM, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 05:04:40PM -0600, Shree Ramamoorthy wrote:
>> TPS65215 is a Power Management IC with 3 Buck regulators and 2 LDOs.
>>
>> TPS65215 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs. The
>> remaining features for both devices are the same.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../devicetree/bindings/regulator/ti,tps65219.yaml       | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
>> index 78e64521d401..ba5f6fcf5219 100644
>> --- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/regulator/ti,tps65219.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: TI tps65219 Power Management Integrated Circuit regulators
>> +title: TI TPS65215/TPS65219 Power Management Integrated Circuit
>>  
>>  maintainers:
>>    - Jerome Neanne <jerome.neanne@baylibre.com>
>> @@ -12,10 +12,17 @@ maintainers:
>>  description: |
>>    Regulator nodes should be named to buck<number> and ldo<number>.
>>  
>> +  TI TPS65219 is a Power Management IC with 3 Buck regulators, 4 Low
>> +  Drop-out Regulators (LDOs), 1 GPIO, 2 GPOs, and power-button.
>> +
>> +  TI TPS65215 is a derivative of TPS65219 with 3 Buck regulators, 2 Low
>> +  Drop-out Regulators (LDOs), 1 GPIO, 1 GPO, and power-button.
> Then you need allOf:if:then: which will disallow :false two LDOs and
> their supplies.

Thank you for your feedback! I did not know about this & will add it in.

>> +
>>  properties:
>>    compatible:
>>      enum:
>>        - ti,tps65219
>> +      - ti,tps65215
> Keep things ordered, don't add whatever you add to the end of the lists.
>
> Best regards,
> Krzysztof

Noted, will make this change for the next version. Thanks!



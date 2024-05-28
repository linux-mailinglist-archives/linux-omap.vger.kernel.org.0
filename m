Return-Path: <linux-omap+bounces-1406-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843378D1DA4
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 15:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF67CB2302A
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A7816F82F;
	Tue, 28 May 2024 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxtqWQYb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE66916F28D;
	Tue, 28 May 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904453; cv=none; b=kaI10S4bASOpcNgmgPhmj4h97luLzr0W5PC01TexXCfkHoL98E//fOiOmJwIwqtpXjBaF08zXzFbdlCzPG3aKwO2vNtuBUzqH4y3xo48BULUl7kMX8CahoLYfSZjxTDmeQy/sslrFym+BnzKKv7dqUtwMqgXZXy+F6eiEGBXMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904453; c=relaxed/simple;
	bh=UtW80uEs+aWVSEa5xEsRYkywVYopLJrIjVEObYGzDgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhSykQWNpxJLzsZ5zurAY4rUD3s3uhjW7NmoJHobuNKtYeSWK8wuxq7Pdotsz/k0mCgd+8aOtqukKViO6HPlz/SBUcrjr5Hbf0KTu7foIC9hJjxa+0pI3NdpBPaRLUeKJrPqvI0TZUh7ibzgmOdqQqp12kqCgzG5lU4so/RCNsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxtqWQYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE38BC3277B;
	Tue, 28 May 2024 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716904452;
	bh=UtW80uEs+aWVSEa5xEsRYkywVYopLJrIjVEObYGzDgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxtqWQYbWJDPqjds4o2wDNQrwyx5K3/6iGNFwIsyvcRrXcmeVYs+2c1pO5C6w5CA9
	 qiz/BA7QSwMr0ctptZui2bblTMWKc4KrTMHkkmFoTeNyYl6CfijIaKVszE9YF2oohX
	 6RVNDZFWOuMFasRmmmi/8GBNrwxMo+zN3Dc0js0FU8oKRD9GK+9wsTxble6Lzk1+ef
	 wazA8+J1BNlBanmbIDHCJefQPHvkJovyNP3xx8bqVsaKpftdmUbKJmZl6gFzFaOAzS
	 rfUxYWlzjYEbN8PaElRGBYr8denMZAl54KKNsu/pCNcsVhqDF8XmYLjcMbCFsGAEwm
	 OC1vP32nVpB3A==
Message-ID: <3a29c775-4131-4047-9777-4146e6c8eed0@kernel.org>
Date: Tue, 28 May 2024 15:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
To: Andreas Kemnade <andreas@kemnade.info>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240528065756.1962482-1-andreas@kemnade.info>
 <e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
 <20240528131622.4b4f8d03@aktux>
 <f288a1c9-762c-4c66-8611-9a08d6c09bac@kernel.org>
 <20240528150647.40385d08@aktux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240528150647.40385d08@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 15:06, Andreas Kemnade wrote:
> On Tue, 28 May 2024 13:25:29 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 28/05/2024 13:16, Andreas Kemnade wrote:
>>> On Tue, 28 May 2024 12:04:22 +0200
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>   
>>>> On 28/05/2024 08:57, Andreas Kemnade wrote:  
>>>>> Convert the regulator bindings to yaml files. To allow only the regulator
>>>>> compatible corresponding to the toplevel mfd compatible, split the file
>>>>> into one per device.
>>>>>
>>>>> To not need to allow any subnode name, specify clearly node names
>>>>> for all the regulators.
>>>>>
>>>>> Drop one twl5030 compatible due to no documentation on mfd side and no
>>>>> users of the twl5030.
>>>>>
>>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>>>> ---
>>>>> Reason for being RFC:
>>>>> the integration into ti,twl.yaml seems not to work as expected
>>>>> make dt_binding_check crashes without any clear error message
>>>>> if used on the ti,twl.yaml
>>>>>
>>>>>  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
>>>>>  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++++++
>>>>>  .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
>>>>>  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
>>>>>  .../bindings/regulator/twl-regulator.txt      |  80 ----
>>>>>  5 files changed, 935 insertions(+), 81 deletions(-)
>>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
>>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
>>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
>>>>>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
>>>>> index c2357fecb56cc..4ced6e471d338 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
>>>>> @@ -50,7 +50,7 @@ allOf:
>>>>>            properties:
>>>>>              compatible:
>>>>>                const: ti,twl4030-wdt
>>>>> -
>>>>> +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml    
>>>>
>>>> That's not needed, just like othehr refs below.
>>>>  
>>> but how to prevent error messages like this:
>>>
>>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'regulator-vaux1', 'regulator-vaux2', 'regulator-vaux3', 'regulator-vaux4', 'regulator-vdac', 'regulator-vdd1', 'regulator-vintana1', 'regulator-vintana2', 'regulator-vintdig', 'regulator-vio', 'regulator-vmmc1', 'regulator-vmmc2', 'regulator-vpll1', 'regulator-vpll2', 'regulator-vsim', 'regulator-vusb1v5', 'regulator-vusb1v8', 'regulator-vusb3v1
>>>
>>> esp. the regulator parts without adding stuff to ti,twl.yaml?  
>>
>> Eh? That's a watchdog, not regulator. Why do you add ref to regulator?
>>
> hmm, wrongly indented? At what level doet it belong? But as the regualor.yaml stuff can
> be shortened, maybe just add it directly to ti,twl.yaml to avoid that trouble.

I don't follow. The diff here and in other two places suggest you add
twl-regulator reference to wdt/gpio/whatnot nodes, not to regulators.

> 
>> ...
>>
>>>>> +
>>>>> +  regulator-vaux2:
>>>>> +    type: object
>>>>> +    $ref: regulator.yaml#
>>>>> +    unevaluatedProperties: false
>>>>> +    properties:
>>>>> +      compatible:
>>>>> +        const: "ti,twl4030-vaux2"
>>>>> +
>>>>> +      regulator-initial-mode:
>>>>> +        items:
>>>>> +          - items:
>>>>> +              enum:
>>>>> +                - 0x08 # Sleep mode, the nominal output voltage is maintained
>>>>> +                       # with low power consumption with low load current capability
>>>>> +                - 0x0e # Active mode, the regulator can deliver its nominal output
>>>>> +                       # voltage with full-load current capability    
>>>>
>>>> These entries are the same. Just use patternProperties and enum for
>>>> compatible.
>>>>  
>>> hmm, if I am using that, how do I prevent e.g. constructions like this to be
>>> valid?
>>>
>>> regulator-vaux2 {
>>> 	compatible = "ti,twl4030-vaux1";
>>> };
>>>   
>>
>> Why would node name matter if you have compatible? The entire point of
>> compatibles is to not to rely on node names.
>>
> Hmm, even if we rely on them, it should somehow match what is inside that node
> usually. We have @xx and reg=<xx>; e.g. So relax the stuff to allowing

I don't follow what reg has anything to do with it. There are no reg
properties in regulator nodes.

> any regulator-.* as node name independently of the contents?

As I said: patternProperties+enum

BTW, the example in MFD (so main node) is heavily incomplete. This
should be full, complete, passing dt_binding_check example.

> 
> And since that all is then shorter, maybe add stuff just directly to ti,twl.yaml?

Sure.


Best regards,
Krzysztof



Return-Path: <linux-omap+bounces-1412-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFF8D2EC7
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2024 09:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CCDA1F2886A
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2024 07:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F421167DB5;
	Wed, 29 May 2024 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqwUe9r3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5638F96;
	Wed, 29 May 2024 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968763; cv=none; b=IDEyT2uvHvfZbaM+LrypEjRToOHFW7LI63W+JZxvuoFJ3XSJkM5pvzLNoyOODgHcXnfsUVIefIc2INp66Z26c+xWcHsdomvyCobCZZxAAVaQfcAVlOjfuS0ZsyWlYsKz8NZeIOP2kC7yXvgC4dQQy2oHR39Y+SF529AHjrWmdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968763; c=relaxed/simple;
	bh=gqmOl68+sswa4qdCKkOtou67k+TvC04WsWu3LEA+ats=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XeQYk8EkdwTOQ72tmKsQCAN3nZSaQr7JUBQTYhc8oK1Ae9iSk1Okl0fhRKKXnuEInBqusdgbbl1EGUd7Bz//zbkjhMt0pC+T2lNcYbhOUFIIL0CJHQRlzyWsCF/y1YFW38TsVMvieDfHxyIJHXrECJp4IrQ9d7TVMaKoTGWIGsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqwUe9r3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFACC32786;
	Wed, 29 May 2024 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716968763;
	bh=gqmOl68+sswa4qdCKkOtou67k+TvC04WsWu3LEA+ats=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nqwUe9r3rZLoGV7BPEmRkaa/y7QY2HPubdQOqDKeRjwuycXy6DdOz2gWhsitl48I8
	 Rb58crkIZRh5/gM3LvD3RL8k17ZQkp2nukzNXQrplAzW/LnwZKnGpA5L4j7Bkc1e9j
	 AzBe45lq0E5+WOlUsai0P0Tnlo0o7To8tA2n4p4Pira8FHhh+U0nOdAATxRQP0ekhn
	 Qm6wq/Z/rk6ib7WiGnWWX+bqFSYo9pRCIODRHHyIZ3b0RMgnANO6D3wC2W/S6J8h1p
	 v3wxthN44H8Uth5NEMRzoXxGeqHTprt95eAfwB1vfKug5P/5BqrxZnHdHDNGEKKVzg
	 H6Dn9rw2ABsHg==
Message-ID: <6b0abdaa-376c-47f1-ba9e-eaa9dd36ac27@kernel.org>
Date: Wed, 29 May 2024 09:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: regulator: twl-regulator: convert to yaml
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240528164227.1988357-1-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240528164227.1988357-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 18:42, Andreas Kemnade wrote:
> Convert the regulator bindings to yaml files. To allow only the regulator
> compatible corresponding to the toplevel mfd compatible, split the file
> into one per device.
> 
> To not need to allow any subnode name, specify clearly node names
> for all the regulators.
> 
> Drop one twl5030 compatible due to no documentation on mfd side and no
> users of the twl5030.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v2:
> - add regulators directly to ti,twl.yaml
> - less restrictions on regulator node name
> 
>  .../devicetree/bindings/mfd/ti,twl.yaml       | 110 +++++++++++++++++-
>  .../bindings/regulator/twl-regulator.txt      |  80 -------------
>  2 files changed, 109 insertions(+), 81 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> index c2357fecb56c..9dc1874a79dc 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> @@ -22,6 +22,42 @@ allOf:
>            contains:
>              const: ti,twl4030
>      then:
> +      patternProperties:
> +        "^regulator-":

Please define all nodes and properties in top-level. You can customize
them in if:then. If this gets too complicated, then maybe schema should
be split.

> +          type: object
> +          $ref: /schemas/regulator/regulator.yaml
> +          unevaluatedProperties: false
> +          properties:
> +            compatible:
> +              enum:
> +                - ti,twl4030-vaux1
> +                - ti,twl4030-vaux2
> +                - ti,twl4030-vaux3
> +                - ti,twl4030-vaux4
> +                - ti,twl4030-vmmc1
> +                - ti,twl4030-vmmc2
> +                - ti,twl4030-vpll1
> +                - ti,twl4030-vpll2
> +                - ti,twl4030-vsim
> +                - ti,twl4030-vdac
> +                - ti,twl4030-vintana2
> +                - ti,twl4030-vio
> +                - ti,twl4030-vdd1
> +                - ti,twl4030-vdd2
> +                - ti,twl4030-vintana1
> +                - ti,twl4030-vintdig
> +                - ti,twl4030-vusb1v5
> +                - ti,twl4030-vusb1v8
> +                - ti,twl4030-vusb3v1
> +            regulator-initial-mode:
> +              items:
> +                - items:

I am confused why you made it a matrix. This is an uint, so one number.

enum:
 - 0x8
 - 0xe

> +                    enum:
> +                      - 0x08 # Sleep mode, the nominal output voltage is maintained
> +                             # with low power consumption with low load current capability
> +                      - 0x0e # Active mode, the regulator can deliver its nominal output
> +                             # voltage with full-load current capability
> +
>        properties:
>          madc:
>            type: object
> @@ -50,13 +86,43 @@ allOf:
>            properties:
>              compatible:
>                const: ti,twl4030-wdt
> -
>    - if:
>        properties:
>          compatible:
>            contains:
>              const: ti,twl6030
>      then:
> +      patternProperties:
> +        "^regulator-":
> +          type: object
> +          $ref: /schemas/regulator/regulator.yaml
> +          unevaluatedProperties: false
> +          properties:
> +            compatible:
> +              enum:
> +                - ti,twl6030-vaux1
> +                - ti,twl6030-vaux2
> +                - ti,twl6030-vaux3
> +                - ti,twl6030-vmmc
> +                - ti,twl6030-vpp
> +                - ti,twl6030-vusim
> +                - ti,twl6030-vana
> +                - ti,twl6030-vcxio
> +                - ti,twl6030-vdac
> +                - ti,twl6030-vusb
> +                - ti,twl6030-v1v8
> +                - ti,twl6030-v2v1
> +                - ti,twl6030-vdd1
> +                - ti,twl6030-vdd2
> +                - ti,twl6030-vdd3
> +            ti,retain-on-reset:
> +              description:
> +                Does not turn off the supplies during warm
> +                reset. Could be needed for VMMC, as TWL6030
> +                reset sequence for this signal does not comply
> +                with the SD specification.
> +              type: boolean
> +
>        properties:
>          gpadc:
>            type: object
> @@ -69,6 +135,34 @@ allOf:
>            contains:
>              const: ti,twl6032
>      then:
> +      patternProperties:
> +        "^regulator-":
> +          type: object
> +          $ref: /schemas/regulator/regulator.yaml
> +          unevaluatedProperties: false
> +          properties:
> +            compatible:
> +              enum:
> +                - ti,twl6032-ldo1
> +                - ti,twl6032-ldo2
> +                - ti,twl6032-ldo3
> +                - ti,twl6032-ldo4
> +                - ti,twl6032-ldo5
> +                - ti,twl6032-ldo6
> +                - ti,twl6032-ldo7
> +                - ti,twl6032-ldoln
> +                - ti,twl6032-ldousb
> +                - ti,twl6032-smps3
> +                - ti,twl6032-smps4
> +                - ti,twl6032-vio
> +            ti,retain-on-reset:
> +              description:
> +                Does not turn off the supplies during warm
> +                reset. Could be needed for VMMC, as TWL6030
> +                reset sequence for this signal does not comply
> +                with the SD specification.
> +              type: boolean
> +
>        properties:
>          gpadc:
>            type: object
> @@ -134,6 +228,20 @@ examples:
>          interrupt-controller;
>          #interrupt-cells = <1>;
>          interrupt-parent = <&gic>;
> +
> +        gpadc {
> +          compatible = "ti,twl6030-gpadc";
> +          interrupts = <6>;
> +        };
> +
> +        rtc {
> +          compatible = "ti,twl4030-rtc";
> +          interrupts = <8>;
> +        };
> +
> +        regulator-vaux1 {
> +          compatible = "ti,twl6030-vaux1";

Add the initial mode and retain-on-reset properties to validate them.

Best regards,
Krzysztof



Return-Path: <linux-omap+bounces-1402-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1B8D1810
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 12:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E9A28B6F0
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC1116B72D;
	Tue, 28 May 2024 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scIku3bU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671D116ABFA;
	Tue, 28 May 2024 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890668; cv=none; b=CIa7K6l9qo/eU6Juak42oitpALM4FkgyqQaRMj+ISAWx5xp5D9rIcZ4A6nb8mz9iSYZ9fGMMiap4/c+MtzZCMeBSR2qFCjpqQgy6mDOt8k/troLHHpRwypDv2GXnDRzWxdyM3G4d/46eGTLAeu1Z5Ou9TczsI++e85/UyWGOId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890668; c=relaxed/simple;
	bh=nAx+1qaWFdCKWniYdZ782hbeVEaZL+pL+CKrnVgD2rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bmE0tVEmpePVHXeaLnOEvU6epE4f2QWFFGebV8OUrzBXplZc1+IxQuIc8VunihdcGup2T5Z08wZAOdpWIa0CRWrRf9ZcI1csTUqCxC8VqE+OcbR2mQXPz9VO0hYCO1QY3IrgggjbkJ5TISnozyoU/AFt/PHnFwFk/3ZbMI7qJ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scIku3bU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97219C3277B;
	Tue, 28 May 2024 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716890668;
	bh=nAx+1qaWFdCKWniYdZ782hbeVEaZL+pL+CKrnVgD2rU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=scIku3bUrnpZ01/wcNGVF4A54/zt3VksG/RMhU9bTDnbgm/sBc1E0CNmurkc0rYkw
	 5mXVMKmdcVFb1RvS0NiYIHXjL+SSEWXWyU4BDwBCEMbLkkoDZO7MD+ugT6eVKplc6S
	 G/7iAKR6xgZHcQOf8Wh7H1S5mC7nHYm0ZH2aFJkQ7h2PflFdju2RuD8Q4kUudJU74P
	 FqZ73FXC0htRYVU74mSOvAfUSiFymE7IuRD+bRvJ1eh7e/zkEA6DV5lJQMu2W7B6JD
	 CZvJYzw1JjUkntOfBfu3hUH8d+Ltp4mTvVn9SzTiI5gxFKTcu8+KH5TPgBoeh5JPl2
	 1I39eBtRE/RlA==
Message-ID: <e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
Date: Tue, 28 May 2024 12:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240528065756.1962482-1-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240528065756.1962482-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 08:57, Andreas Kemnade wrote:
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
> Reason for being RFC:
> the integration into ti,twl.yaml seems not to work as expected
> make dt_binding_check crashes without any clear error message
> if used on the ti,twl.yaml
> 
>  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
>  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++++++
>  .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
>  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
>  .../bindings/regulator/twl-regulator.txt      |  80 ----
>  5 files changed, 935 insertions(+), 81 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> index c2357fecb56cc..4ced6e471d338 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> @@ -50,7 +50,7 @@ allOf:
>            properties:
>              compatible:
>                const: ti,twl4030-wdt
> -
> +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml

That's not needed, just like othehr refs below.

>    - if:
>        properties:
>          compatible:
> @@ -63,6 +63,7 @@ allOf:
>            properties:
>              compatible:
>                const: ti,twl6030-gpadc
> +        $ref: /schemas/regulator/ti,twl6030-regulator.yaml
>    - if:
>        properties:
>          compatible:
> @@ -75,6 +76,7 @@ allOf:
>            properties:
>              compatible:
>                const: ti,twl6032-gpadc
> +        $ref: /schemas/regulator/ti,twl6032-regulator.yaml
>  

>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml b/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> new file mode 100644
> index 0000000000000..9623c110605ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> @@ -0,0 +1,402 @@
> +# SPDX-License-Identifier: (GPL-2.0)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/ti,twl4030-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Regulators in the TWL4030 PMIC
> +
> +maintainers:
> +  - Andreas Kemnade <andreas@kemnade.info>
> +
> +properties:
> +  regulator-vaux1:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: "ti,twl4030-vaux1"

No quotes

> +
> +      regulator-initial-mode:
> +        items:
> +          - items:
> +              enum:
> +                - 0x08 # Sleep mode, the nominal output voltage is maintained
> +                       # with low power consumption with low load current capability
> +                - 0x0e # Active mode, the regulator can deliver its nominal output
> +                       # voltage with full-load current capability
> +
> +    required:
> +      - compatible
> +
> +  regulator-vaux2:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: "ti,twl4030-vaux2"
> +
> +      regulator-initial-mode:
> +        items:
> +          - items:
> +              enum:
> +                - 0x08 # Sleep mode, the nominal output voltage is maintained
> +                       # with low power consumption with low load current capability
> +                - 0x0e # Active mode, the regulator can deliver its nominal output
> +                       # voltage with full-load current capability

These entries are the same. Just use patternProperties and enum for
compatible.


Best regards,
Krzysztof



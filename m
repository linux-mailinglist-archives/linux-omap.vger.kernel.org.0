Return-Path: <linux-omap+bounces-1517-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA4903DB1
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 15:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A1341F24F65
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 13:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486C317DE0F;
	Tue, 11 Jun 2024 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9V0wJQ0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83417D363;
	Tue, 11 Jun 2024 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113180; cv=none; b=jBLneT4BOhUqfD/hm2EY8fuD1pJIn1okD1tuRNx+cMIkq2y3emptk6k6GFNl4xmvcxTYc/Ix7nVzw+tTIbiEbeSD+3zchsVoPKpSs/G9d+836Prpl9v9XXiEVCXRa09cs8tHitkSKlpIavEa0d1HqCBBDXJkowe2JH5IKiq1F08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113180; c=relaxed/simple;
	bh=Tn9aGOOYb+LH+bFDSFJ3gb5u4+83blw2N03mcxJkcPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCtdHD9c8EYgRwb+XDB2EPMEXdzuZ1i/iJmycKivwFSUvvHgGkr9Vn6Rm6hiOarznTdvQYJywB17s6r0TmqcWSDGa5DhrYpCyACgVE30CJcz+4/SfyUIWgZxrdqLm2VW+kirZvSjnbj/lC7SkhRLPCA5TZoi5XfohKnT3u1q37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9V0wJQ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61911C32789;
	Tue, 11 Jun 2024 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718113180;
	bh=Tn9aGOOYb+LH+bFDSFJ3gb5u4+83blw2N03mcxJkcPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d9V0wJQ0TR4PWiyRJB7suPif/f/9P8jN1s2raC2Yyt/25BVEXZHt3NFTRbAqyV7Kj
	 UshYLZNhNX7CfT8hSjiHzqKjEISQSgFlX0lloEC6qxlMI9dL8wZIiGeNzQsK8E2mxp
	 W4rou+XM6DRmGS9lDZCeid961euyOKV0GBsYu8BA/4areCsiGjtAuj4f7KIQRbpyrt
	 l8yPAI8t25NqyFkyOllFI6O++CFoI7p3yVmboF7mPaCj6K+21YmRJuzr4zDGiT0K4R
	 FsS3BQdY3pdT8OuGmhkEoryuxLnY62cyzXv6MsTxNUkzIovaA0MyoSFMzuhd+Rier/
	 s92BhHAKwuhRA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c9034860dso2007361e87.2;
        Tue, 11 Jun 2024 06:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKxN8xb9LVp/LCPe5QXcE0CrZCCKh4vZSh/nuKv2PUymb3/qww59I6jPpo36QP4ry7F24vKK5ZpW9uzfPogd3LojowawtRbhhSShPAKcMdLzmiKOcnThKVJhe2dFrWDrU+HTN+RQxpfdEfRMMDGCIHsznkwqDGRYHfHng4iPWzZlHEfO8=
X-Gm-Message-State: AOJu0YwS2ZdRRTxcC0nKuNbMdzY2ViVOHwrgP71nsQK3HjZd60r+VNsV
	MXc1CHaopLAt6AZGsOQeKkHqRZQfD9IYZ38mER5xAZVFpUcT6joAVO0vNyyWS8kYcTcJLWN8OBD
	fEPterh5zVBj8YivsLJF7/QBwhA==
X-Google-Smtp-Source: AGHT+IGFUiU6exeIzAEFH36DTSIP2uz/FoyVESFoi5eHT5vpw31YK47X/5GhyzpZlDYY7TRlOrRvzOT6Gll+o03Kb2w=
X-Received: by 2002:a05:6512:3d23:b0:52c:868f:a28d with SMTP id
 2adb3069b0e04-52c868fa524mr5757868e87.50.1718113178740; Tue, 11 Jun 2024
 06:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606111611.371463-1-andreas@kemnade.info>
In-Reply-To: <20240606111611.371463-1-andreas@kemnade.info>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Jun 2024 07:39:25 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9v0i-6xvPY6cvnJUSLV1d4irqcPv60p+KwC5sx7WDDg@mail.gmail.com>
Message-ID: <CAL_Jsq+9v0i-6xvPY6cvnJUSLV1d4irqcPv60p+KwC5sx7WDDg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: regulator: twl-regulator: convert to yaml
To: Andreas Kemnade <andreas@kemnade.info>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 5:16=E2=80=AFAM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> Convert the regulator bindings to yaml.
>
> Drop one twl5030 compatible due to no documentation on mfd side and no
> users of the twl5030.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v4:
> - remove a sentence in the commit message which only applies
>   to v1 design
> - add R-by
>
> Changes in v3:
> - define regulator stuff in toplevel
> - simplified regulator-inital-mode
> - extended example to contain both regulator-initial-mode and
>   retain-on-reset
>
> Changes in v2:
> - add regulators directly to ti,twl.yaml
> - less restrictions on regulator node name
>
>  .../devicetree/bindings/mfd/ti,twl.yaml       | 166 +++++++++++++++++-
>  .../bindings/regulator/twl-regulator.txt      |  80 ---------
>  2 files changed, 164 insertions(+), 82 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regul=
ator.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Document=
ation/devicetree/bindings/mfd/ti,twl.yaml
> index c2357fecb56c..2cbdd238f48f 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> @@ -22,6 +22,32 @@ allOf:
>            contains:
>              const: ti,twl4030
>      then:
> +      patternProperties:
> +        "^regulator-":
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
> +            ti,retain-on-reset: false
> +
>        properties:
>          madc:
>            type: object
> @@ -50,13 +76,34 @@ allOf:
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
> +            regulator-initial-mode: false
> +
>        properties:
>          gpadc:
>            type: object
> @@ -69,6 +116,25 @@ allOf:
>            contains:
>              const: ti,twl6032
>      then:
> +      patternProperties:
> +        "^regulator-":
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
> +            regulator-initial-mode: false
> +
>        properties:
>          gpadc:
>            type: object
> @@ -112,6 +178,27 @@ properties:
>        interrupts:
>          maxItems: 1
>
> +patternProperties:
> +  "^regulator-":
> +    type: object
> +    unevaluatedProperties: false
> +    $ref: /schemas/regulator/regulator.yaml
> +    properties:
> +      compatible: true
> +      regulator-initial-mode:
> +        enum:
> +          - 0x08 # Sleep mode, the nominal output voltage is maintained
> +                 # with low power consumption with low load current capa=
bility
> +          - 0x0e # Active mode, the regulator can deliver its nominal ou=
tput
> +                 # voltage with full-load current capability
> +      ti,retain-on-reset:
> +        description:
> +          Does not turn off the supplies during warm
> +          reset. Could be needed for VMMC, as TWL6030
> +          reset sequence for this signal does not comply
> +          with the SD specification.
> +        type: boolean
> +
>  unevaluatedProperties: false
>
>  required:
> @@ -131,9 +218,84 @@ examples:
>          compatible =3D "ti,twl6030";
>          reg =3D <0x48>;
>          interrupts =3D <39>; /* IRQ_SYS_1N cascaded to gic */
> +        interrupt-parent =3D <&gic>;
>          interrupt-controller;
>          #interrupt-cells =3D <1>;
> -        interrupt-parent =3D <&gic>;
> +
> +        gpadc {
> +          compatible =3D "ti,twl6030-gpadc";
> +          interrupts =3D <6>;

Now a warning in linux-next:

Documentation/devicetree/bindings/mfd/ti,twl.example.dtb: gpadc:
'#io-channel-cells' is a required property
        from schema $id:
http://devicetree.org/schemas/iio/adc/ti,twl6030-gpadc.yaml#


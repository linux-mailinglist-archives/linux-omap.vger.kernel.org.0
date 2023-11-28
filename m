Return-Path: <linux-omap+bounces-44-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D347FB36C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 09:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD877281881
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C9814AAD;
	Tue, 28 Nov 2023 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i3H11+4q"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F51DB6
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 00:00:20 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-54bb260100eso233274a12.0
        for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 00:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701158418; x=1701763218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pb/LD4K4J7O6o8tSFO4eqaprfqa9C0EwYIDKy819CuQ=;
        b=i3H11+4q2hAidyOaARQaxX4hDHoNA9+lbwHuFQRMwlqT5atkKf0UsWiDv7YBCKLPig
         8kX8wrmZu6eYL+BPxhGSleGHO2pKG7EihZFCVtLTC/5XXCIeOsfhgJ12gwToGsPPfpsp
         12IqAuNZfbbfZj9km5sDOf3h2K54JwJSl+Y7GGLwNSgc1duSj5WEUjEzL94QN2mDSMMa
         /iDXH16peZVyWqcfnZKPYo5l/qKViZpvglVzPjdzRLCI/ReuAsSx7UaNUwXb+Ycj/XeI
         D4lpLQqwj0oUC/BTurbew3WDPCT1ZB9I6uBDrbCQEtrRj/qNweOddj4EgRcGoIC8Ir2r
         8yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158418; x=1701763218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb/LD4K4J7O6o8tSFO4eqaprfqa9C0EwYIDKy819CuQ=;
        b=Sxry5mpIXrSiRtHmlnOYjDsNTsJAl4UZvT2z4TYlo2K7cnAl2YbcGbJUOEcshLgaA7
         FWMUDzRwpq9p2DupF9HnOV7gaGQ3uMrd2FKohMz9vpgYninqVigG6QChmr8EQyCIkGeR
         r4H0rmPo2Jv3U9Kps2Zpg7ctJfKs7LXyAuhaMW4g0Cp2RabdvbtGvqHTIr2CUSqdg+fp
         3yNgRS2z8qxLu+iI+IEwgFjoKLbMmZc3ZH7frr7JXpNFCG9YwwJ+pRN+DpewwhLVX459
         gFV0iMDuyBd4zsxhZ1nIzhZx0vXFcAydtijLRisSFNdPyPHErrXak0R/yHV9QjuW33Bc
         NAuQ==
X-Gm-Message-State: AOJu0YxE6UKYCeWEyOPBz5+q0bmaOeUrtmWs5sDGQX6PFhMHNyWiMitD
	nbP8g94ybWMNFsAyny5CcSeJeQ==
X-Google-Smtp-Source: AGHT+IH7HP3ncW1mgGCFcf7ruE/9FxEGcVjiel/Ip7gNvdxQaXuZY6vsCUy5z+2fbMw0KwUC52f5dA==
X-Received: by 2002:a50:d4c5:0:b0:53e:1b:15f5 with SMTP id e5-20020a50d4c5000000b0053e001b15f5mr9018543edj.39.1701158418600;
        Tue, 28 Nov 2023 00:00:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id ck7-20020a0564021c0700b0054b1360dd03sm4176395edb.58.2023.11.28.00.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:00:18 -0800 (PST)
Message-ID: <7a62ed8a-b0e3-4881-90d7-b8f5d38e482e@linaro.org>
Date: Tue, 28 Nov 2023 09:00:16 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Content-Language: en-US
To: Andreas Kemnade <andreas@kemnade.info>, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, kristo@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20231127202359.145778-1-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231127202359.145778-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 21:23, Andreas Kemnade wrote:
> Convert the OMAP interface clock device tree binding to json-schema
> and fix up reg property which is optional and taken from parent if
> not specified.
> Specify the creator of the original binding as a maintainer.
> 

...

> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
> new file mode 100644
> index 0000000000000..48a54caeb3857
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,interface-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments interface clock.
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description: |
> +  This binding uses the common clock binding[1]. This clock is

Drop first sentence, useless. Can a clock binding not use common clock
binding?

> +  quite much similar to the basic gate-clock[2], however,
> +  it supports a number of additional features, including
> +  companion clock finding (match corresponding functional gate
> +  clock) and hardware autoidle enable / disable.
> +
> +  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +  [2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap3-interface-clock           # basic OMAP3 interface clock
> +      - ti,omap3-no-wait-interface-clock   # interface clock which has no hardware
> +                                           # capability for waiting clock to be ready
> +      - ti,omap3-hsotgusb-interface-clock  # interface clock with USB specific HW handling
> +      - ti,omap3-dss-interface-clock       # interface clock with DSS specific HW handling
> +      - ti,omap3-ssi-interface-clock       # interface clock with SSI specific HW handling
> +      - ti,am35xx-interface-clock          # interface clock with AM35xx specific HW handling
> +      - ti,omap2430-interface-clock        # interface clock with OMAP2430 specific HW handling

Blank line

> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  reg:
> +    description:
> +      if not specified, value from parent is used

Eh, what? How? Either this is on the bus or not. You added it, because
it wasn't even in the original binding. Then please explain what does it
mean?

> +    maxItems: 1
> +
> +  ti,bit-shift:
> +    description:
> +      bit shift for the bit enabling/disabling the clock
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'

reg is required. Device cannot take "reg" from parent, DTS does not work
like this.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      aes1_ick: aes1-ick@48004a14 {

clock-controller@


> +        #clock-cells = <0>;
> +        compatible = "ti,omap3-interface-clock";
> +        clocks = <&security_l4_ick2>;
> +        reg = <0x48004a14 0x4>;
> +        ti,bit-shift = <3>;
> +      };
> +

And drop rest of examples - they do not bring anything different.



Best regards,
Krzysztof



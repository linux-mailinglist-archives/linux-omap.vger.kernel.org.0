Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6C151BA6C
	for <lists+linux-omap@lfdr.de>; Thu,  5 May 2022 10:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349004AbiEEIc7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 May 2022 04:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349031AbiEEIcy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 May 2022 04:32:54 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135703AA4B
        for <linux-omap@vger.kernel.org>; Thu,  5 May 2022 01:29:15 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id kq17so7321778ejb.4
        for <linux-omap@vger.kernel.org>; Thu, 05 May 2022 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r1ONu4s4iEqTc1LBebyXg4nKGWbafPc2J0KdemsntpY=;
        b=edknxnsQZ7hN0sFSDhsHS9VCi8jrauwubYjQhb70ivFiLSHkzVb7z/ZZDIK/BZz7KS
         TTjBot8KBAzHHb2eHoyhoBERT3nKPWDmzXKtGtHTttVR0oPcgmWGBiNQmd/okLD7Nldj
         bbF+Sleyj4/VbC0iO3jn2NYHBHfKA/JMLEuLqi0qZdsvj04gpKrIRMcefx7f7+QBpcMi
         tNmXLE+7nAAOmfkZ6CI5TLPSOw2ywb4KtIJPyu6faPkBSZ6qtfkrp7hW/ebe+ypwEjNX
         P4jtdKfzxyLfm+fieZjl4SdGH4sjBDN13lttEUZA0XQds70vBkR5h0k/K29IkCS5AN+A
         zklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r1ONu4s4iEqTc1LBebyXg4nKGWbafPc2J0KdemsntpY=;
        b=tPe4GapLyD2yqxOnTSraEjmjCZSGv5ElmxhDKkAQee9K3S7JukuCT2QRE7XoIVty8z
         lC00XR3B7tTUZ+RlFfGmjYdHgdEanSrkr0zBs1jSgmSuGL3Y/cHmth44E0ILLF4ESVEq
         Ui5YovqUmrNxrZTz9YQAaZ6/tT3/jHNozY+GxfIZEMBWyWbmdMC1mjF5+152DuIGhC5/
         GNLKQ0bwxztQ/aOt+b4G00xcYmtBvEotxDhl5eKNH25y7Eq0vX10Aop7GfDOORupJPsm
         6qde0BFexS98P9lNYXBTFUUexnwKrpIBHKjWm585NcxttZPmg+CDHFk3jz3ePiWJ2Nh3
         tOFA==
X-Gm-Message-State: AOAM533JLrMNlzvY0NZiUeORxKfmvQ/CJdOX4eXg6e11/q5ezpu+zyY1
        669OrgDDJ3a4mEhD8XpSuAt4cA==
X-Google-Smtp-Source: ABdhPJxw9q1w3VyKXums+Q+aXrIVReNi1wHYk414TPadm+8sGRGqWaf8U8rKWnbv39OdiIHFP3CpOw==
X-Received: by 2002:a17:907:72ca:b0:6f3:f6e5:9085 with SMTP id du10-20020a17090772ca00b006f3f6e59085mr24412656ejc.628.1651739353584;
        Thu, 05 May 2022 01:29:13 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a12-20020a50f0cc000000b00425d6c76494sm517695edm.1.2022.05.05.01.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 01:29:13 -0700 (PDT)
Message-ID: <70c49385-6fa2-2cb9-8a82-3e28f0fc2064@linaro.org>
Date:   Thu, 5 May 2022 10:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/4] dt-bindings: input: mt-matrix-keypad: add guardian mt
 matrix keypad bindings definition
Content-Language: en-US
To:     Gireesh.Hiremath@in.bosch.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, bcousson@baylibre.com,
        tony@atomide.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com,
        mkorpershoek@baylibre.com, davidgow@google.com,
        m.felsch@pengutronix.de, swboyd@chromium.org,
        fengping.yu@mediatek.com, y.oudjana@protonmail.com,
        rdunlap@infradead.org, colin.king@intel.com
Cc:     sjoerd.simons@collabora.co.uk, VinayKumar.Shettar@in.bosch.com,
        Govindaraji.Sivanantham@in.bosch.com, anaclaudia.dias@de.bosch.com
References: <20220504105254.1576-1-Gireesh.Hiremath@in.bosch.com>
 <20220504105254.1576-4-Gireesh.Hiremath@in.bosch.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504105254.1576-4-Gireesh.Hiremath@in.bosch.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04/05/2022 12:52, Gireesh.Hiremath@in.bosch.com wrote:
> From: Gireesh Hiremath <Gireesh.Hiremath@in.bosch.com>
> 
> Add binding definition for the support of the Guardian
> mt matrix keypad driver.
> 
> Signed-off-by: Gireesh Hiremath <Gireesh.Hiremath@in.bosch.com>
> ---
>  .../bindings/input/mt-matrix-keypad.yaml      | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mt-matrix-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mt-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/mt-matrix-keypad.yaml
> new file mode 100644
> index 000000000000..b52cd478f638
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mt-matrix-keypad.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/mt-matrix-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO driven mt matrix keypad device tree bindings
> +
> +maintainers:
> +  - vinay <VinayKumar.Shettar@in.bosch.com>
> +
> +description: |
> +  GPIO driven mt matrix keypad is used to interface a SoC with a mt matrix
> +  keypad. The mt matrix keypad supports multiple gpio line, all gpio line act

s/line/lines/

> +  as row as wel as column lines, a key can be placed at each intersection

s/wel/well/

> +  of a unique row number not equal to a unique column and they are diagonally
> +  symmetric.
> +

What is "mt" in the "mt matrix"?

> +  Example- For 5 gpio lines, possible matrix is 5x5 and maximum possible
> +        keys are 10.
> +
> +        Sample matrix table for 7 button and 5 gpio line
> +
> +        ------------------------------------------------------
> +        |Row\Col |GPIO 0 | GPIO 1 | GPIO 2 | GPIO 3 | GPIO 4 |
> +        ------------------------------------------------------
> +        | GPIO 0 |  X    | KEY_9  | KEY_2  |   X    | KEY_1  |
> +        ------------------------------------------------------
> +        | GPIO 1 | KEY_9 |  X     | KEY_6  |   X    |  X     |
> +        ------------------------------------------------------
> +        | GPIO 2 | KEY_2 | KEY_6  |  X     | KEY_4  | KEY_7  |
> +        ------------------------------------------------------
> +        | GPIO 3 |  X    |  X     | KEY_4  |  X     | KEY_8  |
> +        ------------------------------------------------------
> +        | GPIO 4 | KEY_1 |  X     | KEY_7  | KEY_8  |  X     |
> +        ------------------------------------------------------
> +        X - invalid key
> +        KEY_x - preferred key code
> +
> +  The mt matrix keypad can sense a key-press and key-release by means of GPIO
> +  lines and report the event using GPIO interrupts to the cpu.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: gpio-mt-matrix-keypad
> +      - items:
> +          - enum:
> +              - gpio-mt-matrix-keypad
> +          - const: gpio-mt-matrix-keypad

Aren't all these compatibles the same?

> +
> +  debounce-delay-ms:
> +    description: Delay after the first bounce of button.
> +    default: 0
> +
> +  col-scan-delay-us:
> +    description: Delay before scanning next active line.
> +    default: 0
> +
> +  number-of-button:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of button connected to the keypad controller.

s/button/buttons/ I presume.

> +
> +  linux,no-autorepeat:
> +    description: |
> +      Disable the Linux input system's autorepeat feature on the input device.
> +
> +  gpio-activelow:
> +    description: Gpio line are active low.

No, GPIOs should instead use common flags.

> +
> +  line-gpios:
> +    description: |
> +      Gpio lines connected to keypad controller.
> +      all gpio line act as row as wel as column lines.
> +
> +  linux,keymap:
> +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    description: |
> +      An array of packed 1-cell entries containing the equivalent of row,
> +      column and linux key-code. The 32-bit big endian cell is packed as:
> +          row << 24 | column << 16 | key-code

But anyway this should be just merged into matrix-keypad. It's a simpler
set of that binding.

> +
> +required:
> +  - compatible
> +  - number-of-button
> +  - line-gpios
> +  - linux,keymap
> +
> +additionalProperties: true

This cannot be true.

> +
> +examples:
> +  - |
> +    mt_matrix_keypad {

No underscores in node names. Generic node name, so just "keypad".



Best regards,
Krzysztof

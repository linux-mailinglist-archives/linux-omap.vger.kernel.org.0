Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4A9190CE5
	for <lists+linux-omap@lfdr.de>; Tue, 24 Mar 2020 12:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgCXL6G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Mar 2020 07:58:06 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35774 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgCXL6F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Mar 2020 07:58:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id d5so8716943wrn.2
        for <linux-omap@vger.kernel.org>; Tue, 24 Mar 2020 04:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yGWbv+avZe9DlLrVjdiu2FVkeNMpW1rLtryrfV1bKXI=;
        b=nVR2GiwCz1Z+pMqdaVElFU10oWASHJmPcAq1126SngVOQyOxlOt3Q90bTfWVyVKcWI
         m33DWy7cBdLqRrzvGK5c5hOsfASP3uoP3flOvhxp+2DgH92hYafi+VYHW468JLtBJLaV
         v05LY47aRGGKpKdMgnwvGZmBhWL2TlC7zs2wqe0rGMaRQtnholprn77m4M3pSxQSyXtN
         MKLysig6Iv7GZ1hUnO34gq0/JKNBjhRXzuploG0XTzp7AowQr4qXf/LAPG3Aa/2kfOc5
         2N9FJQ+Kbm75nVJp1osYu+M3RvLrTEL+98HtdzgKsGQRzI1/KkHGG1Uu1dWxjYZEqYSc
         drag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yGWbv+avZe9DlLrVjdiu2FVkeNMpW1rLtryrfV1bKXI=;
        b=QeEGsAB0hPKDbk8+B0p6JGcT4LJ1xQHwVyQcddvifsMKpfIVGj9gTjblZbsk80Patk
         Q8GkYGGEE+iDjH7FeMKOPbKI0BscxARGUG9vzAV0Ka0/ClY5Ep6GD/3hz+0RYXAbezAQ
         OHUPjYjPd0Asw0Oe7hooRHKNmXlWiAsPYJNehIfieqYLcjsgcVwn+cv+2TgdWhixuEVu
         sJiUiMf6gkKEnLRq21hm0skrJSsYvC5VFhOlnGg8ayOBdmxLtUh19JhRIl3o5XfvuBpC
         eCRrRG2SUljQwxxteFJ1QtTAxc/NyURjoS6D8tJ/c1eOMpelesFSAOtSu12cRNiSa7Yo
         0bOg==
X-Gm-Message-State: ANhLgQ2ruPnbCca4qShgWxhrhf6NcBHAAoEpFnIRzKW5hsg17zGGe5IV
        H6VsA8eQAFkYIWC0oAIi7oLaYg==
X-Google-Smtp-Source: ADFU+vsCxnZDe2XY35nTpDg5vCgnBled/yGH5q/Z4dMMZ0fhSq4qXi2GlkK8ckWDNSoCVLjg3sSbbg==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr24604150wro.66.1585051083726;
        Tue, 24 Mar 2020 04:58:03 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id w204sm4213338wma.1.2020.03.24.04.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 04:58:03 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:58:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: mfd: motmdm: Add binding for
 motorola-mdm
Message-ID: <20200324115852.GB442973@dell>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200319173755.65082-4-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> Add a binding document for Motorola modems controllable by
> TS 27.010 UART line discipline using serdev drivers.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> [tony@atomide.com: moved to live under bindings/serdev]
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../serdev/motorola,mapphone-mdm6600.yaml     | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml

Nit: subject line is out of date.

> diff --git a/Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml b/Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serdev/motorola,mapphone-mdm6600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola Mapphone MDM6600 Modem
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: motorola,mapphone-mdm6600-serial
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb
> +
> +required:
> +  - compatible
> +  - phys
> +  - phy-names
> +
> +examples:
> +  - |
> +    modem {
> +        compatible = "motorola,mapphone-mdm6600-serial";
> +        phys = <&fsusb1_phy>;
> +        phy-names = "usb";
> +    };

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

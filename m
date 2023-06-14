Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCE3730B54
	for <lists+linux-omap@lfdr.de>; Thu, 15 Jun 2023 01:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjFNXRC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Jun 2023 19:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbjFNXQ7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Jun 2023 19:16:59 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F342295D;
        Wed, 14 Jun 2023 16:16:18 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-777a78739ccso395088839f.3;
        Wed, 14 Jun 2023 16:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686784543; x=1689376543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6h1SH+KPupH0y0aqvJqt12V2TdAsnl1nbLJ9iHmf7o=;
        b=c9mO3cZc9HIdEEAwryrFM3HCOSlQl9hsjiX6xewL8ai2zO153ZPR0gc1RHCMBs3gVj
         Kz/Zjk0xZymBn5As4Pc8ITrjXtasO/t9zAVPmkbhMCTOTvhobKaSVCzWJw2KMDDZaHlt
         0y8DaP7sv1MBMsdXbJUJaLf56Jn3ycg01kRfRmaniM/Jjsl8SXLHMXnOs6malf6uVpwN
         L0FFkf9e86a2U0i6TnyH8K6Ws1CgvNecHySjlItBCe74UVXuSluLBTlcxavFpXxdVk4i
         oYn0kMKmHPJbOSeKEdQRN1kUVYSZuvlJkSA9ICVL4zQJCWs6ooIjvQJcATwRY/dxbxdd
         BKnw==
X-Gm-Message-State: AC+VfDzvOKS3TPP4lTJMvLfryR00Rckq/pwHUDuCdNAadJ+yzN/SZnO4
        46vwnklClq6OLNYB5tIarJfNkhlySw==
X-Google-Smtp-Source: ACHHUZ7wQeyYnIwDBLnmBdri7Vyhsn6rPMIrim2mugZblLdL62WV8QD9wkuKJT5uzWp1PU2osL8HPA==
X-Received: by 2002:a05:6602:196:b0:777:b7f9:18f1 with SMTP id m22-20020a056602019600b00777b7f918f1mr16682656ioo.17.1686784542761;
        Wed, 14 Jun 2023 16:15:42 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f13-20020a5ec60d000000b007749b74ab18sm5680520iok.15.2023.06.14.16.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 16:15:41 -0700 (PDT)
Received: (nullmailer pid 3103614 invoked by uid 1000);
        Wed, 14 Jun 2023 23:15:39 -0000
Date:   Wed, 14 Jun 2023 17:15:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: extcon-usb-gpio: convert to DT schema
 format
Message-ID: <20230614231538.GA3075226-robh@kernel.org>
References: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
 <5217a54e-353b-bd48-68fa-d2104accfeb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5217a54e-353b-bd48-68fa-d2104accfeb9@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 12, 2023 at 10:29:16AM +0200, Krzysztof Kozlowski wrote:
> On 08/06/2023 10:11, Alexander Stein wrote:
> > Convert the binding to DT schema format. Change the GPIO properties to new
> > naming convention using -gpios as well.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
> >  .../bindings/extcon/extcon-usb-gpio.yaml      | 52 +++++++++++++++++++
> >  2 files changed, 52 insertions(+), 21 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> >  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> > deleted file mode 100644
> > index dfc14f71e81fb..0000000000000
> > --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -USB GPIO Extcon device
> > -
> > -This is a virtual device used to generate USB cable states from the USB ID pin
> > -connected to a GPIO pin.
> > -
> > -Required properties:
> > -- compatible: Should be "linux,extcon-usb-gpio"
> > -
> > -Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
> > -- id-gpio: gpio for USB ID pin. See gpio binding.
> > -- vbus-gpio: gpio for USB VBUS pin.
> > -
> > -Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
> > -	extcon_usb1 {
> > -		compatible = "linux,extcon-usb-gpio";
> > -		id-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> > -	}
> > -
> > -	&omap_dwc3_1 {
> > -		extcon = <&extcon_usb1>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> > new file mode 100644
> > index 0000000000000..3a71d848dc7a8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/extcon/extcon-usb-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB GPIO Extcon device
> > +
> > +maintainers:
> > +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> > +
> > +description: |

Don't need '|'

> > +  This is a virtual device used to generate USB cable states from the
> > +  USB ID pin connected to a GPIO pin.

Please add 'deprecated: true' here. New designs should use a USB 
connector node binding.

> > +
> > +properties:
> > +  compatible:
> > +    const: linux,extcon-usb-gpio
> > +
> > +  id-gpios:
> > +    description: An input gpio for USB ID pin.
> > +    maxItems: 1
> > +
> > +  vbus-gpios:
> > +    description: An input gpio for USB VBus pin, used to detect presence of
> > +      VBUS 5V.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +
> > +anyOf:
> 
> oneOf instead

anyOf is correct. Both can be present.

> 
> > +  - required:
> > +      - id-gpios
> > +  - required:
> > +      - vbus-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    extcon_usb1 {
> 
> No underscores, generic node names, so just "extcon-usb"
> 
> > +      compatible = "linux,extcon-usb-gpio";
> > +      id-gpios = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> > +      vbus-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>;
> > +    };
> > +
> > +    usb-controller {
> > +      extcon = <&extcon_usb1>;
> > +    };
> 
> Drop controller, no need to add consumers in a provider's binding.
> 
> Best regards,
> Krzysztof
> 

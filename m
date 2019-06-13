Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C159244E78
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 23:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfFMV2n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 17:28:43 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41680 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMV2m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Jun 2019 17:28:42 -0400
Received: by mail-qt1-f195.google.com with SMTP id 33so128387qtr.8;
        Thu, 13 Jun 2019 14:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=br2bl3VJkXVRPZRHNgYzbC/ehG2FQqZ7sIoSvLav/o4=;
        b=Gszq2/mSLn/dJrsyvk4rRLEyNjZ6QuF9W96OQIGbB4GTZ/MyR24lEoI/65mHiidH91
         w2WovRpmPzb8v6Z5J9QOoLRBRHmwVXP7actumLpjtiLPy8D9VWHbVNDc+mDO0rO40kWS
         DESecmCIJ9Y+3iOQmS+Tz9hz4kO+yjsgzLc0ZPi7RtFvY2jxhr8BqK5WhsYWnueR75uU
         25mIi5sop8UMQC6RcKstZTO6Mod/7/PYp7MY9pSHzsbSgRBBMy5V5Z0yGrk26KPoXWGO
         HWFZAsX1E42vA5paP0f+UJ0vsHCNGcHgJ0iLG7SaWsimCVwMCr6YEXnlNNt1Ns2FEVG1
         zhUA==
X-Gm-Message-State: APjAAAVnNI4CqJnqLmEXgP7FsbjFPz5TNI49iiNXxEK+4o92+/7a6kLy
        L8D1UCVr2pOvlcgMEOM6Pg==
X-Google-Smtp-Source: APXvYqzkDDD1eG9eQFojGtBeXwWVDtxmKGm5yq7U6XK2t/sOfUWwfaQAUzl1Zj3zOiSTjCEIb9D6cQ==
X-Received: by 2002:ac8:685:: with SMTP id f5mr3113629qth.9.1560461321718;
        Thu, 13 Jun 2019 14:28:41 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id u19sm611563qka.35.2019.06.13.14.28.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 14:28:40 -0700 (PDT)
Date:   Thu, 13 Jun 2019 15:28:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     lee.jones@linaro.org, broonie@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: lp87565: Add lp87561
 configuration
Message-ID: <20190613212838.GA21714@bogus>
References: <20190516043218.8222-1-j-keerthy@ti.com>
 <20190516043218.8222-2-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516043218.8222-2-j-keerthy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 16, 2019 at 10:02:16AM +0530, Keerthy wrote:
> lp87561 is a single output 4-phase regulator configuration.
> Add support for the same.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  .../devicetree/bindings/mfd/lp87565.txt       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/lp87565.txt b/Documentation/devicetree/bindings/mfd/lp87565.txt
> index a48df7c08ab0..41671e0dc26b 100644
> --- a/Documentation/devicetree/bindings/mfd/lp87565.txt
> +++ b/Documentation/devicetree/bindings/mfd/lp87565.txt
> @@ -41,3 +41,39 @@ lp87565_pmic: pmic@60 {
>  		};
>  	};
>  };
> +
> +TI LP87561 PMIC:
> +
> +This is a single output 4-phase regulator configuration
> +
> +Required properties:
> +  - compatible:	"ti,lp87561-q1"
> +  - reg:		I2C slave address.
> +  - gpio-controller:	Marks the device node as a GPIO Controller.
> +  - #gpio-cells:	Should be two.  The first cell is the pin number and
> +			the second cell is used to specify flags.
> +			See ../gpio/gpio.txt for more information.
> +  - xxx-in-supply:	Phandle to parent supply node of each regulator
> +			populated under regulators node. xxx should match
> +			the supply_name populated in driver.

This is not something we can validate. You need to enumerate values of 
'xxx'.

> +Example:
> +
> +lp87561_pmic: pmic@62 {
> +	compatible = "ti,lp87561-q1";
> +	reg = <0x62>;
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +
> +	buck3210-in-supply = <&vsys_3v3>;
> +
> +	regulators: regulators {
> +		buck3210_reg: buck3210 {
> +			/* VDD_CORE */
> +			regulator-name = "buck3210";
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +	};
> +};
> -- 
> 2.17.1
> 

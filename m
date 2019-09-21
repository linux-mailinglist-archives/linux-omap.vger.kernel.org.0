Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF64FB9F83
	for <lists+linux-omap@lfdr.de>; Sat, 21 Sep 2019 21:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfIUTHN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 Sep 2019 15:07:13 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60584 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfIUTHN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 21 Sep 2019 15:07:13 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8458B2002D;
        Sat, 21 Sep 2019 21:07:09 +0200 (CEST)
Date:   Sat, 21 Sep 2019 21:07:08 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        adam.ford@logicpd.com, Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20190921190708.GB32133@ravnborg.org>
References: <20190917161214.2913-1-aford173@gmail.com>
 <20190917161214.2913-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917161214.2913-2-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=TaQvIJAheEgyp50s76YA:9 a=CjuIK1q_8ugA:10
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam.

Good with even more panels.
But for new bindings please use meta-schema (.yaml) format.
This is what we use for new bindings as it allows better
validation.

	Sam

On Tue, Sep 17, 2019 at 11:12:12AM -0500, Adam Ford wrote:
> This patch adds documentation of device tree bindings for the WVGA panel
> Logic PD Type 28 display.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt b/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt
> new file mode 100644
> index 000000000000..829fc5210e06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt
> @@ -0,0 +1,26 @@
> +Logic PD Type 28 4.3" WQVGA TFT LCD panel
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> +
> +Required properties:
> +- compatible: should be "logicpd,type28"
> +
> +Optional properties:
> +- power-supply: regulator to provide the supply voltage
> +- enable-gpios: GPIO pin to enable or disable the panel
> +- backlight: phandle of the backlight device attached to the panel
Is it correct that these are optional for the descrivbed panel?

> +
> +Optional nodes:
> +- Video port for RGB input.
> +
> +Example:
> +	lcd0: display {
> +		compatible = "logicpd,type28";
> +		enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> +		port {
> +			lcd_in: endpoint {
> +				remote-endpoint = <&dpi_out>;
> +			};
> +		};
> +	};
> -- 
> 2.17.1
